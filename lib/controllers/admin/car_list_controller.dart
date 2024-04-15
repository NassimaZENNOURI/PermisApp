import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/Cars.dart';
import 'admin_length_controller.dart';

class ListCarsController extends GetxController {

  TextEditingController searchController = TextEditingController();
  TextEditingController schoolnameController = TextEditingController();
  TextEditingController schoolAdressController = TextEditingController();
  AdminLengthController adminController = AdminLengthController();
  AdminFunctions a = AdminFunctions();
  List<Cars> cars = [];
  List<Cars> list = [];
  Cars carModel = Cars();
  RxBool isLoading = false.obs;
  var schools = '';

  fetchCars() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.getCars(token);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        carModel = Cars.fromJson(jsonResponse[i]);
        cars.add(carModel);
      }
      isLoading.toggle();
      update();
    }
  }

  List<Cars> search()  {
    if (searchController.text.isEmpty) {
      return cars;
    } else {
      return cars.where((element) {
        return element.brand!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }

  fetchCarsSchoolByd(int id) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.searchSchoolid(token, id);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['message'] == 'Ecole introuvable!') {
      schoolnameController.text = tr('ecole_introuvable');
      schoolAdressController.text = tr('adress_introuvable');
    } else {
      if (response.statusCode == 200) {

        schoolnameController.text = jsonResponse['name'];
        schoolAdressController.text = jsonResponse['address'];
      }
    }
    isLoading.toggle();
    update();
  }

  @override
  void onInit() {
    isLoading.toggle();
    update();
    fetchCars().then((value) {
      cars = value;
      isLoading.toggle();
      update();
    });
    super.onInit();
  }
}
