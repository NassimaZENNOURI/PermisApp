import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/appVars.dart';
import '../utils/models/Candidat.dart';
import '../utils/models/Cars.dart';
import '../utils/models/school.dart';

class AdminFunctions {

  var isLoading = true.obs;


  UpdateStatus(String token, int id, String status, String email, String name) async {
    try {
      var response = await http.put(Uri.parse("${link}users/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "status": status,
            "name": name,
            "email": email,
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }



  ShowCondidatsId( int id, String token) async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("${link}candidats/$id"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response ;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getCandidats(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}candidats"),
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
  getSchools(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools"),
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
  getCars(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}cars"),
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
  getFacture(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}facturations"),
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
  getCoach(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}coachs"),
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
  getInscription(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}inscriptions"),
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
  getAll(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}users"),
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
  getUser(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}me"),
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

  addCandidat(Candidat candidat, String schoolId, String token,String base64) async {

    try {
      var response = await http.post(Uri.parse("${link}candidats"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "name" : candidat.name,
            "email" : candidat.email,
            "phoneNo" :candidat.phoneNo,
            "school_id" :schoolId,
            "password" :"123456789",
            "birthdate" :candidat.birthdate,
            "sexe" :candidat.sexe=="Homme"?'1':'0',
            "cni" :candidat.cni,
            "cniRectoName" :candidat.cniRecto,
            "cniVerso" :candidat.cniVerso,
            "photo" :candidat.photo,
            "tarif":candidat.tarifs,
            "paid":candidat.paid,
          })
      );
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }


  }
  addSchool(Schools sc, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}schools"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "email":sc.email,
            "role":"ROLE_SCHOOL",
            "fullname":sc.name,
            "school_name": sc.school_name,
            "city": sc.city,
            "adress": sc.address,
            "phone": sc.phoneNo,
            "password": "123456789",
            "description":"مدرسة لتعليم القيادة"
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  addCar(Cars sc, String token) async {
    try {
      var response = await http.post(Uri.parse("${link}cars"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            'brand' : sc.brand,
            'version' : sc.version,
            'engine' : sc.engine,
            'color' : sc.color,
            'matricule' : sc.matricule,
            'kilometrage' : sc.kilometrage,
            'school_id' : sc.schoolId,
            'photo' : sc.photo,
            'photoName' : sc.photoName,
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  searchSchoolid(String token, int id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}schools/$id"),
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

  deleteCandidat(String token, int id) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}candidats/$id"),
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
  deleteCoach(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}coachs/$name"),
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
  deleteSchool(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}schools/$name"),
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
  deleteFacture(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}facturations/$name"),
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
  deleteSeance(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}seances/$name"),
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
  deleteUser(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}users/$name"),
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
  deleteCar(String token, int name) async {
    try {
      var response = await http.delete(
        Uri.parse("${link}cars/$name"),
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

  updateAdmin(String token, int id,String name,String email) async {
    try {
      var response = await http.put(Uri.parse("${link}admin/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "name": name,
            "email":email
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  updateStatus(String token, int id,int status,String email,String name) async {
    try {
      var response = await http.put(Uri.parse("${link}users/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "status": status,
            "name": name,
            "email": email,
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  modifyPassword(String token, int id, String previousPassword, String newPassword) async {
    try {
      var response = await http.put(Uri.parse("${link}updatePassword/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "previousPassword": previousPassword,
            "newPassword": newPassword,
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getSeances(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}seances"),
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

  updatePassword(String token, int id,String oldPassword,String newPassword,String confirmPassword) async {
    try {
      var response = await http.put(Uri.parse("${link}usersPassword/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "oldPassword": oldPassword,
            "newPassword": newPassword,
            "confirmPassword": confirmPassword,
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
  updateInscription(String token, int id,int status) async {
    try {
      var response = await http.put(Uri.parse("${link}inscriptions/$id"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "status": status
          }));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

}