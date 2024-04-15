

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/models/school.dart';
import '../../apiFunctions/AdminFunctions.dart';
import 'admin_length_controller.dart';

class ListSchoolController extends GetxController{

  AdminFunctions a = AdminFunctions();
  AdminLengthController adminController = AdminLengthController();
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  List<Schools> schools =[] ;
  List<Schools> list =[] ;
  Schools school = Schools() ;



  fetchSchools() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.getSchools(token);
    if(response.statusCode == 200 ){
      var jsonResponse = jsonDecode(response.body) ;
      for(var i = 0 ; i < jsonResponse.length ; i++ ){
        jsonResponse[i]['status'] =  jsonResponse[i]['status'].toString();
        school = Schools.fromJson(jsonResponse[i]);
        schools.add(school);
      }
      isLoading.toggle();
      update();
    }

  }

  List<Schools> search()  {
    if (searchController.text.isEmpty) {
      return schools;
    } else {
      print(searchController.text);
      return schools.where((element) {
        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase()) ;
      }).toList();
    }
  }




  @override
  void onInit() {
    isLoading.toggle();
    update();
    fetchSchools().then((value){
      schools = value;
      isLoading.toggle();
      update();
      search();
    });
    super.onInit();
  }


}