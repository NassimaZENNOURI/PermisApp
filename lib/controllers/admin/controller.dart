

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permisapp/apiFunctions/AdminFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/functions.dart';

class Controller extends GetxController{

  AdminFunctions a = AdminFunctions();

  delete(context,String type , int id , Widget widget ) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (type == 'candidat') {
      var response = await a.deleteCandidat(token, id);

      if(response.statusCode == 200){
        showAchievementView(true,tr('candidat_supprime_avec_success'));
        Get.offAll(widget);
        update();
      }
      update();
    }
    else if(type=='coatch'){
      var response = await a.deleteCoach(token, id);

      if(response.statusCode == 200){
        showAchievementView(true,tr('coatch_supprime_avec_success'));
        Get.offAll(widget);
        update();
      }
      update();
    }
    else if (type=='seance'){
      var response = await a.deleteSeance(token, id);

      if(response.statusCode==200){
        showAchievementView(true,tr('seance_supprime_avec_success'));
        Get.offAll(widget);
        update();
      }
      update();
    }
    else if(type=='facture'){
      var response = await a.deleteFacture(token, id);

      if(response.statusCode==200){
        showAchievementView(true,tr('facture_supprime_avec_success'));
        Get.offAll(widget);
        update();
      }
      update();
    }
    else if(type=='user'){
      var response = await a.deleteUser(token, id);

      if(response.statusCode==200){
        showAchievementView(true,tr('user_supprime_avec_success'));
        Get.offAll(widget);
        update();
      }
      update();
    }
    else if(type=='school'){
      var response = await a.deleteSchool(token, id);

      if(response.statusCode == 200){
        showAchievementView(true,tr('auto_ecole_supprime_avec_success'));
        Get.offAll(widget);
        update();
      }
      update();
    }
    else{
      showAchievementView(false, tr('erreur_dans_le_serveur'));
    }
  }

  deleteCar(context, int id , Widget widget ) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var tes = await a.deleteCar(token, id);
    if (tes.statusCode == 200) {
      showAchievementView(true, tr('deleted'));
      Get.offAll(widget);
      update();
    } else {
      showAchievementView(false, tes.body);
    }
  }

}