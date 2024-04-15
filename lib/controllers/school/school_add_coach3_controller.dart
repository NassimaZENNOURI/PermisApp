import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/functions.dart';
import '../../Screens/school/school_home_screen.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Moniteur.dart';

class SchoolAddCoach3Controller extends GetxController{


  var selectedImagePath3 = File('') ;
  String? base64Image3;
  String? contrat ='';
  var isloading = false.obs;
  Moniteur coatch = Moniteur();
  SchoolFunctions function = SchoolFunctions();
  TextEditingController cardnumberController = TextEditingController();



  getImage3(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      final pickedImageFile = File(pickedFile!.path);
      selectedImagePath3 = File(pickedImageFile.path);
      selectedImagePath3 = pickedImageFile;
      update();
    }else{
      Get.snackbar(tr('error'),tr('noimage'));
    }
  }

  deleteImage3() async {
    if( await selectedImagePath3 != null){
      selectedImagePath3 =File('') ;
      update();
    }
  }

  schoolAddCoatch3(BuildContext context) async {
    if(selectedImagePath3.path != '' && cardnumberController.text.isNotEmpty){
      isloading.value =true;
      update();
      final byte3 = selectedImagePath3.readAsBytesSync().lengthInBytes;
      final kb3 = byte3 / 1024;
      final mb3 = kb3 / 1024;
      if (kb3 > 500 || mb3 > 0.5) {
        var result = await FlutterImageCompress.compressWithFile(selectedImagePath3.absolute.path, quality: 20,);
        base64Image3 = base64Encode(result!);
        contrat = selectedImagePath3.path.split('/').last;
      } else {
        base64Image3 = base64Encode(File(selectedImagePath3.path).readAsBytesSync());
        contrat = selectedImagePath3.path.split('/').last;
      }
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      coatch.name = prefs.getString('name') ?? '';
      coatch.email =prefs.getString('email') ?? '';
      coatch.birthdate = prefs.getString('date') ?? '';
      coatch.sexe = prefs.getString('genre') == 'Homme' ? 1 : 2 ;
      coatch.cni = prefs.getString('cin') ?? '';
      coatch.phoneNo = prefs.getString('phone') ?? '';
      coatch.photo = prefs.getString('base64Image') ??'';
      coatch.schoolId = prefs.getInt('school_id');
      coatch.photoName = prefs.getString('photoName') ??'';
      coatch.cniRecto = prefs.getString('recto');
      coatch.cniVerso = prefs.getString('verso');
      coatch.cniRectoName = prefs.getString('cinfrontname') ?? '';
      coatch.cniVersoName = prefs.getString('cinbackname') ?? '';
      coatch.carteMoniteurName = contrat;
      coatch.carteMoniteur = base64Image3!;
      coatch.numeroCarteMoniteur = cardnumberController.text;
      coatch.status = 0 ;
      function.addMoniteur(coatch, token).then((value){
        var jesonResponse = json.decode(value.body);
        if(value.statusCode ==201){
          isloading.value =false;
          update();
          Get.offAll(const SchoolHomeScreen());
          update();
          showAchievementView(true, tr('moniteur_est_ajouté_avec_success'));
        }else{
          isloading.value =false;
          update();
          showAchievementView(false, tr('erreur_dans_le_system'));
        }
      });
    }else{
      isloading.value =false;
      update();
      Get.snackbar(tr('error'), tr('champsrequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}