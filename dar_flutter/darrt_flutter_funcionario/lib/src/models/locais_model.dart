class Locais {
  int id;
  String nome;
  String foto;

  var locais = [];

  Locais(this.id, this.nome, this.foto);

  void fromJson(List<dynamic> json) {
    locais.clear();

    for (var local in json) {
      locais.add(Locais(local['id'], local['nome'], local['foto']));
    }
    print(locais[0].nome);
  }
}
