

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/Facture.dart';
import 'admin_length_controller.dart';

class ListFactureController extends GetxController{

  AdminLengthController adminController = AdminLengthController();
  TextEditingController searchController = TextEditingController();
  AdminFunctions a = AdminFunctions();
  RxBool isLoading = false.obs;
  List<Facture> factures =[] ;
  List<Facture> list =[] ;
  Facture facture = Facture() ;



  fetchFactures() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.getFacture(token);
    if(response.statusCode == 200 ){
      var jsonResponse = jsonDecode(response.body) ;
      for(var i = 0 ; i < jsonResponse.length ; i++ ){
        facture = Facture.fromJson(jsonResponse[i]);
        factures.add(facture);
      }
      isLoading.toggle();
      update();
    }

  }

  List<Facture> search()  {
    if (searchController.text.isEmpty) {
      return factures;
    } else {
      return factures.where((element) {
        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase()) ;
      }).toList();
    }
  }


  @override
  void onInit() {
    isLoading.toggle();
    update();
    fetchFactures().then((value){
      factures= value ;
      search();
    });

    super.onInit();
  }


}