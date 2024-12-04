import 'package:flutter/material.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio01/ui/ejercicio01_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio02/ui/ejercicio02_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio03/ui/ejercicio03_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio04/ui/ejercicio04_screen.dart';
import 'package:tarea02_controlesbasicos_grupo7/ejercicio05/ui/ejercicio05_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.0 + (_animation.value * 0.1),
                          child: child,
                        );
                      },
                      child: Image.asset(
                        'assets/images/logo_espe.png',
                        height: 120,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoSection(),
                  const SizedBox(height: 20),
                  _buildExercisesSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            _buildInfoRow('CARRERA:', 'Ingeniería en Software'),
            _buildInfoRow('NRC:', '2553'),
            _buildInfoRow('ASIGNATURA:', 'Desarrollo de Aplicaciones Móviles'),
            const SizedBox(height: 10),
            const Text('UNIDAD No.1', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('INTEGRANTES:'),
            _buildInfoRow('', 'ALMEIDA MARLYN'),
            _buildInfoRow('', 'PULLAGUARI AXEL'),
            _buildInfoRow('', 'SANCHEZ PAUL'),
            _buildInfoRow('PROFESOR:', 'ING. Doris Chicaiza'),
            _buildInfoRow('FECHA DE ENTREGA:', '04 de diciembre del 2024'),
            _buildInfoRow('GRUPO:', '7'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 5),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildExercisesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejercicios',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildExerciseButton(context, 'Ejercicio 1', const Ejercicio01Screen()),
        _buildExerciseButton(context, 'Ejercicio 2', const Ejercicio02Screen()),
        _buildExerciseButton(context, 'Ejercicio 3', const Ejercicio03Screen()),
        _buildExerciseButton(context, 'Ejercicio 4', const Ejercicio04Screen()),
        _buildExerciseButton(context, 'Ejercicio 5', const Ejercicio05Screen()),
      ],
    );
  }

  Widget _buildExerciseButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => screen,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

