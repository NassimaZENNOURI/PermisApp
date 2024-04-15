
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../Components/functions.dart';
import '../../Screens/school/school_add_coatch2.dart';
import '../../Screens/school/school_add_coatch3.dart';
import '../../apiFunctions/Functions.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Moniteur.dart';

class SchoolAddCoach1Controller extends GetxController{

  var selectedImagePath =File('');
  String SelectedGender = 'Femme';
  String? base64Image;
  String photoName='';
  var isloading = false.obs;
  Functions func = Functions();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      final pickedImageFile = File(pickedFile!.path);
      selectedImagePath = File(pickedImageFile.path);
      selectedImagePath = pickedImageFile;
      update();
    }else{
      Get.snackbar(tr('error'),tr('noimage'));
    }
  }




  deleteImage() async {
    if (await selectedImagePath != null) {
      selectedImagePath = File('');
      update();
    }
  }

  getDropDownItem() {
    update();
  }

  validate1() async {
    if (emailController.text.trim().isEmpty) {
      Get.snackbar(tr('error'), 'emailrequired',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (nameController.text.isEmpty) {
      Get.snackbar(tr('error'), tr('fullnamerequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar(tr('error'), tr('invalidemail'),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (phoneController.text.trim().isEmpty || phoneController.text.length!=10) {
      Get.snackbar(tr('error'), tr('phonerequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (dateController.text.trim().isEmpty) {
      Get.snackbar(tr('error'), tr('daterequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
    if (cinController.text.trim().isEmpty) {
      Get.snackbar(tr('error'), tr('cinrequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    return true;
  }
  schoolAddCoatch1() async {
    validate1().then((value) async {
      if(value){
        isloading.value = true;
        update();
        if(selectedImagePath.path==''){
          base64Image='';
        } else{
          final bytes = selectedImagePath.readAsBytesSync().lengthInBytes;
          final kb = bytes / 1024;
          final mb = kb / 1024;
          if (kb > 500 || mb > 0.5) {
            var result = await FlutterImageCompress.compressWithFile(
              selectedImagePath.absolute.path,
              quality: 20,
            );
            base64Image = base64Encode(result!);
            photoName = selectedImagePath.path.split('/').last;
          } else {
            base64Image = base64Encode(File(selectedImagePath.path).readAsBytesSync());
            photoName = selectedImagePath.path.split('/').last;
          }
        }
        final prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('token') ?? '';
        func.getUser(token).then((value){
          var jsonResponse = json.decode(value.body);
          prefs.setString('photoName', photoName);
          prefs.setString('base64Image', base64Image!);
          prefs.setString('name',nameController.text);
          prefs.setString('email', emailController.text);
          prefs.setString('date', dateController.text);
          prefs.setString('genre', genreController.text);
          prefs.setString('cin', cinController.text);
          prefs.setString('phone', phoneController.text);
          prefs.setInt('school_id',jsonResponse['id'] );
          isloading.value =false;
          update();
          Get.to(SchoolAddCoatch2());
        });
      }
    });
  }


}

