import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Components/appVars.dart';

class CoatchFunctions {

  getCoachCandidat(String token, int id, String today) async {
    try {
      var response = await http.post(Uri.parse("${link}coach/$id/candidats"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "today": today,
          }));
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

  coachSeance(String token, int id, String notedate) async {
    try {
      var response = await http.post(Uri.parse("${link}coachs/$id/seances"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({
            "notedate": notedate,
          }));
      return response;
    } catch (e) {
      return e.toString();
    }
  }



}