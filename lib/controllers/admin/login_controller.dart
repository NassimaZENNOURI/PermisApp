import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:permisapp/apiFunctions/AdminFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Components/appVars.dart';
import '../../Screens/Login.dart';
import '../../Screens/admin/admin_home_screen.dart';
import '../../Screens/coach/coach_home_screen.dart';
import '../../Screens/condidat/candidat_home_screen.dart';
import '../../Screens/school/school_home_screen.dart';
import '../../apiFunctions/Authentification.dart';
import '../../utils/models/Users.dart';

class LoginController extends GetxController {
  String name = '';
  int id = 0;
  int status = 0;
  String eml = '';

  var isObscure;
  final emailcontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  final email = ''.obs;
  final password = ''.obs;
  var isLoggedIn = false.obs;
  late final recognizer1;
  late final recognizer2;
  RxBool loading = false.obs;
  User user = User();
  User admin = User();

  @override
  void onInit() {
    isObscure = true.obs;
    recognizer1 = TapGestureRecognizer()..onTap = onTap;
    recognizer2 = TapGestureRecognizer()..onTap = onTapPassword;
    super.onInit();
  }

  void onTap() {
    launch('http://dabapermisv2.medyouin.com/register');
  }
  void onTapPassword() {
    launch('http://dabapermisv2.medyouin.com/forget/password');
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

  changeToFrench(BuildContext context) {
    context.locale = Locale('fr');
    Get.updateLocale(const Locale('fr'));
    update();
  }

  changeToArabic(BuildContext context) {
    context.locale = const Locale('ar');
    Get.updateLocale(const Locale('ar'));
    update();
  }

  Future<bool> validate() async {
    if (emailcontroller.text.trim().isEmpty) {
      Get.snackbar(StringTranslateExtension('error').tr(),
          StringTranslateExtension('emailrequired').tr(),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (pwdcontroller.text.isEmpty) {
      Get.snackbar(StringTranslateExtension('error').tr(),
          StringTranslateExtension('passrequired').tr(),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (!GetUtils.isEmail(emailcontroller.text.trim())) {
      Get.snackbar(StringTranslateExtension('error').tr(),
          StringTranslateExtension('invalidemail').tr(),
          colorText: Colors.white, backgroundColor: Colors.red);

      return false;
    }
    return true;
  }

  submit() {
    validate().then((value) {
      if (value) {
        loading.toggle();
        update();
        Authentification admin = Authentification();
        Timer(const Duration(seconds: 1), () {
          admin
              .login(emailcontroller.text.trim(), pwdcontroller.text)
              .then((value) async {
            final ConnectivityResult result =
            await Connectivity().checkConnectivity();
            Authentification auth = Authentification();
            final prefs = await SharedPreferences.getInstance();
            print(value.statusCode);
            var role = json.decode(value.body)['role'];
            if (value.statusCode == 200) {
              var token = await json.decode(value.body)['token'];
              prefs.setString('token', token);
              // prefs.setBool('seen', true);
              prefs.setString('email', emailcontroller.text.trim());
              prefs.setString('password', pwdcontroller.text);
              auth.getUser(token).then((value) async {
                prefs.setInt('id', json.decode(value.body)['id']);
                prefs.setString('status', json.decode(value.body)['status']);
                prefs.setString('name', json.decode(value.body)['name']);
                prefs.setBool('isloggedin', true);
                SessionManager().set("isloggedin", true);
                SessionManager().set("token", prefs.getString('token'));
                user = User(
                    id: prefs.getInt('id'),
                    name: prefs.getString('name'),
                    email: prefs.getString('email'),
                    role: role);
                SessionManager().set("user", user);
                getuser();
                if (user.role == "ROLE_ADMIN") {
                  loading.toggle();
                  update();
                  Get.offAll(() => AdminHomeScreen());
                } else if (user.role == "ROLE_SCHOOL") {
                  loading.toggle();
                  update();
                  Get.offAll(() => SchoolHomeScreen());
                } else if(user.role == "ROLE_COACH") {
                  loading.toggle();
                  update();
                  Get.offAll(() => CoatchHomeScreen());
                } else if (user.role == "ROLE_CANDIDAT"){
                  loading.toggle();
                  update();
                  Get.offAll(CandidatHomeScreen());
                } else {
                  loading.toggle();
                  update();
                  Get.offAll(() => const Login());
                }
              });
            } else {
              Get.snackbar(StringTranslateExtension('error').tr(),StringTranslateExtension('error').tr(),
                  colorText: Colors.white, backgroundColor: dangerColor);
              loading.toggle();
              update();
            }
          });
        });
      }
    });
  }

  getuser() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    AdminFunctions a = AdminFunctions();
    var response = await a.getUser(token);
    print(response.statusCode);
    if (response.statusCode == 200) {
      admin = User.fromJson(await SessionManager().get('user'));
      name = admin.name!;
      eml = admin.email!;
    }
    loading.toggle();
    update();
  }
}
