import 'package:actividad/domain/controller/articulos_controller.dart';
import 'package:actividad/domain/models/articulo.dart';
import 'package:actividad/ui/widgets/card_item_list.dart';
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
                  return CardItemList(
                    imageLeadingUrl: controladorArticulo.getArticulosGral![posicion].foto,
                    title: controladorArticulo.getArticulosGral![posicion].detalle,
                    subtitle: controladorArticulo.getArticulosGral![posicion].marca,
                    trailing: controladorArticulo.getArticulosGral![posicion].cantBodega,
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
