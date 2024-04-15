import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Components/appVars.dart';

class CandidatFunctions {

  getCandidatSeances(String token, String today) async {
    try {
      var response = await http.post(Uri.parse("${link}candidat/seances"),
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

}