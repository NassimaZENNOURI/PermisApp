import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Components/appVars.dart';

class Authentification {

  login(String email, String password) async {
    try {
      var response = await http
          .post(Uri.parse("https://dabapermisv2.medyouin.com/api/login"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({"email": email, "password": password})).timeout(const Duration(seconds: 10));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  getUser(String token) async {
    try {
      var response = await http.get(
        Uri.parse("https://dabapermisv2.medyouin.com/api/me"),
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

  logout(String token) async {
    try {
      var response = await http.post(Uri.parse("${link}logout"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
          body: jsonEncode({"email": 'email', "password": 'password'}));
      print(json.decode(response.body)['message']);
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

}