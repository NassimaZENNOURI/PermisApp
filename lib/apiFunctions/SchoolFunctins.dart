import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Components/appVars.dart';
import '../utils/models/Candidat.dart';
import '../utils/models/Moniteur.dart';
import '../utils/models/Seance.dart';
import '../utils/models/school.dart';

class SchoolFunctions {

  addSeance(Seance sc,List<int?> candidats, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}seances"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "school": sc.schoolId,
            "time": sc.periodId,
            "date": sc.dateStart,
            "moniteur": sc.moniteurId,
            "candidates": candidats,
            "car": sc.carId
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getCandidatSchool(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/candidats"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getCarsSchool(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/cars"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getCoachSchool(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/coachs"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getFactureSchool(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/facturations"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }
  getPeriod() {
    var response = [
      {"period_id" : 1 , "text": "08-09"},
      {"period_id" : 2 , "text": "09-10"},
      {"period_id" : 3 , "text": "10-11"},
      {"period_id" : 4 , "text": "11-12"},
      {"period_id" : 5 , "text": "12-13"},
      {"period_id" : 6 , "text": "13-14"},
      {"period_id" : 7 , "text": "14-15"},
      {"period_id" : 8 , "text": "15-16"},
      {"period_id" : 9 , "text": "16-17"},
      {"period_id" : 10 , "text": "17-89"},
      {"period_id" : 11 , "text": "18-19"},
    ];
    return response ;
  }

  getSeanceSchool(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id/seances"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }


  getSeancesId(String token, String id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}seances/$id"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  addMoniteur(Moniteur mn,  String token) async {
    try {
      var response = await http.post(Uri.parse("${link}coachs"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
          "name" : mn.name,
          "email" : mn.email,
          "phoneNo" : mn.phoneNo,
          "photo" : mn.photo,
          "photoName": mn.photoName,
          "school_id" : int.parse(mn.schoolId.toString()),
          "password" : "123456789",
          "birthdate" : mn.birthdate,
          "sexe" : mn.sexe.toString() ,
          "cni" : mn.cni,
          "numeroCarteMoniteur" :mn.numeroCarteMoniteur,
          "cniRecto" : mn.cniRecto,
          "cniRectoName" : mn.cniRectoName,
          "cniVerso" :mn.cniVerso,
          "cniVersoName" : mn.cniVersoName,
          "carteMoniteur" : mn.carteMoniteur,
          "carteMoniteurName" : mn.carteMoniteurName,
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  addCandidat(Candidat mn,  String token,) async {
    try {
      var response = await http.post(Uri.parse("${link}candidats"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "name": mn.name,
            "email": mn.email,
            "phoneNo": mn.phoneNo,
            "school_id": mn.schoolId,
            "password": "123456789",
            "birthdate": mn.birthdate,
            "sexe": mn.sexe == "Homme" ? '1' : '0',
            "cni": mn.cni,
            "cniRecto": mn.cniRecto,
            "cniRectoName": mn.cniRectoName,
            "cniVerso": mn.cniVerso,
            "cniVersoName": mn.cniVersoName,
            "photo": mn.photo,
            "photoName": mn.photoName,
            "tarif": mn.tarifs,
            "paid": mn.paid,
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  addCandidatImage(Candidat mn,String token, int idm) async {
    try {
      var response = await http.put(Uri.parse("${link}candidatsimages/$idm"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "tarif": mn.tarifs,
            "paid": mn.paid,
            "contrat": mn.contrat,
            "contratName": mn.contratName,
            "certificat": mn.certificat,
            "certificatName": mn.certificatName,
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }




  editCandidat(Candidat candidat, String token) async {
    try {
      var response =
          await http.put(Uri.parse("${link}candidats/${candidat.id}"),
              headers: {
                "Content-type": "application/json",
                "Accept": "application/json",
                "Authorization": "Bearer $token",
              },
              body: jsonEncode({
                'name': candidat.name,
                'phoneNo': candidat.phoneNo,
                'password': '123456789',
                'birthdate': candidat.birthdate,
                'sexe': candidat.sexe == 'Homme' ? '1' : '2',
                'cni': candidat.cni,
                'paid': candidat.paid,
                'photo': '',
                'photoName': '',
              }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  editSchool(String token, Schools sc, String password) async {
    try {
      var response = await http.put(Uri.parse("${link}schools/${sc.id}"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "fullname": sc.name,
            "school_name": sc.school_name,
            "city": sc.city,
            "adress": sc.address,
            "phone": sc.phoneNo,
            "password": password,
            "description": sc.description
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
