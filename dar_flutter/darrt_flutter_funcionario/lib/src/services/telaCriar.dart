import 'package:darrt_flutter_funcionario/src/models/resultados_model.dart';
import 'package:darrt_flutter_funcionario/src/services/telaExibir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';
import 'package:darrt_flutter_funcionario/src/conexao/email.dart';

var funcionarios = [];
var locais = [];
var tipos = [];
var resultado;
var email = Email('brentan996@gmail.com', '********');

//recebo as informações iniciais necessárias
receberDadosCriar(var _funcionarios, var _locais, var _tipos) {
  funcionarios = _funcionarios;
  locais = _locais;
  tipos = _tipos;
}

//usado para criar a tela que desejo
class TelaCriar extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<TelaCriar> {
  //aqui estão todas as variaveis necessárias para a criação de um evento
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
        //de novo, em uma lista de Widgets, montarerei a tela com os inputs que preciso
        //cada input se encontra acompanhado por Texts que mostram qual é a sua função
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
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  //verifico se o id é nulo ou se ele já é usado
                  //esste método 'existeEvento(id)' está na classe 'TelaExibir'
                  //já que lá sempre vou ter uma lista atualizada dos eventos existentes
                  if (id != null && !existeEvento(id)) {
                    String participantes = '';

                    //aqui eu monto uma string, com base nos CheckBox selecionados
                    //os funcionarios selecionados tem seu id guardado
                    if (func1 == true) participantes += '1;';

                    if (func2 == true) participantes += '2;';

                    if (func3 == true) participantes += '3;';

                    if (func4 == true) participantes += '4;';

                    if (func5 == true) participantes += '5;';

                    if (func6 == true) participantes += '6;';

                    //faço as últimas verificações necessárias
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

                              final Resultados resultados =
                                  Conexao.postEvento(comando);

                              //se der tudo certo aviso que ocorreu tudo bem, senão aviso que houve um erro externo
                              if (resultados.resultado == "deu certo") {
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
                              enviarEmail(
                                  'brentan996@gmail.com',
                                  'Você está relacionado para uma reunião no AgendaMeet:' +
                                      'Tipo:' +
                                      tipos[tipoSelecionado - 1].nome() +
                                      '\nData: ' +
                                      dataSelecionada +
                                      '\nHorario: ' +
                                      horaSelecionada +
                                      '\nLocal: ' +
                                      locais[localSelecionado - 1].nome(),
                                  'Reunião AgendaMeet');
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
                      content:
                          Text("Preencha o ID ou coloque um ID inexistente"),
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
                  //uso o setState para alterar o valor das variaveis
                  setState(() {
                    func1 = false;
                    func2 = false;
                    func3 = false;
                    func4 = false;
                    func5 = false;
                    func6 = false;
                    dataSelecionada = null;
                    id = null;
                    horaSelecionada = null;
                    localSelecionado = null;
                    tipoSelecionado = null;
                  });
                },
                child: Text("Limpar")),
          ],
        )
      ],
    )));
  }
}

void enviarEmail(var destinatario, var mensagem, var assunto) async {
  await email.sendMessage(mensagem, destinatario, assunto);
}
