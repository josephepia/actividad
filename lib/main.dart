import 'package:actividad/domain/controller/articulos_controller.dart';
import 'package:actividad/domain/controller/auth_controller.dart';
import 'package:actividad/firebase_options.dart';
import 'package:actividad/ui/pages/articles/creararticulos.dart';
import 'package:actividad/ui/pages/articles/listar_articulos.dart';
import 'package:actividad/ui/pages/auth/login.dart';
import 'package:actividad/ui/pages/content/principal.dart';
import 'package:actividad/ui/pages/usuarios/listar_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  Get.put(ConsultasController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/auth',
      routes: {
        '/principal': (context) => const Principal(),
        '/auth': (context) => const Login(),
        '/listarusers': (context) => const ListarUsers(),
        '/listararticulos': (context) => const ListarArticulos(),
        '/creararticulos': (context) => const CrearArticulos(),
      },
    );
  }
}
