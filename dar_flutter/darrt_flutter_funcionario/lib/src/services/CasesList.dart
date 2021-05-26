import 'package:flutter/material.dart';
import 'package:darrt_flutter_funcionario/src/models/funcionario_model.dart';
import 'detailWidget.dart';

class CasesList extends StatelessWidget {
  final List<Funcionario> funcionarios;
  CasesList({Key key, this.funcionarios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: funcionarios == null ? 0 : funcionarios.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(funcionarios[index])),
              );
            },
            child: ListTile(
                leading: Icon(Icons.person),
                title: Text(funcionarios[index].nome),
                subtitle: Text(funcionarios[index].departamento)),
          ));
        });
  }
}
