class Tipos {
  int id;
  String nome;

  var tipos = [];

  Tipos(this.id, this.nome);

  void fromJson(List<dynamic> json) {
    tipos.clear();

    for (var tipo in json) {
      tipos.add(Tipos(tipo['id'], tipo['nome']));
    }
    print(tipos[0].nome);
  }
}
