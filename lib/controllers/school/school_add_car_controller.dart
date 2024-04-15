
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../Components/functions.dart';
import '../../apiFunctions/AdminFunctions.dart';
import '../../apiFunctions/Functions.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Cars.dart';

class SchoolAddCarController extends GetxController{

  TextEditingController brandController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController matriculeController = TextEditingController();
  TextEditingController kilometrageController = TextEditingController();
  SchoolFunctions function = SchoolFunctions();
  Functions func = Functions();
  AdminFunctions a = AdminFunctions();
  Cars car =Cars();
  var selectedImagePath =''.obs;
  String SelectedGender = 'Diesel';
  String newValue = "Diesel";
  String holder = '';
  String? base64Image;
  String photoName='';
  var isloading = false.obs;
  var SelectedID = 0;


  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      update();
    }else{
      Get.snackbar(tr('error'),tr('noimage'));
    }
  }

  deleteImage() async {
    if (await selectedImagePath != null) {
      selectedImagePath = ''.obs;
      update();
    }
  }

  getDropDownItem() {
    holder = newValue;
    update();
  }
  changeDropDownItem(){
    update();
  }


  schoolAddCar() async {
    isloading.toggle();
    update();
    if(selectedImagePath.value==''){
      base64Image='';
      showAchievementView(false,tr('image_vide'));
    } else{
      base64Image = base64Encode(File(selectedImagePath.value).readAsBytesSync());
      photoName = selectedImagePath.value.split('/').last;
    }
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value) async {
      var jsonResponse = json.decode(value.body);
      car.photoName = photoName;
      car.photo=base64Image; //path ?
      car.brand = brandController.text ;
      car.version= versionController.text;
      car.engine = SelectedGender ;
      car.kilometrage=kilometrageController.text;
      car.color=colorController.text;
      car.matricule = matriculeController.text;
      car.schoolId = jsonResponse['id'];
      if(colorController.text.isNotEmpty||versionController.text.isNotEmpty|| brandController.text.isNotEmpty||kilometrageController.text.isNotEmpty|| matriculeController.text.isNotEmpty){
        var response = await a.addCar(car,token);
        if(response.statusCode==201){
          Get.offAll(SchoolHomeScreen());
          update();
        }else{
          print(response.statusCode);
          showAchievementView(false,response.body['message']);
        }
      }
    });
  }

}