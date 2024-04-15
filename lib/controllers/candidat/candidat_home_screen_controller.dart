
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/appVars.dart';
import '../../apiFunctions/CandidatFunctions.dart';
import '../../apiFunctions/Functions.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';

class CandidatHomeScreenController extends GetxController{

  Functions func = Functions();
  CandidatFunctions functions = CandidatFunctions();
  Candidat candidat = Candidat();
  Seance seance = Seance();
  List<Seance> seances =[];
  var isloading = false.obs ;


  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      candidat = Candidat.fromJson(response);
      isloading.value = false ;
      update();
      return candidat;
    });
  }


  @override
  void onInit() {
    isloading.value = true;
    update();
    getUser().then((value){
        update();
    });
    super.onInit();
  }

}