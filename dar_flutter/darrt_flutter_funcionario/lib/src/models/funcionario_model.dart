class Funcionario {
  int id;
  String nome;
  String apelido;
  String departamento;
  String foto;

  var funcionarios = [];

  Funcionario(
    this.id,
    this.nome,
    this.apelido,
    this.departamento,
    this.foto,
  );

  void fromJson(List<dynamic> json) {
    funcionarios.clear();
    for (var funcionario in json) {
      funcionarios.add(Funcionario(
          funcionario['id'],
          funcionario['nome'],
          funcionario['apelido'],
          funcionario['departamento'],
          funcionario['foto']));
    }
  }
}
