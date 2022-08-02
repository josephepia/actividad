import 'package:actividad/domain/controller/articulos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListarArticulos extends StatefulWidget {
  const ListarArticulos({Key? key}) : super(key: key);

  @override
  State<ListarArticulos> createState() => _ListarArticulosState();
}

class _ListarArticulosState extends State<ListarArticulos> {
  ConsultasController controladorArticulo = Get.find();


  @override
  Widget build(BuildContext context) {
    controladorArticulo.consultaArticulos();
    return Scaffold(
      body: Obx(
          () => controladorArticulo.getArticulosGral?.isEmpty == true?
              ListView.builder(
                itemCount: controladorArticulo.getArticulosGral?.isEmpty == true ? 0 :
                controladorArticulo.getArticulosGral!.length,
                itemBuilder: (context, posicion){
                  return ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      child: Image.network(
                        controladorArticulo.getArticulosGral![posicion].foto
                      ),
                    ),
                    title: Text(controladorArticulo.getArticulosGral![posicion].detalle),
                    subtitle: Text(controladorArticulo.getArticulosGral![posicion].marca),
                    trailing: Container(
                      width: 80,
                      height: 40,
                      color: Colors.yellow,
                      child: Text(controladorArticulo.getArticulosGral![posicion].cantBodega),
                    ),
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
