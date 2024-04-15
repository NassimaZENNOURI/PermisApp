import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:permisapp/apiFunctions/AdminFunctions.dart';
import 'package:permisapp/utils/models/Users.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/functions.dart';
import '../../Screens/Login.dart';
import '../../Screens/admin/admin_home_screen.dart';

class EditController extends GetxController {
  AdminFunctions a = AdminFunctions();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController previousPassword = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  User admin = User();
  var isObscure1 = true.obs;
  var isObscure2 = true.obs;
  var isObscure3 = true.obs;
  var isLoading = false.obs;

  UpdateUser(context, int id, String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    var response = await a.updateStatus(token, id, 1, email, name);
    if (response.statusCode == 200) {
      pushNewScreen(context,
          screen: AdminHomeScreen(),
          pageTransitionAnimation: PageTransitionAnimation.cupertino);
      showAchievementView(true, tr('profilemodifie'));
      admin.name = name;
      admin.email = email;
      admin.status = "1";
      admin.id = id;
      var sessionManager = SessionManager();
      await sessionManager.set('user', admin);
      prefs.setString('email', admin.email!);
      prefs.setString('name', admin.name!);
    } else {
      print(response.body);
    }
  }

  UpdatePassword(context, int id, String oldPassword, String newPassword, String confirmPassword) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    var response = await a.updatePassword(
        token, id, oldPassword, newPassword, confirmPassword);
    if(oldPassword.isNotEmpty || newPassword.isNotEmpty || confirmPassword.isNotEmpty){
      if (response.statusCode == 200) {
        var sessionManager = SessionManager();
        sessionManager.destroy();
        Get.offAll(Login());
        showAchievementView(true, tr('success_password'));
      } else if (response.statusCode == 401) {
        showAchievementView(false, tr('password_is_incorrect'));
      } else if (response.statusCode == 400) {
        showAchievementView(false, tr('comfirmation_incorrecte'));
      } else {
        print(response.body);
        print(response.statusCode);
      }
    }
    else{
      showAchievementView(false, tr('password_required'));
    }
  }

  getuser() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    var response = await a.getUser(token);
    print(response.statusCode);
    if (response.statusCode == 200) {
      admin = User.fromJson(await SessionManager().get('user'));
      nameController.text = admin.name!;
      emailController.text = admin.email!;
    }
    isLoading.toggle();
    update();
  }

  void toggleObscure1() {
    isObscure1.value = !isObscure1.value;
    update();
  }
  void toggleObscure2() {
    isObscure2.value = !isObscure2.value;
    update();
  }
  void toggleObscure3() {
    isObscure3.value = !isObscure3.value;
    update();
  }

  @override
  void onInit() {
    isLoading.toggle();
    update();
    getuser().then((value) {
      admin = value;
      isLoading.toggle();
      update();
    });
    super.onInit();
  }
}
