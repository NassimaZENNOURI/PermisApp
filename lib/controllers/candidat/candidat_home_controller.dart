
import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/appVars.dart';
import '../../apiFunctions/CandidatFunctions.dart';
import '../../apiFunctions/Functions.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';

class CandidatHomeController extends GetxController{

  Functions func = Functions();
  CandidatFunctions functions = CandidatFunctions();
  Candidat candidat = Candidat();
  Seance seance = Seance();
  List<Seance> seances =[];
  var isloading = false.obs ;
  void Function(void Function())? setState;
  DateTime timeOfDay = DateTime.now();
  String periodDay = '';


  fetchCandidatSeances() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    functions.getCandidatSeances(token, "true").then((value){ /// changer to true
      if(value.statusCode == 200){
        var jsonResponse = json.decode(value.body);
        for(var i = 0 ; i < jsonResponse.length ; i++){
          seance = Seance.fromJson(jsonResponse[i]);
          seances.add(seance);
        }
        update();
      }
      else {
        Get.snackbar(tr('error'), tr('ErrorCandidat'),
            colorText: Colors.white, backgroundColor: dangerColor);
      }
    });
  }

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      candidat = Candidat.fromJson(response);
      update();
      return candidat;
    });
  }

  void afterFirstLayout() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState?.call(() {
        timeOfDay = DateTime.now();
      });
      setState?.call(() {
        periodDay = '${TimeOfDay.now().period}';
      });
    });
  }

  @override
  void onInit() {
    isloading.value = true;
    update();
    getUser().then((value) {
      fetchCandidatSeances().then((value) {
        isloading.value = false;
        update();
      });
    });
  }
}