import 'package:darrt_flutter_funcionario/src/models/locais_model.dart';
import 'package:darrt_flutter_funcionario/src/models/tipos_model.dart';
import 'package:darrt_flutter_funcionario/src/models/resultados_model.dart';
import 'package:darrt_flutter_funcionario/src/models/eventos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

var funcionarios = [];
var locais = [];
var tipos = [];
var eventos = [];
var resultado;
String nomeCidade = "";

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: true,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
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
                  onTap: (var value) {
                    getEventos();
                  },
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
  var dataSelecionada;
  var horaSelecionada;
  var localSelecionado;
  var tipoSelecionado;

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
                child: new Align(
                  alignment: Alignment.center,
                  child: Text(item.nome),
                ),
                value: item.id,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                tipoSelecionado = value;
                print(tipoSelecionado);
              });
            }),
        ListTile(
          leading: Text(
            "Digite a data: ",
            style: TextStyle(fontSize: 20.0),
          ),
          title: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "xx de mês"),
            textAlign: TextAlign.justify,
            onChanged: (var value) {
              setState(() {
                dataSelecionada = value;
                print(dataSelecionada);
              });
            },
          ),
        ),
        ListTile(
          leading: Text(
            "Digite o horário: ",
            style: TextStyle(fontSize: 20.0),
          ),
          title: TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: "hora:min"),
            textAlign: TextAlign.justify,
            onChanged: (var value) {
              setState(() {
                horaSelecionada = value;
                print(horaSelecionada);
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  if (id != null) {
                    String participantes = '';

                    if (func1 == true) participantes += '1;';

                    if (func2 == true) participantes += '2;';

                    if (func3 == true) participantes += '3;';

                    if (func4 == true) participantes += '4;';

                    if (func5 == true) participantes += '5;';

                    if (func6 == true) participantes += '6;';

                    if (participantes != '') {
                      if (dataSelecionada != null) {
                        if (horaSelecionada != null) {
                          if (localSelecionado != null) {
                            if (tipoSelecionado != null) {
                              String comando;

                              comando = id.toString() +
                                  '/' +
                                  participantes.toString() +
                                  '/' +
                                  dataSelecionada.toString() +
                                  '/' +
                                  horaSelecionada.toString() +
                                  '/' +
                                  localSelecionado.toString() +
                                  '/' +
                                  tipoSelecionado.toString();

                              criarEvento(comando);

                              if (resultado == "deu certo") {
                                AlertDialog alerta = AlertDialog(
                                  title: Text("Evento marcado"),
                                  content: Text("Evento marcado com sucesso"),
                                  actions: [],
                                );

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alerta;
                                  },
                                );
                              } else {
                                AlertDialog alerta = AlertDialog(
                                  title: Text("Erro desconhecido"),
                                  content: Text("Tente novamente mais tarde"),
                                  actions: [],
                                );

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alerta;
                                  },
                                );
                              }
                            } else {
                              AlertDialog alerta = AlertDialog(
                                title: Text("Problema ao criar"),
                                content:
                                    Text("Diga qual será o tipo da reunião"),
                                actions: [],
                              );

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alerta;
                                },
                              );
                            }
                          } else {
                            AlertDialog alerta = AlertDialog(
                              title: Text("Problema ao criar"),
                              content: Text("Diga onde será a reunião"),
                              actions: [],
                            );

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alerta;
                              },
                            );
                          }
                        } else {
                          AlertDialog alerta = AlertDialog(
                            title: Text("Problema ao criar"),
                            content: Text("Diga o horário da reunião"),
                            actions: [],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alerta;
                            },
                          );
                        }
                      } else {
                        AlertDialog alerta = AlertDialog(
                          title: Text("Problema ao criar"),
                          content: Text("DIga em que data ocorrerá a reunião"),
                          actions: [],
                        );

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alerta;
                          },
                        );
                      }
                    } else {
                      AlertDialog alerta = AlertDialog(
                        title: Text("Problema ao criar"),
                        content: Text("Diga quem vai participar da reunião"),
                        actions: [],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alerta;
                        },
                      );
                    }
                  } else {
                    AlertDialog alerta = AlertDialog(
                      title: Text("Problema ao criar"),
                      content: Text("Preencha o ID"),
                      actions: [],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alerta;
                      },
                    );
                  }
                },
                child: Text("Criar")),
            Text("   "),
            ElevatedButton(
                onPressed: () {
                  print('clicou');
                },
                child: Text("Limpar")),
          ],
        )
      ],
    )));
  }
}

buildContainerListar() {
  return new FutureBuilder<String>(
    future: getEventos(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        default:
          if (eventos.length == 0) {
            return Center(
              child: Text("Não há reuniões agendadas"),
            );
          } else {
            return ListView.builder(
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                String participantes = eventos[index].participantes;
                String participantesFormat = '';
                var partes = participantes.split(';');
                for (var func in partes) {
                  if (func != '')
                    participantesFormat +=
                        funcionarios[int.parse(func) - 1].nome + '; ';
                }
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    radius: 30.0,
                  ),
                  title: Text(
                    locais[eventos[index].local - 1].nome,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    tipos[eventos[index].tipo - 1].nome,
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaginaDetalhes(
                                eventos[index], participantesFormat)));
                  },
                );
              },
            );
          }
      }
    },
  );
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

Future<Resultados> criarEvento(var comando) async {
  final Resultados resultados = await Conexao.postEvento(comando);

  resultado = resultados.resultado;
  return resultados;
}

Future<String> getEventos() async {
  final Eventos resultadoEventos = await Conexao.getEventos();
  eventos = resultadoEventos.eventos;

  return 'ok';
}

class PaginaDetalhes extends StatelessWidget {
  final Eventos evento;
  final String participantes;

  PaginaDetalhes(this.evento, this.participantes);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(locais[evento.local - 1].nome),
        ),
        body: detalhes());
  }

  detalhes() {
    return ListView(
      children: <Widget>[
        Image(
          image: NetworkImage(locais[evento.local - 1].foto),
        ),
        ListTile(
          leading: Icon(Icons.place),
          title: Text(locais[evento.local - 1].nome,
              style: TextStyle(fontSize: 20.0)),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            participantes,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text(evento.dia, style: TextStyle(fontSize: 20.0)),
        ),
        ListTile(
            leading: Icon(Icons.watch),
            title: Text(evento.horario, style: TextStyle(fontSize: 20.0))),
        ListTile(
          leading: Icon(Icons.info),
          title: Text(tipos[evento.tipo - 1].nome,
              style: TextStyle(fontSize: 20.0)),
        ),
      ],
    );
  }
}
