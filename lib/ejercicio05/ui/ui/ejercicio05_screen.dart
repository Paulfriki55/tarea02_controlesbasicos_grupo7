import 'package:flutter/material.dart';
import '../logic/ejercicio05_logic.dart';

class Ejercicio05Screen extends StatefulWidget {
  const Ejercicio05Screen({Key? key}) : super(key: key);

  @override
  _Ejercicio05ScreenState createState() => _Ejercicio05ScreenState();
}

class _Ejercicio05ScreenState extends State<Ejercicio05Screen> {
  late List<int> numerosPrimos;
  int currentPage = 0;
  final int itemsPerPage = 100;
  late List<List<int>> pagedPrimes;

  @override
  void initState() {
    super.initState();
    numerosPrimos = calcularNumerosPrimos(3, 32767);
    pagedPrimes = _generatePagedPrimes(numerosPrimos, itemsPerPage);
  }

  List<List<int>> _generatePagedPrimes(List<int> primes, int itemsPerPage) {
    List<List<int>> pages = [];
    for (int i = 0; i < primes.length; i += itemsPerPage) {
      pages.add(primes.sublist(i, i + itemsPerPage > primes.length ? primes.length : i + itemsPerPage));
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5: Números Primos'),
        backgroundColor: const Color(0xFF203359),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF203359),
              Color(0xFF0A1626),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.white.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tabla de Números Primos',
                          style: TextStyle(
                            color: Color(0xFFC2D2F2),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Table(
                          border: TableBorder.all(
                            color: const Color(0xFF79F297).withOpacity(0.3),
                          ),
                          children: [
                            const TableRow(
                              decoration: BoxDecoration(
                                color: Color(0xFF203359),
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Índice',
                                      style: TextStyle(
                                        color: Color(0xFFC2D2F2),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Número Primo',
                                      style: TextStyle(
                                        color: Color(0xFFC2D2F2),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ...pagedPrimes[currentPage].asMap().entries.map((entry) {
                              int index = entry.key;
                              int prime = entry.value;
                              return TableRow(
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${index + 1 + (currentPage * itemsPerPage)}',
                                        style: const TextStyle(
                                          color: Color(0xFFC2D2F2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        prime.toString(),
                                        style: const TextStyle(
                                          color: Color(0xFFC2D2F2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 0
                        ? () => setState(() => currentPage--)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF60BF78),
                    ),
                    child: const Text('Anterior'),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Página ${currentPage + 1}/${pagedPrimes.length}',
                    style: const TextStyle(
                      color: Color(0xFFC2D2F2),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: currentPage < pagedPrimes.length - 1
                        ? () => setState(() => currentPage++)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF60BF78),
                    ),
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
