
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiFunctions/Functions.dart';
import '../../utils/models/Facture.dart';

class SchoolFactureProfileController extends GetxController{

  Facture facture = Facture();
  Functions functions = Functions();

  getFactureId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    functions.getFacturesId(token, id).then((value){
      if (value.statusCode == 200) {
        var jsonResponse = json.decode(value.body);
        facture = Facture.fromJson(jsonResponse);
      }
    });
  }

  @override
  void onInit() {
    facture = Get.arguments.first ;
    // getFactureId(facture.id.toString());
    update();
    super.onInit();
  }

}