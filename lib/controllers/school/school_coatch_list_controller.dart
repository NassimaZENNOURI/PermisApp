import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permisapp/utils/models/Moniteur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Users.dart';
import '../../utils/services.dart';

class SchoolCoatchListController extends GetxController {
  TextEditingController searchController = TextEditingController();
  SchoolFunctions functions = SchoolFunctions();
  List<Moniteur> coatchs = [];
  List<Moniteur> list = [];
  Moniteur coatch = Moniteur();
  User user = User();
  RxBool isLoading = false.obs;

  fetchCoatch() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getCoachSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            coatch = Moniteur.fromJson(jsonResponse[i]);
            coatchs.add(coatch);
          }
        }
        isLoading.value = false;
        update();
      });
    });
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
    isLoading.value = true;
    update();
    fetchCoatch().then((value) {
      update();
    });
  }
}
