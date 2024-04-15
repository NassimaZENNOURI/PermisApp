import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/school/school_add_candidat2.dart';
import '../../Screens/school/school_add_candidat3.dart';

class SchoolAddCandidat2Controller extends GetxController{


  File selectedImagePath1 =File('');
  File selectedImagePath2 = File('') ;
  String? base64Image1;
  String? base64Image2;
  String? verso = '';
  String? recto = '';
  var isloading = false.obs;

  getImage1(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      final pickedImageFile = File(pickedFile!.path);
      selectedImagePath1 = File(pickedImageFile.path);
      selectedImagePath1 = pickedImageFile;
      update();
    }else{
      Get.snackbar(tr('error'),tr('noimage'));
    }
  }
  getImage2(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      final pickedImageFile = File(pickedFile!.path);
      selectedImagePath2 = File(pickedImageFile.path);
      selectedImagePath2 = pickedImageFile;
      update();
    }else{
      Get.snackbar(tr('error'),tr('noimage'));
    }
  }

  deleteImage1() async{
    if( await selectedImagePath1 != null ){
      selectedImagePath1 = File('') ;
      update();
    }
  }
  deleteImage2() async {
    if( await selectedImagePath2 != null ){
      selectedImagePath2 = File('') ;
      update();
    }
  }

  schoolAddCandidat2(BuildContext context) async {
    if(selectedImagePath2.path != '' &&  selectedImagePath1.path != ''){
      isloading.value = true;
      update();
      final byte1 = selectedImagePath1.readAsBytesSync().lengthInBytes;
      final kb1 = byte1 / 1024;
      final mb1 = kb1 / 1024;
      final byte2 = selectedImagePath2.readAsBytesSync().lengthInBytes;
      final kb2 = byte2 / 1024;
      final mb2 = kb2 / 1024;
      if (kb1 > 500 || mb1 > 0.5) {
        var result = await FlutterImageCompress.compressWithFile(selectedImagePath1.absolute.path, quality: 20,);
        base64Image1 = base64Encode(result!);
        recto = selectedImagePath1.path.split('/').last;
      } else {
        base64Image1 = base64Encode(File(selectedImagePath1.path).readAsBytesSync());
        recto = selectedImagePath1.path.split('/').last;
      }
      if (kb2 > 500 || mb2 > 0.5) {
        var result = await FlutterImageCompress.compressWithFile(selectedImagePath2.absolute.path, quality: 20,);
        base64Image2 = base64Encode(result!);
        verso = selectedImagePath2.path.split('/').last;
      } else {
        base64Image2 = base64Encode(File(selectedImagePath2.path).readAsBytesSync());
        verso = selectedImagePath2.path.split('/').last;
      }
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cinfrontname', base64Image1!);
      prefs.setString('cinbackname', base64Image2!);
      prefs.setString('recto', recto!);
      prefs.setString('verso', verso!);
      isloading.value =false;
      update();
      Get.to(SchoolAddCandidat3());
    }
    else {
      Get.to(SchoolAddCandidat2());
      Get.snackbar(tr('error'), tr('cinimagerequired'),
          colorText: Colors.white, backgroundColor: Colors.red);
      update();
    }
  }
}