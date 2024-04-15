import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permisapp/Screens/admin/admin_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/models/users.dart';
import '../../apiFunctions/AdminFunctions.dart';
import 'admin_length_controller.dart';

class ListUsersController extends GetxController{

  AdminFunctions a = AdminFunctions();
  AdminLengthController adminController = AdminLengthController();
  List<User> users = [];
  List<User> list = [];
  User user = User();
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();



  fetchUers() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    a.getAll(token).then((value){
      if(value.statusCode == 200 ){
        var jsonResponse = json.decode(value.body) ;
        for(var i = 0 ; i < jsonResponse.length ; i ++){
          user = User.fromJson(jsonResponse[i]);
          users.add(user);
        }
      }
      isLoading.value = false;
      update();
    });
  }

  UpdateStatus(int id ,String status , String email , String name) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var newStatus = status == "0" ? "1" : "0";
    a.UpdateStatus(token, id, newStatus, email, name).then((value){
      update();
      if(value.statusCode == 200){
        status = status == "0" ? "1" : "0";
        update();
        Get.offAll(const AdminHomeScreen());
        update();
        Get.snackbar('update'.tr,'updatevalid'.tr);
      }
    });
  }

  List<User> search()  {
    if (searchController.text.isEmpty) {
      return users;
    } else {
      return users.where((element) {
        return element.name!.toLowerCase().contains(searchController.text.trim().toLowerCase()) || element.email!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    isLoading.toggle();
    update();
    fetchUers().then((value){
      users =value ;
      update();
    });
    super.onInit();
  }
}