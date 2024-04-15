
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/CoachFunctions.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';

class CoachSeanceProfileController extends GetxController{

  String ids = '';
  Seance seance = Seance();
  List<Candidat> candidats= [] ;
  var isLoading = false.obs ;
  CoatchFunctions function = CoatchFunctions();

  getSeanceId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    function.getSeancesId(token, id).then((value){
      var jsonResponse = json.decode(value.body);
      seance = Seance.fromJson(jsonResponse);
      for(var element in jsonResponse['candidats']){
        candidats.add(Candidat.fromJson(element));
      }
      isLoading.value = false ;
      update();
    });
  }


  @override
  void onInit() {
    isLoading.value = true ;
    ids = Get.arguments.first.toString();
    update();
    getSeanceId(ids).then((value){
      update();
    });
    super.onInit();
  }


}