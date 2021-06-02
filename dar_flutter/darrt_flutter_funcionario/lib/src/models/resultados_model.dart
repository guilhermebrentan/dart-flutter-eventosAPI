class Resultados {
  String resultado;

  Resultados(this.resultado);

  void fromJson(var json) {
    resultado = json.toString();
  }
}
