import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/conexao/conexao.dart';

void main() => Conexao.getDados();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Alo mundo'),
          ),
        ),
      ),
    );
  }
}
