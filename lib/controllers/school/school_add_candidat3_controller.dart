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
import '../../Screens/school/school_add_candidat3.dart';
import '../../Screens/school/school_home_screen.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Candidat.dart';

class SchoolAddCandidat3Controller extends GetxController{

  String? base64Image3;
  String? base64Image4;
  String? contrat;
  String? certificat ;
  File selectedImagePath3 = File('') ;
  File selectedImagePath4 = File('') ;
  TextEditingController tarifsController =TextEditingController();
  TextEditingController paidController =TextEditingController();
  SchoolFunctions function = SchoolFunctions();
  Candidat candidat = Candidat();
  var isloading = false.obs;



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
  deleteImage3() async{
    if( await selectedImagePath3 != null){
      selectedImagePath3 = File('') ;
      update();
    }
  }
  deleteImage4() async {
    if( await selectedImagePath4 != null){
      selectedImagePath4 = File('');
      update();
    }
  }
  getImage4(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      final pickedImageFile = File(pickedFile!.path);
      selectedImagePath4 = File(pickedImageFile.path);
      selectedImagePath4 = pickedImageFile;
      update();
    }else{
      Get.snackbar(tr('error'),tr('noimage'));
    }
  }

  schoolAddCandidat3(BuildContext context) async {
    if(selectedImagePath3.path != '' && selectedImagePath4.path !='' && tarifsController.text.isNotEmpty && paidController.text.isNotEmpty){
      isloading.value =true;
      update();
      var byte3 = selectedImagePath3.readAsBytesSync().lengthInBytes;
      var kb3 = byte3 / 1024;
      var mb3 = kb3 / 1024;
      var byte4 = selectedImagePath4.readAsBytesSync().lengthInBytes;
      var kb4 = byte4 / 1024;
      var mb4 = kb4 / 1024;
      if (kb3 > 500 || mb3 > 0.5) {
        var result = await FlutterImageCompress.compressWithFile(selectedImagePath3.absolute.path, quality: 20,);
        base64Image3 = base64Encode(result!);
        contrat = selectedImagePath3.path.split('/').last;
      } else {
        base64Image3 = base64Encode(File(selectedImagePath3.path).readAsBytesSync());
        contrat = selectedImagePath3.path.split('/').last;
      }
      if (kb4 > 500 || mb4 > 0.5) {
        var result = await FlutterImageCompress.compressWithFile(selectedImagePath4.absolute.path, quality: 20,);
        base64Image4 = base64Encode(result!);
        certificat = selectedImagePath4.path.split('/').last;
      } else {
        base64Image4 = base64Encode(File(selectedImagePath4.path).readAsBytesSync());
        certificat = selectedImagePath4.path.split('/').last;
      }
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      candidat.name = prefs.getString('name') ?? '';
      candidat.email =prefs.getString('email') ?? '';
      candidat.birthdate = prefs.getString('date') ?? '';
      candidat.sexe = prefs.getString('genre') == 'Homme' ? '1' : '2' ;
      candidat.cni = prefs.getString('cin') ?? '';
      candidat.phoneNo = prefs.getString('phone') ?? '';
      candidat.photo = prefs.getString('base64Image') ??'';
      candidat.schoolId = prefs.getInt('school_id');
      candidat.photoName = prefs.getString('photoName') ??'';
      candidat.cniRecto = prefs.getString('recto');
      candidat.cniVerso = prefs.getString('verso');
      candidat.cniRectoName = prefs.getString('cinfrontname') ?? '';
      candidat.cniVersoName = prefs.getString('cinbackname') ?? '';
      candidat.certificat = base64Image4;
      candidat.certificatName = certificat ;
      candidat.contrat = base64Image3;
      candidat.contratName = contrat ;
      candidat.tarifs = int.parse(tarifsController.text) ;
      candidat.paid = int.parse(paidController.text) ;
      function.addCandidat(candidat, token).then((value){
        if(value.statusCode == 201){
          var jsonResponse = json.decode(value.body);
          function.addCandidatImage(candidat, token, jsonResponse['id']).then((value){
            if(value.statusCode == 201){
              Get.offAll(SchoolHomeScreen());
              update();
              showAchievementView(true, tr('moniteur_est_ajouté_avec_success'));
            }else{
              isloading.value = false;
              update();
              showAchievementView(false, tr('erreur_dans_le_system_addCandidatImage'));
            }
          });
        }else{
          isloading.value = false;
          update();
          showAchievementView(false, tr('erreur_dans_le_system_addCandidat'));
        }

      });
    }
    else {
      Get.to(SchoolAddCandidat3());
      Get.snackbar(tr('error'), tr('champsrequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
      update();
    }
  }

}