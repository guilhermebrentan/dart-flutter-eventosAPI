import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.funcionario);

  final Funcionario funcionario;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final Conexao api = Conexao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Nome:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.funcionario.nome,
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Apelido:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.funcionario.apelido,
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Departamento:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.funcionario.departamento,
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
