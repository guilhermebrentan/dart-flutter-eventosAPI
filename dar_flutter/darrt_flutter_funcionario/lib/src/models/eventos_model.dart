class Eventos {
  int id;
  String participantes;
  String dia;
  String horario;
  int local;
  int tipo;

  var eventos = [];

  Eventos(this.id, this.participantes, this.dia, this.horario, this.local,
      this.tipo);

  void fromJson(List<dynamic> json) {
    eventos.clear();
    for (var funcionario in json) {
      eventos.add(Eventos(
          int.parse(funcionario['idEvento']),
          funcionario['participantes'],
          funcionario['dia'],
          funcionario['horario'],
          int.parse(funcionario['local']),
          int.parse(funcionario['idTipo'])));
    }
  }
}
