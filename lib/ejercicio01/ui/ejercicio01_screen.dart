import 'package:flutter/material.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio01/logic/ejercicio01_logic.dart';

class Ejercicio01Screen extends StatefulWidget {
  const Ejercicio01Screen({Key? key}) : super(key: key);

  @override
  _Ejercicio01ScreenState createState() => _Ejercicio01ScreenState();
}

class _Ejercicio01ScreenState extends State<Ejercicio01Screen> {
  int currentPage = 0;
  late final List<List<Map<String, dynamic>>> pagedTable;

  @override
  void initState() {
    super.initState();
    pagedTable = Ejercicio01Logic.getPagedAsciiTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla ASCII'),
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
                          'Tabla de Caracteres ASCII',
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
                                      'Decimal',
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
                                      'Carácter',
                                      style: TextStyle(
                                        color: Color(0xFFC2D2F2),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ...pagedTable[currentPage].map((item) {
                              return TableRow(
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item['decimal'].toString(),
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
                                        item['character'],
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
                    'Página ${currentPage + 1}/${pagedTable.length}',
                    style: const TextStyle(
                      color: Color(0xFFC2D2F2),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: currentPage < pagedTable.length - 1
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

