import 'package:darrt_flutter_funcionario/src/models/locais_model.dart';
import 'package:darrt_flutter_funcionario/src/models/tipos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

var funcionarios = [];
var locais = [];
var tipos = [];
var localSelecionado;
var tipoSelecionado;
String nomeCidade = "";

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: true,
        home: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightGreen,
                title: Text(
                  'AgendaMeet',
                ),
                centerTitle: true,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.add)),
                    Tab(icon: Icon(Icons.list)),
                    Tab(icon: Icon(Icons.edit)),
                  ],
                ),
              ),
              body: TabBarView(children: [
                CriarEvento(),
                buildContainerFuncionario(),
                buildContainerListar(),
              ])),
        )),
  );
}

buildContainerFuncionario() {
  return new FutureBuilder<String>(
    future: getDados(),
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

class CriarEvento extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<CriarEvento> {
  var func1 = false;
  var func2 = false;
  var func3 = false;
  var func4 = false;
  var func5 = false;
  var func6 = false;
  var id;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: <Widget>[
        ListTile(
            leading: Text(
              "Digite um ID: ",
              style: TextStyle(fontSize: 20.0),
            ),
            title: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (var value) {
                setState(() {
                  id = value;
                  print(id);
                });
              },
            )),
        ListTile(
          leading:
              Text("Selecione o local: ", style: TextStyle(fontSize: 20.0)),
          title: DropdownButton(
              value: localSelecionado,
              isExpanded: false,
              items: locais.map((item) {
                return DropdownMenuItem(
                  child: Text(item.nome),
                  value: item.id,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  localSelecionado = value;
                  print(localSelecionado);
                });
              }),
        ),
        Text(
          "\n   Selecione os participantes: ",
          style: TextStyle(fontSize: 20.0),
        ),
        CheckboxListTile(
            secondary: CircleAvatar(
                backgroundImage: NetworkImage(funcionarios[0].foto)),
            title: Text(funcionarios[0].nome),
            value: func1,
            activeColor: Colors.green,
            onChanged: (bool valor) {
              setState(() {
                func1 = !func1;
              });
            }),
        CheckboxListTile(
            secondary: CircleAvatar(
                backgroundImage: NetworkImage(funcionarios[1].foto)),
            title: Text(funcionarios[1].nome),
            value: func2,
            activeColor: Colors.green,
            onChanged: (bool valor) {
              setState(() {
                func2 = !func2;
              });
            }),
        CheckboxListTile(
            secondary: CircleAvatar(
                backgroundImage: NetworkImage(funcionarios[2].foto)),
            title: Text(funcionarios[2].nome),
            value: func3,
            activeColor: Colors.green,
            onChanged: (bool valor) {
              setState(() {
                func3 = !func3;
              });
            }),
        CheckboxListTile(
            secondary: CircleAvatar(
                backgroundImage: NetworkImage(funcionarios[3].foto)),
            title: Text(funcionarios[3].nome),
            value: func4,
            activeColor: Colors.green,
            onChanged: (bool valor) {
              setState(() {
                func4 = !func4;
              });
            }),
        CheckboxListTile(
            secondary: CircleAvatar(
                backgroundImage: NetworkImage(funcionarios[4].foto)),
            title: Text(funcionarios[4].nome),
            value: func5,
            activeColor: Colors.green,
            onChanged: (bool valor) {
              setState(() {
                func5 = !func5;
              });
            }),
        CheckboxListTile(
            secondary: CircleAvatar(
                backgroundImage: NetworkImage(funcionarios[5].foto)),
            title: Text(funcionarios[5].nome),
            value: func6,
            activeColor: Colors.green,
            onChanged: (bool valor) {
              setState(() {
                func6 = !func6;
              });
            }),
        Text("\n   Selecione o tipo: ", style: TextStyle(fontSize: 20.0)),
        DropdownButton(
            value: tipoSelecionado,
            isExpanded: true,
            items: tipos.map((item) {
              return DropdownMenuItem(
                child: Text(item.nome),
                value: item.id,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                tipoSelecionado = value;
                print(tipoSelecionado);
              });
            }),
      ],
    )));
  }
}

buildContainerListar() {
  return new Container();
}

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

  funcionarios = resultadoFuncionarios.funcionarios;
  locais = resultadoLocais.locais;
  tipos = resultadoTipos.tipos;
  return response;
}
