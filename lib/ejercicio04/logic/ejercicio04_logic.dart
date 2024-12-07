class Ejercicio04Logic {
  // Método para factorizar un número y mostrar los factores junto a sus potencias
  static String factorizarNumero(int n) {
    if (n <= 0) {
      throw ArgumentError('El número debe ser mayor que cero.');
    }

    // Variable para almacenar la factorización
    String resultado = 'Factorización de $n:';

    // Factorizar el número
    int factor = 2;
    int potencia = 0;
    while (n > 1) {
      // Si el número es divisible por el factor
      while (n % factor == 0) {
        potencia++;
        n ~/= factor; // Divide el número por el factor
      }

      // Si se encontró al menos un factor, mostrarlo
      if (potencia > 0) {
        resultado += ' $factor^$potencia';
        potencia = 0; // Restablecer potencia para el siguiente factor
      }

      // Incrementar el factor para la siguiente iteración
      factor++;
      // Optimización: si el factor es mayor que la raíz cuadrada del número restante,
      // no es necesario buscar más factores
      if (factor * factor > n) {
        if (n > 1) {
          resultado += ' $n^1'; // Si queda un factor primo mayor que la raíz cuadrada
        }
        break;
      }
    }

    return resultado;
  }
}
