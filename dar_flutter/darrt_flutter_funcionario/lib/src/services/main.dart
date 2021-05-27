import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

var funcionarios = [];
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
  return FutureBuilder<String>(
    future: getFuncionarios(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        default:
          if (snapshot.data == 'erro') {
            return Center(
              child: Text("Erro ao carregar dados"),
            );
          } else {
            return ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(funcionarios[0].foto),
                      radius: 30),
                  title: Text(funcionarios[0].nome,
                      style: TextStyle(fontSize: 25.0)),
                  subtitle: Text(
                      funcionarios[0].apelido +
                          '\n' +
                          funcionarios[0].departamento,
                      style: TextStyle(fontSize: 17.0)),
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(funcionarios[1].foto),
                      radius: 30),
                  title: Text(funcionarios[1].nome,
                      style: TextStyle(fontSize: 25.0)),
                  subtitle: Text(
                      funcionarios[1].apelido +
                          '\n' +
                          funcionarios[1].departamento,
                      style: TextStyle(fontSize: 17.0)),
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(funcionarios[2].foto),
                      radius: 30),
                  title: Text(funcionarios[2].nome,
                      style: TextStyle(fontSize: 25.0)),
                  subtitle: Text(
                      funcionarios[2].apelido +
                          '\n' +
                          funcionarios[2].departamento,
                      style: TextStyle(fontSize: 17.0)),
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(funcionarios[3].foto),
                      radius: 30),
                  title: Text(funcionarios[3].nome,
                      style: TextStyle(fontSize: 25.0)),
                  subtitle: Text(
                      funcionarios[3].apelido +
                          '\n' +
                          funcionarios[3].departamento,
                      style: TextStyle(fontSize: 17.0)),
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(funcionarios[4].foto),
                      radius: 30),
                  title: Text(funcionarios[4].nome,
                      style: TextStyle(fontSize: 25.0)),
                  subtitle: Text(
                      funcionarios[4].apelido +
                          '\n' +
                          funcionarios[4].departamento,
                      style: TextStyle(fontSize: 17.0)),
                ),
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(funcionarios[5].foto),
                      radius: 30),
                  title: Text(funcionarios[5].nome,
                      style: TextStyle(fontSize: 25.0)),
                  subtitle: Text(
                      funcionarios[5].apelido +
                          '\n' +
                          funcionarios[5].departamento,
                      style: TextStyle(fontSize: 17.0)),
                ),
              ],
            );
          }
      }
    },
  );
}

Future<String> getFuncionarios() async {
  var response = 'erro';
  final Funcionario resultado = await Conexao.getDados();

  for (var funcionario in resultado.funcionarios) {
    if (funcionario != null) {
      response = 'ok';
    } else {
      response = 'erro';
    }
  }

  funcionarios = resultado.funcionarios;
  return response;
}
