import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/auth_controller.dart';
import '../../widgets/card_item_list.dart';

class ListarUsers extends StatefulWidget {
  const ListarUsers({Key? key}) : super(key: key);

  @override
  State<ListarUsers> createState() => _ListarUsersState();
}

class _ListarUsersState extends State<ListarUsers> {
  AuthController controladorAuth = Get.find();
  @override
  Widget build(BuildContext context) {
    controladorAuth.listUsers();


    return Scaffold(
      body: Obx(
              () => controladorAuth.users?.isEmpty == false?
          ListView.builder(
            itemCount: controladorAuth.users?.isEmpty == true ? 0 :
            controladorAuth.users!.length,
            itemBuilder: (context, posicion){
              return CardItemList(
                title: 'nombre: '+controladorAuth.users![posicion].nombre,
                subtitle: 'rol: '+controladorAuth.users![posicion].rol,
                //trailing: 'id'+controladorAuth.users![posicion].id,
              );
            },
          ) : const Icon(Icons.abc)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Get.toNamed('/creararticulos');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
