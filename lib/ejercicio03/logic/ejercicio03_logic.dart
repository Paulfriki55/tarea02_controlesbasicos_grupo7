class Ejercicio03Logic {
  // Método para calcular el MCD de dos números
  static int calcularMCD(int a, int b) {
    // Validación de los valores de entrada
    if (a <= 0 || b <= 0) {
      throw ArgumentError('Ambos números deben ser mayores que cero.');
    }

    // Algoritmo de Euclides para calcular el MCD
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }

    return a;
  }
}
