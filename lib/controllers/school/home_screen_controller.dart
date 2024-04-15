import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/appVars.dart';
import '../../apiFunctions/Functions.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Users.dart';
import '../../utils/models/school.dart';
import '../../utils/services.dart';

class HomeScreenController extends GetxController {


  SchoolFunctions function = SchoolFunctions();
  Functions func = Functions();
  RxBool isLoading = false.obs;
  var candidatLength = 0;
  var coatchLength = 0 ;
  var carsLength =0 ;
  var factureLength = 0 ;
  var seancesLength =0 ;
  int id = 0;
  User user = User();
  Schools school = Schools();

  changeToFrench(BuildContext context){
    context.locale = const Locale('fr');
    Get.updateLocale(const Locale('fr'));
    update();
  }
  changeToArabic(BuildContext context){
    context.locale = const Locale('ar');
    Get.updateLocale(const Locale('ar'));
    update();
  }

  getCandidatLength() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value){
      user = value;
      function.getCandidatSchool(token, value.id!).then((value){
        if(value.statusCode == 200){
          var response = jsonDecode(value.body).toList();
          candidatLength = response.length;
          update();
        }
        else {
          Get.snackbar(tr('error  '), tr('ErrorLength '),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  getFactureLength() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value){
      user = value;
      function.getFactureSchool(token, value.id!).then((value){
        if(value.statusCode == 200){
          var response = jsonDecode(value.body).toList();
          factureLength = response.length;
          update();
        }
        else {
          Get.snackbar(tr('error  '), tr('ErrorLength'),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  getCarsLength() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value){
      user = value;
      function.getCarsSchool(token, value.id!).then((value){
        if(value.statusCode == 200){
          var response = jsonDecode(value.body).toList();
          carsLength = response.length;
          update();
        }
        else {
          Get.snackbar(tr('error  '), tr('ErrorLength '),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  getSeancesLength() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value){
      user = value;
      function.getSeanceSchool(token, value.id!).then((value){
        if(value.statusCode == 200){
          var response = jsonDecode(value.body).toList();
          seancesLength = response.length;
          update();
        }
        else {
          print(jsonDecode(value.body)['message']);
          Get.snackbar(tr('error'),jsonDecode(value.body)['message'] ,
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  getCoatchLength() async{
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) async {
      user = value;
      function.getCoachSchool(token, value.id!).then((value){
        if(value.statusCode == 200){
          var response = jsonDecode(value.body).toList();
          coatchLength = response.length;
          update();
        }
        else {
          Get.snackbar(tr('error  '), tr('ErrorLength '),
              colorText: Colors.white, backgroundColor: dangerColor);
        }
      });
    });
  }

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      school = Schools.fromJson(response);
      return school ;
    });
  }


  @override
  void onInit() {
    super.onInit();
    isLoading.value =  true;
    update();
    getUser().then((value){
      getCandidatLength().then((value){
        getCarsLength().then((value){
          getCoatchLength().then((value){
            getFactureLength().then((value){
              getSeancesLength().then((value){
                print("logged in");
                isLoading.value = false;
                update();
              });
            });
          });
        });
      });
    });
  }

}