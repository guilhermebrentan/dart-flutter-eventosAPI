import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

var funcionarios = [];

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<String>(
      //inicio com o FutureBuilder que irá recolher os funcionarios da API
      future: getFuncionarios(), //através deste método
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          //switch de conexão
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.data == 'erro') {
              return Center(
                child: Text("Erro ao carregar dados"),
              );
            } else {
              return ListView.builder(
                //monto a lista de funcionarios através do builder do ListView
                itemCount: funcionarios.length,
                itemBuilder: (content, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          funcionarios[index].foto), //coloco a foto
                      radius: 30.0,
                    ),
                    title: Text(
                      funcionarios[index].nome, //o nome
                      style: TextStyle(fontSize: 25.0),
                    ),
                    subtitle: Text(
                      funcionarios[index].apelido +
                          '\n' +
                          funcionarios[index]
                              .departamento, //apelido e departamento
                      style: TextStyle(fontSize: 17.0),
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }
}

//método para ressgatar os funcionarios da API
Future<String> getFuncionarios() async {
  var response = 'erro';

  final Funcionario resultadoFuncionarios = await Conexao.getFuncionarios();
  for (var funcionario in resultadoFuncionarios.funcionarios) {
    if (funcionario != null) {
      response = 'ok';
    } else {
      response = 'erro';
    }
  }

  funcionarios = resultadoFuncionarios.funcionarios;
  return response;
}
