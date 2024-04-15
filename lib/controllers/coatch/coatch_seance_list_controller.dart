
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/coach/coatch_seance_profile.dart';
import '../../apiFunctions/CoachFunctions.dart';
import '../../apiFunctions/Functions.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Seance.dart';

class CoatchSeanceListController extends GetxController{


  List<Seance> seances = [];
  Seance seance = Seance();
  RxBool isLoading = false.obs;
  Functions func = Functions();
  List<Candidat> candidats = [] ;
  CoatchFunctions function = CoatchFunctions();


  getCoatchSeance() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var jsonResponse = json.decode(value.body);
      function.coachSeance(token, jsonResponse['id'], 'false').then((value){
        print(value.statusCode);
        print(value.body);
        if (value.statusCode == 201) {
          var jsonResponse = json.decode(value.body);
          print(jsonResponse);
          for(var element in jsonResponse ){
            seance = Seance.fromJson(element);
            seances.add(Seance.fromJson(element));
          }
          update();
        }
      });
    });
  }

  fetchCoatchCandidats() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getUser(token).then((value){
      var jsonResponse = json.decode(value.body);
      function.getCoachCandidat(token, jsonResponse['id'], 'true').then((value){
        var jsonResponse = json.decode(value.body);
        for(var element in jsonResponse['candidats']){
          candidats.add(Candidat.fromJson(element));
        }
        update();
      });
    });

  }



  fetchSeanceId(String id) async {
    candidats.clear();
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    func.getSeancesId(token, id).then((value){
      if (value.statusCode == 200) {
        var jsonResponse = json.decode(value.body);
        for(var element in jsonResponse['candidats']){
          candidats.add(Candidat.fromJson(element));
        }
        update();
        Get.to(
              ()  => CoatchSeanceProfile() , arguments: [candidats , seance],
        );
      }
    });
    return candidats;
  }

  @override
  void onInit() {
    isLoading.value= true;
    update();
    getCoatchSeance().then((value){
      update();
      fetchCoatchCandidats().then((value){
        isLoading.value = false;
        update();
      });
    });
    super.onInit();
  }

}