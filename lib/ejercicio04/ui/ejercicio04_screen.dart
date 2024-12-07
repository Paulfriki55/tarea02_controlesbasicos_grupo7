import 'package:flutter/material.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio04/logic/ejercicio04_logic.dart';

class Ejercicio04Screen extends StatefulWidget {
  const Ejercicio04Screen({Key? key}) : super(key: key);

  @override
  _Ejercicio04ScreenState createState() => _Ejercicio04ScreenState();
}

class _Ejercicio04ScreenState extends State<Ejercicio04Screen> {
  final TextEditingController _controller = TextEditingController();
  String resultado = '';
  String errorMessage = '';

  void _factorizarNumero() {
    final String input = _controller.text;

    try {
      final int numero = int.parse(input);
      final resultadoFactorizacion = Ejercicio04Logic.factorizarNumero(numero); // Aquí se llama correctamente al método
      setState(() {
        resultado = resultadoFactorizacion;
        errorMessage = ''; // Limpiar mensaje de error
      });
    } catch (e) {
      setState(() {
        if (e is FormatException) {
          errorMessage = 'Por favor ingrese un número válido.';
        } else if (e is ArgumentError) {
          errorMessage = e.message;
        } else {
          errorMessage = 'Ha ocurrido un error inesperado: $e';
        }
        resultado = ''; // Limpiar resultado previo
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factorización de Número'),
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
                'Ingrese un número para factorizar:',
                style: TextStyle(
                  color: Color(0xFFC2D2F2),
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Número',
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
                onPressed: _factorizarNumero,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF60BF78),
                ),
                child: const Text('Factorizar'),
              ),
              const SizedBox(height: 20),
              if (resultado.isNotEmpty)
                Text(
                  resultado,
                  style: const TextStyle(
                    color: Color(0xFFC2D2F2),
                    fontSize: 18,
                  ),
                ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
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
