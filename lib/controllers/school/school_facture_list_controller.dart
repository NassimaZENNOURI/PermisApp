


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Facture.dart';
import '../../utils/models/Users.dart';
import '../../utils/services.dart';

class SchoolFactureListController extends GetxController{


  TextEditingController searchController = TextEditingController();
  SchoolFunctions functions = SchoolFunctions();
  List<Facture> factures = [];
  List<Facture> list = [];
  Facture facture = Facture();
  User user = User();
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    isLoading.value = true;
    update();
    fetchFactures().then((value) {
      update();
    });

    super.onInit();
  }


  fetchFactures() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getFactureSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            facture = Facture.fromJson(jsonResponse[i]);
            factures.add(facture);
          }
        }
        isLoading.value = false;

        update();
      });
    });
  }

  List<Facture> search()  {
    if (searchController.text.isEmpty) {
      return factures;
    } else {
      return factures.where((element) {
        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }


}
