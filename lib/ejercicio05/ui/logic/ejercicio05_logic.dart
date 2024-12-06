List<int> calcularNumerosPrimos(int limiteInferior, int limiteSuperior) {
  List<int> numerosPrimos = [];
  for (int numero = limiteInferior + 1; numero <= limiteSuperior; numero++) {
    bool esPrimo = true;
    for (int divisor = 2; divisor < numero; divisor++) {
      if (numero % divisor == 0) {
        esPrimo = false;
        break;
      }
    }
    if (esPrimo) {
      numerosPrimos.add(numero);
    }
  }
  return numerosPrimos;
}
