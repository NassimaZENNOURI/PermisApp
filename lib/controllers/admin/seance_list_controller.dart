
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permisapp/apiFunctions/Functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Screens/admin/detail_seance.dart';
import '../../apiFunctions/AdminFunctions.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';

class SeancesListController extends GetxController{

  AdminFunctions function = AdminFunctions();
  TextEditingController searchController = TextEditingController();
  Seance seance = Seance();
  Seance seancedetails = Seance();
  List<Seance> seances = [] ;
  List<Candidat> candidats = [] ;
  Functions func = Functions();
  RxBool isLoading = false.obs;


  fetchSeanceId(Seance seance) async {
    candidats.clear();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getSeancesId(token, seance.id.toString()).then((value){
      if (value.statusCode == 200) {
        var jsonResponse = json.decode(value.body);
        for(var element in jsonResponse['candidats']){
          candidats.add(Candidat.fromJson(element));
          seancedetails = Seance.fromJson(jsonResponse);
        }
        update();
        Get.to(
              ()  => DetailSeance(seancedetails) , arguments: [candidats],
        );
      }
    });
    return candidats;
  }

  fetchSeances() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    function.getSeances(token).then((value){
      if (value.statusCode == 200) {
        var jsonResponse = json.decode(value.body);
        for (var i = 0; i < jsonResponse.length; i++) {
          seance = Seance.fromJson(jsonResponse[i]);
          seances.add(seance);
          update();
        }
      }
      isLoading.value = false;
      update();
    });
  }

  List<Seance> search()  {
    if (searchController.text.isEmpty) {
      return seances;
    } else {
      return seances.where((element) {
        return element.schoolName!.toLowerCase().contains(searchController.text.trim().toLowerCase()) || element.moniteurName!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    update();
    fetchSeances().then((value){
      update();
    });
  }

}