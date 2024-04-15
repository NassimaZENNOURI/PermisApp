import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:permisapp/apiFunctions/AdminFunctions.dart';
import 'package:permisapp/utils/models/school.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/functions.dart';
import '../../Screens/Login.dart';
import '../../apiFunctions/Functions.dart';
import '../../apiFunctions/SchoolFunctins.dart';

class SchoolEditController extends GetxController {


  RxString error = ''.obs;
  var isLoading = false.obs;
  Schools schooluser = Schools();
  Schools schooldata = Schools();
  SchoolFunctions function = SchoolFunctions();
  Functions func = Functions();
  AdminFunctions a = AdminFunctions();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController workingtimeController = TextEditingController();
  TextEditingController createdAtController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController previousPassword = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController schoolnameController = TextEditingController();



  bool get isPasswordMatch => newPasswordController.text == confirmPasswordController.text;


  getUser() async {
    schooldata = Schools.fromJson(await SessionManager().get('user'));
    nameController.text = schooldata.name!;
    emailController.text = schooldata.email!;
  }



  getSchoolUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      schooluser = Schools.fromJson(response);
      SessionManager().set('user', schooluser);
      schoolnameController.text= schooluser.school_name!;
      nameController.text = schooluser.name!;
      phoneController.text = schooluser.phoneNo! ;
      addressController.text = schooluser.address! ;
      cityController.text = schooluser.city! ;
      descriptionController.text = schooluser.description! ;
      createdAtController.text = schooluser.createdAt! ;
      update();
      return schooluser ;
    });
  }

  UpdatePassword(context, int id, String oldPassword, String newPassword, String confirmPassword) async {
    if(isPasswordMatch && oldPassword.isNotEmpty && newPassword.isNotEmpty && confirmPassword.isNotEmpty){
      error.value = '';
      update();
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';
      var response = await a.updatePassword(token, id, oldPassword, newPassword, confirmPassword);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var sessionManager = SessionManager();
        sessionManager.destroy();
        Get.offAll(Login());
        showAchievementView(true, tr('success_password'));
      } else {
        var jsonResponse = jsonDecode(response.body);
        showAchievementView(false, jsonResponse['message']);
      }
    }else {
      showAchievementView(false, tr('pasMatch'));
     error.value = 'Les mots de passe ne correspondent pas' ;
     update();
    }
  }

  UpdateUser(context, String password) async {
    Schools sc =Schools();
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    var user = Schools.fromJson(await SessionManager().get('user'));
      sc.school_name = schoolnameController.text ;
      sc.name= nameController.text;
      sc.email = emailController.text;
      sc.phoneNo = phoneController.text;
      sc.address = addressController.text;
      sc.city = cityController.text;
      sc.description = descriptionController.text;
      sc.createdAt = createdAtController.text;
      sc.userId = user.id;
    function.editSchool(token,sc , password).then((value) async {
      var response = value;
      if (response.statusCode == 200) {
        showAchievementView(true, tr('profilemodifie'));
        var sessionManager = SessionManager();
        await sessionManager.set('user', sc);
        prefs.setString('email', sc.email!);
        prefs.setString('name', sc.name!);
      }else {
        print('erreur à Editer !');
        print(response.statusCode);
        print(response.body);
      }
    });
  }

  @override
  void onInit() {
    isLoading.value = true;
    update();
    getUser().then((value) {
        getSchoolUser().then((value){
          isLoading.value = false;
          update();
        });
    });
    super.onInit();
  }
}
