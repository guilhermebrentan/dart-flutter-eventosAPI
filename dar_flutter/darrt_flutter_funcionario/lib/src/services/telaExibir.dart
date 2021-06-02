import 'package:darrt_flutter_funcionario/src/models/eventos_model.dart';
import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

var eventos = [];
var funcionarios = [];
var locais = [];
var tipos = [];

//método para receber os dados vindos da abertura da aplicação
receberDadosExibir(var _funcionarios, var _locais, var _tipos) {
  funcionarios = _funcionarios;
  locais = _locais;
  tipos = _tipos;
}

class TelaExbir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<String>(
      //aqui eu uso um FutureBuilder para poder sempre manter atualizado os eventos criados
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
                //se houver reuniões agendadas, irei exibi-las usando o builder do ListView
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
                      //agora no onTap de cada um dos ListTile
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaDetalhes(
                                  //ao ser invocado, encaminho o usuario para uma tela secundária
                                  //a PaginaDetalhes é uma classe local encontrada mais adiante
                                  eventos[index],
                                  participantesFormat)));
                    },
                  );
                },
              );
            }
        }
      },
    );
  }

//para eu poder pegar os eventos
  Future<String> getEventos() async {
    final Eventos resultadoEventos = await Conexao.getEventos();
    eventos = resultadoEventos.eventos;

    return 'ok';
  }
}

//classe local que irá controlar a tela auxiliar para cada ListTile
class PaginaDetalhes extends StatelessWidget {
  final Eventos evento;
  final String participantes;

  PaginaDetalhes(this.evento, this.participantes);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //coloco o local da reunião no AppBar
          title: Text(locais[evento.local - 1].nome),
        ),
        //e depois chamo o método que irá exibir os detalhes sobre aquela reunião
        body: detalhes());
  }

  detalhes() {
    return ListView(
      //retornarei uma lista de Widgets com as informações que eu desejo
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

///////////////////////MÉTODO DE USO EXTERNO///////////////////////
bool existeEvento(var _id) {
  bool retorno = false;

  for (var evento in eventos) {
    if (evento.id == _id) retorno = true;
  }

  return retorno;
}
