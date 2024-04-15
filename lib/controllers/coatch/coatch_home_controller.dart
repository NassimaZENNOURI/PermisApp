
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:permisapp/utils/models/Moniteur.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/appVars.dart';
import '../../apiFunctions/CoachFunctions.dart';
import '../../apiFunctions/Functions.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';

class CoatchHomeController extends GetxController{

  Moniteur coach =  Moniteur();
  List<Seance> seances = [];
  Candidat candidat = Candidat();
  List<Candidat> candidats=[];
  Functions func = Functions();
  var candidatLength = 0 ;
  RxBool isLoading = false.obs;
  bool isar = true;
  CoatchFunctions function = CoatchFunctions();
  void Function(void Function())? setState;
  DateTime timeOfDay = DateTime.now();
  String periodDay = '';


  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      coach = Moniteur.fromJson(response);
      update();
      return coach;
    });
  }

  getCandidatLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var jsonResponse = json.decode(value.body);
      function.getCoachCandidat(token,jsonResponse['id'] , 'false').then((value){
        if(value.statusCode == 200){
          var response = jsonDecode(value.body).toList();
          candidatLength = response.length;
          update();
        }
        else {
          Get.snackbar(tr('error'), tr('ErrorLength'),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  getCoatchSeance() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var jsonResponse = json.decode(value.body);
      function.coachSeance(token, jsonResponse['id'], 'false').then((value){ /// change to true
        if (value.statusCode == 201) {
          var jsonResponse = json.decode(value.body);
          for(var element in jsonResponse ){
            seances.add(Seance.fromJson(element));
          }
          update();
        }
      });
    });
  }

  getCoatchCandidat() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var jsonResponse = json.decode(value.body);
      function.getCoachCandidat(token,jsonResponse['id'] , 'false').then((value){ /// Change to true
        if(value.statusCode == 200){
          var jsonResponse = json.decode(value.body);
          for(var i = 0 ; i < jsonResponse.length ; i++){
            candidat = Candidat.fromJson(jsonResponse[i]);
            candidats.add(candidat);
          }
          update();
        }
        else {
          Get.snackbar(tr('error'), tr('ErrorFetch'),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
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

  changeToFrench(BuildContext context){
    context.locale = const Locale('fr');
    Get.updateLocale(const Locale('fr'));
    update();
  }
  changeToArabic(BuildContext context){
    context.locale = const Locale('ar');
    Get.updateLocale(const Locale('ar'));
    update();
  }
  IconChange(BuildContext context){
    String curr = context.currentLocale.toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
  }

  @override
  void onInit() {
    isLoading.value =  true;
    update();
    getUser().then((value){
      getCandidatLength().then((value){
        getCoatchCandidat().then((value){
          getCoatchSeance().then((value){
            afterFirstLayout();
            isLoading.value =  false;
            update();
          });
        });
      });
    });
    super.onInit();
  }


}