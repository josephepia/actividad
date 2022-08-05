import 'package:actividad/domain/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  AuthController controladorUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://login.gov/assets/img/login-gov-288x288.png'),
              ),
              TextField(
                controller: controlUser,
                decoration:
                    const InputDecoration(labelText: "Ingrese el usuario"),
              ),
              TextField(
                controller: controlPass,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: "Ingrese la contraseña"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        controladorUser
                            .enviarDatos(controlUser.text,
                                controlPass.text)
                            .then((value) {
                          if (controladorUser.users != null) {
                            Get.offAllNamed('/principal');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: "Validacion de usuario",
                              message: "Verifique el usuario o la contraseña",
                              icon: Icon(Icons.person),
                              duration: Duration(seconds: 3),
                            ));
                          }
                        });
                      },
                      icon: const Icon(Icons.login)),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        Get.toNamed('/registeruser');
                      },
                      icon: const Icon(Icons.app_registration)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
