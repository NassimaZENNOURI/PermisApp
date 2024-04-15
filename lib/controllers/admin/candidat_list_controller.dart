

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/models/Candidat.dart';
import '../../apiFunctions/AdminFunctions.dart';
import 'admin_length_controller.dart';

class ListCandidatController extends GetxController{

  TextEditingController searchController = TextEditingController();
  AdminLengthController adminController = AdminLengthController();
  List<Candidat> candidats = [];
  Candidat candidat = Candidat();
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    fetchCandidats();
    super.onInit();
  }

  fetchCandidats() async {
    isLoading.value = true ;
    update();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    AdminFunctions a = AdminFunctions();
    var response = await a.getCandidats(token);
    if(response.statusCode == 200 ){
      var jsonResponse = json.decode(response.body) ;

      for(var i = 0 ; i < jsonResponse.length ; i++ ){
        jsonResponse[i]['status'] = jsonResponse[i]['status'].toString();
        candidat = Candidat.fromJson(jsonResponse[i]) ;
        candidats.add(candidat);
      }
      isLoading.value = false ;
      update();

    }

  }

  List<Candidat> search()  {

    if (searchController.text.isEmpty) {
      return candidats;
    } else {

      return candidats.where((element) {

        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase()) ;
      }).toList();
      }
    }
  }



