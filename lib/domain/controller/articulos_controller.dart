import 'package:actividad/data/services/peticiones_articulo.dart';
import 'package:actividad/data/services/peticiones_user.dart';
import 'package:actividad/domain/models/articulo.dart';
import 'package:actividad/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ConsultasController extends GetxController {
  final Rxn<List<Articulo>> _articulosFireStore = Rxn<List<Articulo>>();

  Future<void> consultaArticulos() async{
    _articulosFireStore.value = await PeticionesArticulo.consultaGral();
  }

  List<Articulo>? get getArticulosGral => _articulosFireStore.value;
}