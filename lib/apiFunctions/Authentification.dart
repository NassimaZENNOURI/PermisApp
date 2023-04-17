import 'package:http/http.dart' as http;
import 'dart:convert';

class Authentification {

  login(String email, String password) async {
    try {
      var response = await http
          .post(Uri.parse("https://dabapermisv2.medyouin.com/api/login"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({"email": email, "password": password}))
          .timeout(const Duration(seconds: 10));
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

}