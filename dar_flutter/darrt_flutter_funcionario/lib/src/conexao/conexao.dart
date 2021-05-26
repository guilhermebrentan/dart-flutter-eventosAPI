//import 'dart:collection';
import 'dart:convert';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:http/http.dart' as http;

class Conexao {
  static var json;
  static var api = "192.168.15.11:3000";

  static Future<bool> getDados() async {
    try {
      json = await http.get(Uri.http(api, 'funcionarios'));
      Funcionario.fromJson(jsonDecode(json.body));
    } catch (Exception) {
      print(Exception);
    }
    return true;
  }
}
