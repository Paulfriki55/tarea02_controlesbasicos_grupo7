import 'package:flutter/material.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio01/ui/ejercicio01_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio02/ui/ejercicio02_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio03/ui/ejercicio03_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio04/ui/ejercicio04_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio05/ui/ejercicio05_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESPE - Desarrollo de Aplicaciones Móviles'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo_espe.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text('CARRERA: Ingeniería en Software'),
              const Text('NRC: 2553'),
              const Text('NOMBRE DE LA ASIGNATURA: Desarrollo de Aplicaciones Móviles'),
              const SizedBox(height: 10),
              const Text('UNIDAD No.1', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('INTEGRANTES:'),
              const Text('ALMEIDA MARLYN'),
              const Text('PULLAGUARI AXEL'),
              const Text('SANCHEZ PAUL'),
              const Text('PROFESOR: ING. Doris Chicaiza'),
              const Text('FECHA DE ENTREGA: 04 de diciembre del 2024'),
              const Text('GRUPO 7'),
              const SizedBox(height: 20),
              const Text('Ejercicios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildExerciseButton(context, 'Ejercicio 1', const Ejercicio01Screen()),
              _buildExerciseButton(context, 'Ejercicio 2', const Ejercicio02Screen()),
              _buildExerciseButton(context, 'Ejercicio 3', const Ejercicio03Screen()),
              _buildExerciseButton(context, 'Ejercicio 4', const Ejercicio04Screen()),
              _buildExerciseButton(context, 'Ejercicio 5', const Ejercicio05Screen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}

