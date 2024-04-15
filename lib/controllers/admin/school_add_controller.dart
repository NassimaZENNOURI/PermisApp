

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/functions.dart';
import '../../Screens/admin/admin_home_screen.dart';
import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/school.dart';

class AddSchoolController extends GetxController {


  TextEditingController schoolnameController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController addressController =TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  AdminFunctions admin = AdminFunctions();



  addSchool() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    Schools school = Schools();
    school.school_name= schoolnameController.text;
    school.email=emailController.text;
    school.city=cityController.text;
    school.address=addressController.text;
    school.phoneNo=phoneController.text;
    school.name = nameController.text;
    var response = await admin.addSchool(school, token);
    update();
    print(response. statusCode);
    print(response.body);
    if(response.statusCode == 201){
      showAchievementView(true, StringTranslateExtension('ajout_success').tr());
      Get.offAll(AdminHomeScreen());
      update();
    }else if(schoolnameController.text ==''|| emailController.text==''|| cityController.text==''||addressController.text==''||phoneController.text==''||nameController.text==''){
      showAchievementView(false, StringTranslateExtension('champ_vide').tr());
    }else {
      showAchievementView(false, StringTranslateExtension('ajout_not_success').tr());
    }
  }

}