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
          () => controladorArticulo.getArticulosGral?.isEmpty == false?
              ListView.builder(
                itemCount: controladorArticulo.getArticulosGral?.isEmpty == true ? 0 :
                controladorArticulo.getArticulosGral!.length,
                itemBuilder: (context, posicion){
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 20.0
                        )
                      ]
                    ),
                    child: Card(
                      elevation: 0,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(controladorArticulo.getArticulosGral![posicion].foto),
                        ),
                        title: Text(controladorArticulo.getArticulosGral![posicion].detalle),
                        subtitle: Text(controladorArticulo.getArticulosGral![posicion].marca),
                        trailing: Container(
                          width: 80,
                          height: 40,
                          // color: Colors.yellow,
                          child: Text(
                              controladorArticulo.getArticulosGral![posicion].cantBodega,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
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
