class Ejercicio01Logic {
  static List<Map<String, dynamic>> generateAsciiTable() {
    List<Map<String, dynamic>> asciiTable = [];
    for (int i = 0; i <= 255; i++) {
      asciiTable.add({
        'decimal': i,
        'character': String.fromCharCode(i),
      });
    }
    return asciiTable;
  }

  static List<List<Map<String, dynamic>>> getPagedAsciiTable() {
    final fullTable = generateAsciiTable();
    List<List<Map<String, dynamic>>> pagedTable = [];

    for (var i = 0; i < fullTable.length; i += 23) {
      pagedTable.add(
        fullTable.skip(i).take(23).toList(),
      );
    }

    return pagedTable;
  }
}

