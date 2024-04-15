import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/functions.dart';
import '../../Screens/school/school_home_screen.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/services.dart';

class SchoolCandidatEditController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Candidat candidat = Candidat();
  SchoolFunctions function = SchoolFunctions();
  var isLoading = true.obs;


  editCandidat(Candidat candidat) async {
    getUserFromMemory()!.then((value) async {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      candidat.name = nameController.text;
      candidat.email = emailController.text;
      candidat.birthdate = dateController.text;
      candidat.sexe = genreController.text == 'Homme' ? '1' : '2';
      candidat.cni = cinController.text;
      candidat.phoneNo = phoneController.text;
      candidat.schoolId = value.id!;
      function.editCandidat(candidat, token).then((value) {
        var response = value;
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.offAll(const SchoolHomeScreen());
          update();
          showAchievementView(true, tr('success_edit_candidat'));
        } else {
          showAchievementView(false, response.body);
        }
      });
    });
  }

  @override
  void onInit() {
    candidat = Get.arguments.first ;
    nameController.text = candidat.name!;
    emailController.text = candidat.email! ;
    dateController.text = candidat.birthdate!;
    genreController.text = candidat.sexe! ;
    cinController.text = candidat.cni!;
    phoneController.text = candidat.phoneNo!;
    update();
    super.onInit();
  }


}
