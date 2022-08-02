import 'dart:convert';
import 'package:actividad/domain/models/articulo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'dart:developer';

class PeticionesArticulo {

 static final fs.FirebaseStorage storage= fs.FirebaseStorage.instance;
 static final FirebaseFirestore _db = FirebaseFirestore.instance;

 static Future<void> crearArticulo(Map<String,dynamic> catalogo, foto) async {
   var url = '';
   if(foto != null) {
     url = await cargarFoto(foto, catalogo['idArticulo']);
   }
     catalogo['foto'] = url.toString();

     await _db.collection('Articulos').doc().set(catalogo).catchError((e){});


 }

 static Future<dynamic> cargarFoto(var foto, var idArt) async{
   final fs.Reference storageReference = fs.FirebaseStorage.instance.ref().child('Articulos');

   fs.TaskSnapshot taskSnapshot =
       await storageReference.child(idArt).putFile(foto);

   var url = await taskSnapshot.ref.getDownloadURL();

   return url.toString();
 }

 static Future<void> actualizarArticulo(
     String id, Map<String,dynamic> catalogo
     ) async{
   await _db.collection('Articulos').doc(id).update(catalogo).catchError((e){});
 }

 static Future<void> eliminarcatalogo(String id) async {
   await _db.collection('Articulos').doc(id).delete().catchError((e){
     log(e);
   });
 }

 static Future<dynamic> consultaGral() async {

   List<Articulo> lista = [];

   await _db.collection("Articulos").get().then((respuesta) {
     for (var doc in respuesta.docs) {
       log(doc.data().toString());
       lista.add(Articulo.desdeJson(doc.data()));
     }
   });
   return lista;
 }
}