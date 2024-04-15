
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/appVars.dart';
import '../../apiFunctions/CoachFunctions.dart';
import '../../apiFunctions/Functions.dart';
import '../../utils/models/Candidat.dart';

class CoachCandidatListController extends GetxController{

  CoatchFunctions function = CoatchFunctions();
  TextEditingController searchController = TextEditingController();
  Functions func = Functions();
  Candidat candidat = Candidat();
  List<Candidat> candidats = [];
  var isLoading = false.obs ;


  fetchCoachCandidat() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var jsonResponse = json.decode(value.body);
      function.getCoachCandidat(token,jsonResponse['id'] , 'false').then((value){
        if(value.statusCode == 200){
          var jsonResponse = json.decode(value.body);
          for(var i = 0 ; i < jsonResponse.length ; i++){
            candidat = Candidat.fromJson(jsonResponse[i]);
            candidats.add(candidat);
          }
          isLoading.value = false ;
          update();
        }
        else {
          Get.snackbar(tr('error'), tr("ErrorCoach"),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  List<Candidat> search()  {
    if (searchController.text.isEmpty) {
      return candidats;
    } else {
      return candidats.where((element) {
        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    isLoading.value = true ;
    update();
    fetchCoachCandidat().then((value){
      update();
    });
    super.onInit();
  }

}