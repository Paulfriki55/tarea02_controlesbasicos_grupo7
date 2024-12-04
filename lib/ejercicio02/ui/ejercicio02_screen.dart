import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio02/logic/ejercicio02_logic.dart';

class Ejercicio02Screen extends StatefulWidget {
  const Ejercicio02Screen({Key? key}) : super(key: key);

  @override
  _Ejercicio02ScreenState createState() => _Ejercicio02ScreenState();
}

class _Ejercicio02ScreenState extends State<Ejercicio02Screen> {
  final TextEditingController _controller = TextEditingController();
  String? _result;
  String? _error;

  void _calculateFactorial() {
    setState(() {
      _error = null;
      _result = null;

      if (!Ejercicio02Logic.isValidInput(_controller.text)) {
        _error = 'Por favor, ingrese un número válido';
        return;
      }

      final number = int.parse(_controller.text);
      final factorial = Ejercicio02Logic.calculateFactorial(number);
      _result = factorial.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Factorial'),
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.white.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Calculadora de Factorial',
                      style: TextStyle(
                        color: Color(0xFFC2D2F2),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style: const TextStyle(color: Color(0xFFC2D2F2)),
                      decoration: InputDecoration(
                        labelText: 'Ingrese un número',
                        labelStyle: const TextStyle(color: Color(0xFFC2D2F2)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF79F297).withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF79F297),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _calculateFactorial,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF60BF78),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Calcular Factorial'),
                    ),
                    if (_error != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        _error!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                    if (_result != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        _result!,
                        style: const TextStyle(
                          color: Color(0xFFC2D2F2),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

