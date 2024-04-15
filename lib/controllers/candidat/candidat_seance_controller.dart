
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/appVars.dart';
import '../../apiFunctions/CandidatFunctions.dart';
import '../../utils/models/Seance.dart';

class CandidatSeancesListController extends GetxController{

  CandidatFunctions functions = CandidatFunctions();
  Seance seance = Seance();
  List<Seance> seances =[];
  var isloading = false.obs ;



  fetchCandidatSeances() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    functions.getCandidatSeances(token, "false").then((value){
      if(value.statusCode == 200){
        var jsonResponse = json.decode(value.body);
        for(var i = 0 ; i < jsonResponse.length ; i++){
          seance = Seance.fromJson(jsonResponse[i]);
          seances.add(seance);
        }
        isloading.value = false;
        update();
      }
      else {
        Get.snackbar(tr('error'), tr('ErrorCandidat'),
            colorText: Colors.white, backgroundColor: dangerColor);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    isloading.value = true ;
    update();
    fetchCandidatSeances().then((value){
      update();
    });
  }

}