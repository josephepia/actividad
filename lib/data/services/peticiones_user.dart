import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../domain/models/user.dart';
import 'package:http/http.dart' as http;
class PeticionUser {
  static Future<List<User>> validarUser(http.Client client, String user, String pass) async {
    var url = Uri.parse("https://desarrolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");

    final response = await http.post(url, body: {
      'user': user,
      'pass': pass,
    });

    if (kDebugMode) {
      print(response.body.toString());
    }
    return compute(pasarALista, response.body);
  }

  static List<User> pasarALista(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}