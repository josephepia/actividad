import 'package:actividad/data/services/peticiones_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlRol = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: controlNombre,
              decoration:
              const InputDecoration(labelText: 'Ingrese el nombre completo'),
            ),
            TextField(
              controller: controlUser,
              decoration: const InputDecoration(labelText: 'Ingrese nombre de usuario'),
            ),
            TextField(
              controller: controlRol,
              decoration: const InputDecoration(
                  labelText: 'Ingrese el rol'),
            ),
            TextField(
              controller: controlPass,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Ingrese la contraseña'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  var user = <String, dynamic>{
                    'nombre': controlNombre.text,
                    'user': controlUser.text,
                    'rol': controlRol.text,
                    'pass': controlPass.text,
                  };

                   PeticionUser.registerUser(user).then((value){
                    Get.back();
                    Get.showSnackbar( GetSnackBar(
                      title: "Mensaje",
                      message: value,
                      icon: Icon(Icons.person),
                      duration: Duration(seconds: 3),
                    ));

                    
                  });
                },
                child: const Text("Enviar"))
          ],
        ),
      ),
    );
  }
}
