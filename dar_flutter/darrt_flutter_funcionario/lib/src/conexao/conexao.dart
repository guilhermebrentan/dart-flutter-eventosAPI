import 'dart:convert';
import 'package:darrt_flutter_funcionario/src/models/eventos_model.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/models/locais_model.dart';
import 'package:darrt_flutter_funcionario/src/models/tipos_model.dart';
import 'package:darrt_flutter_funcionario/src/models/resultados_model.dart';
import 'package:http/http.dart' as http;

class Conexao {
  static var json;
  static var api = "192.168.15.11:3000";

  static Future<Funcionario> getFuncionarios() async {
    Funcionario funcionario =
        new Funcionario(23, 'nome', 'apelido', 'departamento', 'foto');
    try {
      json = await http.get(Uri.http(api, 'funcionarios'));
      funcionario.fromJson(jsonDecode(json.body));
    } catch (Exception) {
      print(Exception);
    }
    return funcionario;
  }

  static Future<Locais> getLocais() async {
    Locais local = new Locais(23, 'nome', 'foto');
    try {
      json = await http.get(Uri.http(api, 'locais'));
      local.fromJson(jsonDecode(json.body));
    } catch (Exception) {
      print(Exception);
    }
    return local;
  }

  static Future<Tipos> getTipos() async {
    Tipos tipo = new Tipos(23, 'nome');
    try {
      json = await http.get(Uri.http(api, 'tiposDeEvento'));
      tipo.fromJson(jsonDecode(json.body));
    } catch (Exception) {
      print(Exception);
    }
    return tipo;
  }

  static Future<Eventos> getEventos() async {
    Eventos eventos = new Eventos(2, 'participantes', 'dia', 'horario', 3, 4);
    try {
      json = await http.get(Uri.http(api, 'eventos'));
      eventos.fromJson(jsonDecode(json.body));
    } catch (Exception) {
      print(Exception);
    }
    return eventos;
  }

  static Resultados postEvento(String comando) {
    Resultados resultados = new Resultados('resultado');
    try {
      json = http.post(Uri.http(api, 'eventos/' + comando));
      resultados.fromJson(json.body);
    } catch (Exception) {
      print(Exception);
    }
    return resultados;
  }

  static Resultados deleteEvento(String comando) {
    Resultados resultados = new Resultados('resultado');
    try {
      json = http.delete(Uri.http(api, 'eventos/' + comando));
      resultados.fromJson(json.body);
    } catch (Exception) {
      print(Exception);
    }
    return resultados;
  }
}
