// archivo: ejercicio03_screen.dart
import 'package:flutter/material.dart';
// Asegúrate de importar la clase Ejercicio03Logic correctamente
import 'package:tarea02_controlesbasicos_grupo7/ejercicio03/logic/ejercicio03_logic.dart';  // CORRECCIÓN AQUÍ

class Ejercicio03Screen extends StatefulWidget {
  const Ejercicio03Screen({Key? key}) : super(key: key);

  @override
  _Ejercicio03ScreenState createState() => _Ejercicio03ScreenState();
}

class _Ejercicio03ScreenState extends State<Ejercicio03Screen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String resultado = '';

  void _calcularMCD() {
    final int num1 = int.tryParse(_controller1.text) ?? 0;
    final int num2 = int.tryParse(_controller2.text) ?? 0;

    if (num1 > 0 && num2 > 0) {
      final mcd = Ejercicio03Logic.calcularMCD(num1, num2);  // Aquí se usa Ejercicio03Logic
      setState(() {
        resultado = 'El MCD de $num1 y $num2 es: $mcd';
      });
    } else {
      setState(() {
        resultado = 'Por favor ingrese números válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular MCD'),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Ingrese dos números para calcular el MCD:',
                style: TextStyle(
                  color: Color(0xFFC2D2F2),
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller1,
                decoration: const InputDecoration(
                  labelText: 'Primer número',
                  labelStyle: TextStyle(color: Color(0xFFC2D2F2)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF79F297)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller2,
                decoration: const InputDecoration(
                  labelText: 'Segundo número',
                  labelStyle: TextStyle(color: Color(0xFFC2D2F2)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF79F297)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularMCD,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF60BF78),
                ),
                child: const Text('Calcular MCD'),
              ),
              const SizedBox(height: 20),
              Text(
                resultado,
                style: const TextStyle(
                  color: Color(0xFFC2D2F2),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
