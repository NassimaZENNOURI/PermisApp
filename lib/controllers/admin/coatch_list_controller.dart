import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/Moniteur.dart';
import 'admin_length_controller.dart';


class ListCoatchController extends GetxController {

  AdminFunctions a = AdminFunctions();
  TextEditingController searchController = TextEditingController();
  AdminLengthController adminController = AdminLengthController();
  List<Moniteur> coatchs = [];
  List<Moniteur> list = [];
  Moniteur coatch = Moniteur();
  RxBool isLoading = false.obs;


  fetchCoatchs() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.getCoach(token);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        coatch = Moniteur.fromJson(jsonResponse[i]);
        coatchs.add(coatch);
      }
      isLoading.toggle();
      update();
    }
  }

  List<Moniteur> search()  {
    if (searchController.text.isEmpty) {
      return coatchs;
    } else {
      return coatchs.where((element) {
        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.toggle();
    update();
    fetchCoatchs().then((value) {
      coatchs = value;
      isLoading.toggle();
      update();
      search();
    });
  }

}