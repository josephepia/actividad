import 'package:actividad/domain/controller/auth_controller.dart';
import 'package:actividad/ui/pages/articles/listar_articulos.dart';
import 'package:actividad/ui/pages/usuarios/listar_user.dart';
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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Menú principal"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.logout))
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.verified_user)),
                Tab(icon: Icon(Icons.checklist))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListarUsers(),
              ListarArticulos()
            ],
          ),
        )
    );
  }
}
