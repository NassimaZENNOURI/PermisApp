import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Users.dart';
import '../../utils/services.dart';

class SchoolCandidatListController extends GetxController {
  TextEditingController searchController = TextEditingController();
  SchoolFunctions functions = SchoolFunctions();
  List<Candidat> candidats = [];
  List<Candidat> list = [];
  Candidat candidat = Candidat();
  User user = User();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isLoading.value = true;
    update();
    fetchCandidats().then((value) {
      update();
    });

    super.onInit();
  }

  fetchCandidats() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getCandidatSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            candidat = Candidat.fromJson(jsonResponse[i]);
            candidats.add(candidat);
          }
        }
        isLoading.value = false;
        update();
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
}
