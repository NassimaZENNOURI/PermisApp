import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Screens/school/school_seance_profile.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';
import '../../utils/models/Users.dart';
import '../../utils/services.dart';

class SchoolSeanceListController extends GetxController{

  TextEditingController searchController = TextEditingController();
  SchoolFunctions functions = SchoolFunctions();
  List<Seance> seances = [];
  Seance seanceid = Seance();
  Seance seance = Seance();
  List<Candidat> candidats = [] ;
  User user = User();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isLoading.value = true;
    update();
    fetchSeance().then((value) {
      update();
    });
    super.onInit();
  }

  List<Seance> search()  {
    if (searchController.text.isEmpty) {
      return seances;
    } else {
      return seances.where((element) {
        return element.moniteurName!.toLowerCase().contains(searchController.text.trim().toLowerCase());
      }).toList();
    }
  }

  fetchSeanceId(Seance seance) async {
    candidats.clear();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    functions.getSeancesId(token, seance.id.toString()).then((value){
      if (value.statusCode == 200) {
        var jsonResponse = json.decode(value.body);
        print(seance.id);
        for(var element in jsonResponse['candidats']){
          candidats.add(Candidat.fromJson(element));
        }
        update();
        Get.to(
              ()  => SchoolSeanceProfile(seance) , arguments: [candidats],
        );
      }
    });
    return candidats;
  }


  fetchSeance() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getSeanceSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            seance = Seance.fromJson(jsonResponse[i]);
            seances.add(seance);
          }
        }
        isLoading.value = false;
        update();
      });
    });
  }

}
