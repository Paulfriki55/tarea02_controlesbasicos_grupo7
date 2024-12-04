class Ejercicio02Logic {
  static BigInt calculateFactorial(int n) {
    if (n < 0) return BigInt.zero;
    if (n <= 1) return BigInt.one;

    BigInt result = BigInt.one;
    for (int i = 2; i <= n; i++) {
      result *= BigInt.from(i);
    }
    return result;
  }

  static bool isValidInput(String value) {
    if (value.isEmpty) return false;
    final number = int.tryParse(value);
    return number != null && number >= 0;
  }
}

