import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../Views/HomePageScreen.dart';
import '../apiFunctions/Authentification.dart';



class AuthController extends GetxController{


  var isObscure ;
  final emailcontroller=TextEditingController();
  final pwdcontroller=TextEditingController();
  final email = ''.obs;
  final password = ''.obs;
  var isLoggedIn = false.obs;
  late final recognizer ;
  RxBool loading = false.obs;


  @override
  void onInit() {
    // login(email.value, password.value);
    isObscure = true.obs ;
    recognizer = TapGestureRecognizer()..onTap = onTap ;
    super.onInit();
  }

  void onTap(){
    launch('http://dabapermisv2.medyouin.com/register');
  }


  void toggleObscure() {
    isObscure.value = !isObscure.value;
    update();
  }


  void setemail(String value) {
    email.value = value;
  }
  void setpassword(String value) {
    password.value = value;
  }

  Future<bool> validate() async {
    if (emailcontroller.text.isEmpty) {
      Get.snackbar('Error', 'Email is required',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (pwdcontroller.text.isEmpty) {
      Get.snackbar('Error', 'Password is required',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (!GetUtils.isEmail(emailcontroller.text.trim())) {
      Get.snackbar('Error', 'Invalid email',
          colorText: Colors.white, backgroundColor: Colors.red);

      return false;
    }
    return true;
  }
  submit() {
    Authentification authentification = Authentification();
    validate().then((value) {
      if (value) {
        loading.toggle();
        update();
        Timer(Duration(seconds: 1), () {
           authentification.login(emailcontroller.text.trim(), pwdcontroller.text)
              .then((value) {
            if (value.statusCode == 200) {
              SessionManager().set("loggedin", true);
              Get.offAll(() => const HomePageScreen());
            } else {
              print(value.statusCode);
              Get.snackbar('Error', 'Invalid email or password',
                  colorText: Colors.white, backgroundColor: Colors.red);
            }
          });
          loading.toggle();
          update();
        });
      }
    });
  }



  logout() async {

    final String apiUrl = 'https://dabapermisv2.medyouin.com/api/logout';
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
      );
      if (response.statusCode == 200) {
        isLoggedIn.value = false;
        Get.offAllNamed('/login');
      } else {
        print('Error logging out');
      }
    } catch (e) {
      print(e.toString());
    }
  }

}










