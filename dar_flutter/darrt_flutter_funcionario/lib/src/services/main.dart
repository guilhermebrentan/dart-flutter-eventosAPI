import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Funcionários',
          ),
        ),
        body: buildContainer());
  }
}

buildContainer() {
  return FutureBuilder<Funcionario>(
    future: getFuncionarios(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        default:
          if (snapshot.hasError) {
            return Center(
              child: Text("Erro ao carregar dados"),
            );
          } else {
            return Center(
              child: Text(
                  'Nome: ' +
                      snapshot.data.nome +
                      '\n' +
                      'Apelido: ' +
                      snapshot.data.apelido,
                  style: TextStyle(fontSize: 20.0)),
            );
          }
      }
    },
  );
}

Future<Funcionario> getFuncionarios() async {
  final response = await Conexao.getDados();

  for (var funcionario in response.funcionarios) {
    if (funcionario != null) {
      return funcionario;
    } else {
      throw Exception('Falha ao carregar dados...');
    }
  }
  return null;
}
