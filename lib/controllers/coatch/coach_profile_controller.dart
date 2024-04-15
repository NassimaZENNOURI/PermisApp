
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/Functions.dart';
import '../../utils/models/Moniteur.dart';

class CoachProfileController extends GetxController{


  Functions func = Functions();
  Moniteur coach =  Moniteur();
  var isLoading = false.obs ;

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var response = json.decode(value.body);
      coach = Moniteur.fromJson(response);
      update();
      return coach;
    });
    isLoading.value = false ;
  }

  @override
  void onInit() {
    isLoading.value = true;
    update();
    getUser().then((value){
      update();
    });
    super.onInit();
  }

}