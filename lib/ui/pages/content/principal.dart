import 'package:actividad/domain/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  AuthController controladorUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu principal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controladorUser.users![0].id),
            Text(controladorUser.users![0].nombre),
            Text(controladorUser.users![0].rol),
            Text(controladorUser.users![0].user),
            ElevatedButton(
                onPressed: (){
                  Get.offAllNamed('/auth');
                },
                child: const Text("salir")
            )
          ],
        ),
      ),
    );
  }
}
