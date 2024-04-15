import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiFunctions/AdminFunctions.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Cars.dart';
import '../../utils/models/Users.dart';
import '../../utils/services.dart';

class SchoolCarListController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController schoolnameController = TextEditingController();
  TextEditingController schoolAdressController = TextEditingController();
  AdminFunctions func = AdminFunctions();
  SchoolFunctions functions = SchoolFunctions();
  List<Cars> cars = [];
  List<Cars> list = [];
  Cars car = Cars();
  User user = User();
  RxBool isLoading = false.obs;

  fetchCars() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getCarsSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            car = Cars.fromJson(jsonResponse[i]);
            cars.add(car);
          }
        }
        isLoading.value = false;
        update();
      });
    });
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

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    update();
    fetchCars().then((value) {
      update();
    });
  }
}
