

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permisapp/Screens/admin/admin_home_screen.dart';
import 'package:permisapp/apiFunctions/AdminFunctions.dart';
import 'package:permisapp/controllers/admin/school_list_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/functions.dart';
import '../../Screens/admin/car_list.dart';
import '../../utils/models/Cars.dart';
import '../../utils/models/school.dart';
import 'admin_length_controller.dart';

class AddCarsController extends GetxController{

  var selectedImagePath =''.obs;
  String SelectedGender = 'Diesel';
  String newValue = "Diesel";
  String holder = '';
  String SelectedSchool = '' ;
  List<Schools> schools =[];
  Schools school = Schools();
  String? base64Image;
  String photoName='';
  var isloading = false.obs;
  var SelectedID = 0;
  TextEditingController brandController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController matriculeController = TextEditingController();
  TextEditingController kilometrageController = TextEditingController();
  AdminLengthController admin = AdminLengthController();
  AdminFunctions a = AdminFunctions();



  getSchoolName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await a.getSchools(token);
    if(response.statusCode== 200){
      var jsonResponse = jsonDecode(response.body) ;
      for(var i = 0 ; i < await admin.getSChoolLength() ; i++ ){
        jsonResponse[i]['status'] = jsonResponse[i]['status'].toString() ;
        school = Schools.fromJson(jsonResponse[i]) ;
        schools.add(school);
        SelectedSchool = schools[0].id.toString();
      }
      isloading.toggle();
      update();
    }
  }

  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null){
      selectedImagePath.value = pickedFile.path;
      update();
    }else{
      Get.snackbar(tr('error'), tr('noimage'));
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

  addCar() async {
        isloading.toggle();
        update();
        if(selectedImagePath.value==''){
          base64Image='';
        } else{
          base64Image = base64Encode(File(selectedImagePath.value).readAsBytesSync());
          photoName = selectedImagePath.value.split('/').last;
        }
        Cars car =Cars();
        final prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('token') ?? '';
        prefs.setString('imageName', photoName);
        car.photoName = photoName;
        car.photo=base64Image; //path ?
        car.brand = brandController.text ;
        car.version= versionController.text;
        car.engine = SelectedGender ;
        car.kilometrage=kilometrageController.text;
        car.color=colorController.text;
        car.matricule = matriculeController.text;
        car.schoolId= int.parse(schoolController.text);

        if(colorController.text.isNotEmpty||versionController.text.isNotEmpty||
            brandController.text.isNotEmpty||kilometrageController.text.isNotEmpty||
            matriculeController.text.isNotEmpty){

          var response = await a.addCar(car,token);
          if(response.statusCode==201){
            Get.offAll(AdminHomeScreen());
            update();
            showAchievementView(true,tr('add_success'));
            update();
          }else{

            showAchievementView(false,tr('server_error'));
          }
        }
        else{
          showAchievementView(false,tr('fill_all_fields'));
        }
  }


  @override
  void onInit() {
    isloading.toggle();
    update();
    getSchoolName().then((value){
      schools = value ;
      isloading.toggle();
      update();
    });
    super.onInit();
  }

}