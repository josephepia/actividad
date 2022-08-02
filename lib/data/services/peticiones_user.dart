import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../domain/models/user.dart';
import 'package:http/http.dart' as http;
class PeticionUser {

  static Future<List<User>> validarUser(String user, String pass) async {
    final client = http.Client();
    try{
      var url = Uri.parse("https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");

      final response = await client.post(url, body: {
        'user': user,
        'pass': pass,
      });
      if (kDebugMode) {
        print(response.body.toString());
      }
      return compute(pasarALista, response.body);
    }finally{
      client.close();
    }
  }

  static List<User> pasarALista(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }

  static Future<List<User>> registerUser(User user, String pass) async {
    final client = http.Client();
    try{
      var url = Uri.parse("https://desarolloweb2021a.000webhostapp.com/APIMOVIL/agregarUser.php");

      final response = await client.post(url, body: {
        'nombre': user.nombre,
        'rol': user.rol,
        'user': user.user,
        'pass': pass,
      });
      if (kDebugMode) {
        print(response.body.toString());
      }
      return compute(pasarALista, response.body);
    }finally{
      client.close();
    }
  }

  static List<User> pasarALista2(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}