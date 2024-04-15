
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/admin/admin_home_screen.dart';
import '../../Screens/admin/detail_inscription.dart';
import '../../utils/models/Inscription.dart';
import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/Seance.dart';
import '../../utils/models/school.dart';
import 'admin_length_controller.dart';


class ListInscriprionController extends GetxController{

  AdminFunctions a = AdminFunctions();
  AdminLengthController adminController = AdminLengthController();
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  Schools school = Schools();
  List<Inscription> inscriptions =[] ;
  List<Inscription> list =[] ;
  Inscription inscrip = Inscription();



  fetchInscriptions() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.getInscription(token);
    print(response.statusCode);
    if(response.statusCode == 200 ){
      var jsonResponse = jsonDecode(response.body) ;
      for(var i = 0 ; i < jsonResponse.length ; i++ ){
        inscrip = Inscription.fromJson(jsonResponse[i]);
        inscriptions.add(inscrip);
      }
      isLoading.toggle();
      update();
    }
  }

  List<Inscription> search()  {

    if (searchController.text.trim().isEmpty) {
      return inscriptions;
    } else {
      return inscriptions.where((element) {
        return element.fullname!.toLowerCase().contains(searchController.text.toLowerCase()) ||element.email!.toLowerCase().contains(searchController.text.toLowerCase()) ||element.email!.toLowerCase().contains(searchController.text.toLowerCase()) ;
      }).toList();
    }
  }


  acceptUpdate(int id , int status) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response =await a.updateInscription(token, id, 1);
    status = 1 ;
    update();
    if(response.statusCode == 200){
      Get.snackbar(
          StringTranslateExtension('success').tr(),
          StringTranslateExtension('inscription_verifiee').tr() ,
      );
      Get.offAll(AdminHomeScreen());
      update();
    }
    else{
      Get.snackbar(
          StringTranslateExtension('error').tr(),
          StringTranslateExtension('Email_Dupplicated').tr(),
        backgroundColor: Colors.red,
        colorText: Colors.white
      );
    }
  }



  @override
  void onInit() {
    isLoading.toggle();
    update();
    fetchInscriptions().then((value){
      inscriptions= value ;
      isLoading.toggle();
      update();
    });
    super.onInit();
  }

}