import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import '../../domain/models/user.dart';
import 'package:http/http.dart' as http;
class PeticionUser {

  static var jsonTest = '[{"id":"44","nombre":"nombre de prueba","rol":"admin","user":"usuario de prueba"},{"id":"45","nombre":"","rol":"","user":""},{"id":"47","nombre":"","rol":"","user":""},{"id":"48","nombre":"","rol":"","user":""},{"id":"50","nombre":"","rol":"","user":""},{"id":"51","nombre":"","rol":"","user":""},{"id":"52","nombre":"","rol":"","user":""},{"id":"53","nombre":"","rol":"","user":""},{"id":"54","nombre":"","rol":"","user":""},{"id":"55","nombre":"","rol":"","user":""},{"id":"56","nombre":"","rol":"","user":""},{"id":"57","nombre":"","rol":"","user":""},{"id":"58","nombre":"","rol":"","user":""},{"id":"59","nombre":"","rol":"","user":""},{"id":"60","nombre":"","rol":"","user":""},{"id":"61","nombre":"","rol":"","user":""},{"id":"62","nombre":"","rol":"","user":""},{"id":"63","nombre":"","rol":"","user":""},{"id":"64","nombre":"","rol":"","user":""},{"id":"65","nombre":"","rol":"","user":""},{"id":"66","nombre":"","rol":"","user":""},{"id":"67","nombre":"","rol":"","user":""},{"id":"68","nombre":"","rol":"","user":""},{"id":"69","nombre":"","rol":"","user":""},{"id":"70","nombre":"","rol":"","user":""},{"id":"71","nombre":"","rol":"","user":""},{"id":"72","nombre":"","rol":"","user":""},{"id":"73","nombre":"","rol":"","user":""},{"id":"74","nombre":"","rol":"","user":""},{"id":"76","nombre":"","rol":"","user":""},{"id":"77","nombre":"","rol":"","user":""},{"id":"78","nombre":"","rol":"","user":""},{"id":"98","nombre":"","rol":"","user":""},{"id":"110","nombre":"","rol":"","user":""},{"id":"118","nombre":"","rol":"","user":""},{"id":"119","nombre":"","rol":"","user":""},{"id":"131","nombre":"","rol":"","user":""},{"id":"132","nombre":"","rol":"","user":""},{"id":"170","nombre":"","rol":"","user":""}]';

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


    return pasar.map<User>((json){
      log(User.desdeJson(json).nombre.toString());
      return User.desdeJson(json);
    }).toList();
  }

  static Future<String> registerUser(Map<String,dynamic> user) async {
    final client = http.Client();
    try{
      var url = Uri.parse("https://desarolloweb2021a.000webhostapp.com/APIMOVIL/agregarUser.php");

      final response = await client.post(url, body: {
        'nombre': user['nombre'],
        'rol': user['rol'],
        'user': user['user'],
        'pass': user['pass'],
      });
      if (kDebugMode) {
        print(response.body.toString());
      }
      final body = json.decode(response.body).cast<Map<String, dynamic>>();
      return body[0]['mensaje'];

    }finally{
      client.close();
    }
  }

  static List<User> pasarALista2(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }

  static Future<List<User>> allUsers() async{
    final client = http.Client();
    List<User> users = [];
    try{
      var url = Uri.parse("https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");

      final response = await client.get(url);
      if (kDebugMode) {
        print(response.body.toString());
      }


      //comment this line for change data local to API
      return compute(pasarALista, jsonTest);

      //comment this line for change data local to API
      //return compute(pasarALista, response.body);
    }finally{
      client.close();
    }
  }
}