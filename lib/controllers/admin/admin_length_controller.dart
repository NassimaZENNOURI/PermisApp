

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:permisapp/apiFunctions/Functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/Users.dart';

class AdminLengthController extends GetxController {

  AdminFunctions a = AdminFunctions();
  Functions func = Functions();
  User user = User() ;
  RxBool isLoading = false.obs;
  var candidatLength = 0;
  var schoolLength = 0;
  var factureLength = 0 ;
  var carsLength =0 ;
  var coatchLength = 0 ;
  var InscriptionsLength = 0 ;
  var usersLength = 0 ;


  @override
  void onInit() {
    super.onInit();
    isLoading.toggle();
    update();
    getUser().then((value){
      update();
      getSChoolLength().then((value){
        schoolLength = value ;
        isLoading.toggle();
        update();
        getCandidatLength().then((value) {
          candidatLength = value ;
          isLoading.toggle();
          update();
          getUsersLength().then((value) {
            usersLength = value ;
            isLoading.toggle();
            update();
            getFactureLength().then((value){
              factureLength = value ;
              isLoading.toggle();
              update();
              getInscriptionLength().then((value){
                InscriptionsLength = value;
                isLoading.toggle();
                update();
              });
            });
          });
        });
      });
    });
  }

  getFactureLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getFacture(token);
    if (data.statusCode == 200) {
      var res = jsonDecode(data.body).toList();
      factureLength = res.length;
    }
    isLoading.toggle();
    update();
    return factureLength ;
  }

  getCoatchLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getCoach(token);
    if (data.statusCode == 200) {
      var res = jsonDecode(data.body).toList();
      coatchLength = res.length;
    }
    isLoading.toggle();
    update();
    return coatchLength ;
  }

  getInscriptionLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getInscription(token);
    if(data.statusCode == 200 ){
      var res = jsonDecode(data.body).toList();
      InscriptionsLength = res.length;
    }
    isLoading.toggle();
    update();
    return InscriptionsLength ;
  }

  getSChoolLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getSchools(token);
    if(data.statusCode == 200 ){
      var res = jsonDecode(data.body).toList();
      schoolLength = res.length;
    }
    isLoading.toggle();
    update();
    return schoolLength ;
  }

  getCandidatLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getCandidats(token);
    if (data.statusCode == 200) {
      var res = jsonDecode(data.body).toList();
      candidatLength = res.length;
    }
    isLoading.toggle();
    update();
    return candidatLength ;
  }

  getCarsLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getCars(token);
    if (data.statusCode == 200) {
      var res = jsonDecode(data.body).toList();
      carsLength = res.length;
    }
    isLoading.toggle();
    update();
    return carsLength ;
  }

  getUsersLength() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = await a.getUser(token);
    if (data.statusCode == 200){
      var res = jsonDecode(data.body);
      usersLength = res.length;
    }
    isLoading.toggle();
    update();
    return usersLength ;
  }

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      user = User.fromJson(response);
      return user ;
    });
  }

}