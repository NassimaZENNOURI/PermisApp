
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/functions.dart';
import '../../Screens/school/school_home_screen.dart';
import '../../apiFunctions/Functions.dart';
import '../../apiFunctions/SchoolFunctins.dart';
import '../../utils/models/Candidat.dart';
import '../../utils/models/Cars.dart';
import '../../utils/models/Moniteur.dart';
import '../../utils/models/Seance.dart';
import '../../utils/models/Users.dart';
import '../../utils/services.dart';

class SchoolAddSeanceController extends GetxController{

  SchoolFunctions functions = SchoolFunctions();
  Functions func = Functions();
  Seance seances = Seance();
  List<Seance> period = [] ;
  var seanceperiode = '';
  var coachname = '';
  List<int?> selectedCandidat = [];
  int selectedCoach = 0;
  int selectedCar = 0;
  int selectedperiod =  0;
  List<Candidat> candidats = [];
  Moniteur coach = Moniteur();
  List<Moniteur> coachs = [];
  Candidat candidat = Candidat();
  Cars car = Cars();
  List<Cars> cars =[];
  User user = User();
  var isLoading = false.obs;
  TextEditingController coachController = TextEditingController();
  TextEditingController carController = TextEditingController();
  TextEditingController periodController =TextEditingController();
  TextEditingController startdateController = TextEditingController();


  getCandidatSchool() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getCandidatSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            candidat = Candidat.fromJson(jsonResponse[i]);
            candidats.add(candidat);
          }
        }
        update();
      });
    });
  }

  getPeriod(){
    var response = functions.getPeriod();
    for(var i=0 ; i < response.length ; i ++ ){
      seances = Seance.fromJson(response[i]);
      period.add(seances);
      selectedperiod = period[0].periodId! ;
    }
  }
  getCoachSchool() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getCoachSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            coach = Moniteur.fromJson(jsonResponse[i]);
            coachs.add(coach);
            selectedCoach = coachs[0].id! ;
          }
        }
        update();
      });
    });
  }

  getCarsSchool() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    getUserFromMemory()!.then((value) {
      user = value;
      functions.getCarsSchool(token, value.id!).then((value) async {
        if (value.statusCode == 200) {
          var jsonResponse = json.decode(value.body);
          for (var i = 0; i < jsonResponse.length; i++) {
            car = Cars.fromJson(jsonResponse[i]);
            cars.add(car);
            selectedCar = cars[0].id! ;
          }
        }
        update();
      });
    });
  }

  addSeance() async {
    isLoading.value = true ;
    update();
    final prefs = await SharedPreferences.getInstance();
    Seance seance = Seance();
    String token = prefs.getString('token') ?? '';
    seance.dateStart = startdateController.text;
    seance.moniteurId = selectedCoach;
    seance.carId = selectedCar;
    seance.periodId = selectedperiod;
    if(selectedCandidat.length > 4){
      showAchievementView(false, tr("le_max_des_candidats_est_4"));
    }else if(selectedCandidat.isEmpty || seance.moniteurId == 0 || seance.carId == 0 || seance.periodId == 0 || seance.dateStart!.isEmpty) {
      showAchievementView(false, tr('remplir_tous_les_champs'));
    }else {
      func.getUser(token).then((value){
        var jsonResponse1 = json.decode(value.body);
        seance.schoolId = jsonResponse1['id'] ;
        print(jsonResponse1);
        functions.addSeance(seance, selectedCandidat , token).then((value) async {
          var jsonResponse = json.decode(value.body);
          if (value.statusCode == 201){
            Get.offAll(const SchoolHomeScreen());
            update();
            showAchievementView(true, tr('ajoute_avec_success'));
            //for(var i = 0 ; i < functions.getPeriod()[0].length ; i ++ ){
              if(functions.getPeriod()[0]["period_id"] == selectedperiod ){
                seanceperiode = functions.getPeriod()[0]["text"];
                print("seanceperiode => $seanceperiode");
              //}
            }
            for(var i = 0 ; i < coachs.length ; i ++ ){
              if(coachs[i].id == selectedCoach){
                coachname = coachs[i].name! ;
              }
            }
            var fcm = await  SessionManager().get("fcm");
            Functions.sendNotification(fcm, "DabaPermis", "Une nouvelle seance est ajouté :) ", seanceperiode, coachname, startdateController.text);
            isLoading.value = false ;
            update();
          } else {
            showAchievementView(false,jsonResponse['message']);
          }
        });
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true ;
    update();
    getCandidatSchool().then((value){
      getCoachSchool().then((value){
        getCarsSchool().then((value){
          //getSeance().then((value){
            getPeriod();
            isLoading.value = false;
            update();
          //});
        });
      });
    });
  }


}