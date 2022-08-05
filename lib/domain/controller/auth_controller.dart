
import 'package:actividad/data/services/peticiones_user.dart';
import 'package:actividad/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class AuthController extends GetxController {
  final Rxn<List<User>> _users = Rxn<List<User>>();

  List<User>? get users => _users.value;

  Future<void> enviarDatos(
      String user,
      String pass
      ) async{
    _users.value = await PeticionUser.validarUser(user, pass);
  }

  Future<void> listUsers() async{
    _users.value = await PeticionUser.allUsers();
  }

  Future<String> registrarUser(
      Map<String, dynamic> user
      ) async{
    return PeticionUser.registerUser(user);
  }
}