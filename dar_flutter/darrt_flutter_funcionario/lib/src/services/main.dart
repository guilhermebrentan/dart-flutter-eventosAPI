import 'package:darrt_flutter_funcionario/src/models/locais_model.dart';
import 'package:darrt_flutter_funcionario/src/models/tipos_model.dart';
import 'package:darrt_flutter_funcionario/src/services/telaCriar.dart';
import 'package:darrt_flutter_funcionario/src/services/telaExibir.dart';
import 'package:darrt_flutter_funcionario/src/services/telaInicial.dart';
import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(
        //indico a presença do Widget de abas na aplicação
        length: 3, //quantas abas haverá
        initialIndex: 1, //em qual começar
        child: FutureBuilder<String>(
            //dou inicio a um FutureBuilder, onde irei requisitar todos os dados prévios
            future: getDados(),
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
                    return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.lightGreen,
                          title: Text(
                            'AgendaMeet', //nome do nosso aplicativo
                          ),
                          centerTitle: true,
                          bottom: TabBar(
                            tabs: <Widget>[
                              //coloco um ícone em cada uma das abas
                              Tab(icon: Icon(Icons.add)),
                              Tab(icon: Icon(Icons.list)),
                              Tab(icon: Icon(Icons.edit)),
                            ],
                          ),
                        ),
                        body: TabBarView(children: [
                          //chamo as telas responsáveis por cada parte da aplicação
                          TelaCriar(),
                          TelaInicial(),
                          TelaExbir(),
                        ]));
                  }
              }
            })),
  ));
}

//método para pegar todos os dados diretamente da API Rest
Future<String> getDados() async {
  var response = 'erro';

  final Funcionario resultadoFuncionarios = await Conexao.getFuncionarios();
  for (var funcionario in resultadoFuncionarios.funcionarios) {
    if (funcionario != null) {
      response = 'ok';
    } else {
      response = 'erro';
    }
  }

  final Locais resultadoLocais = await Conexao.getLocais();
  for (var local in resultadoLocais.locais) {
    if (local != null) {
      response = 'ok';
    } else {
      response = 'erro';
    }
  }

  final Tipos resultadoTipos = await Conexao.getTipos();
  for (var tipo in resultadoTipos.tipos) {
    if (tipo != null) {
      response = 'ok';
    } else {
      response = 'erro';
    }
  }

//após fazer verificações eu mando os dados recebidos para as respectivas telas necessárias
  receberDadosCriar(resultadoFuncionarios.funcionarios, resultadoLocais.locais,
      resultadoTipos.tipos);

  receberDadosExibir(resultadoFuncionarios.funcionarios, resultadoLocais.locais,
      resultadoTipos.tipos);

  return response; //retorno se houve erro ou não
}
