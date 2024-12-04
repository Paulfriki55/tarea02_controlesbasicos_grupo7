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

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeTab(),
          _buildExercisesTab(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFF79F297),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: const Color(0xFF0A1626),
          selectedItemColor: const Color(0xFF79F297),
          unselectedItemColor: const Color(0xFFC2D2F2),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.code_outlined),
              activeIcon: Icon(Icons.code),
              label: 'Ejercicios',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeTab() {
    return Container(
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
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo_espe.png',
                  height: 120,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Información del Proyecto',
                        style: TextStyle(
                          color: Color(0xFF79F297),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow('Carrera:', 'Ingeniería en Software'),
                      _buildInfoRow('NRC:', '2553'),
                      _buildInfoRow('Asignatura:', 'Desarrollo de Aplicaciones Móviles'),
                      const Divider(color: Color(0xFF79F297), height: 32),
                      const Text(
                        'Integrantes',
                        style: TextStyle(
                          color: Color(0xFF79F297),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildMemberCard('ALMEIDA MARLYN'),
                      _buildMemberCard('PULLAGUARI AXEL'),
                      _buildMemberCard('SANCHEZ PAUL'),
                      const Divider(color: Color(0xFF79F297), height: 32),
                      _buildInfoRow('Docente:', 'ING. Doris Chicaiza'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExercisesTab() {
    return Container(
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
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ejercicios',
                style: TextStyle(
                  color: Color(0xFFC2D2F2),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildExerciseCard(
                'Ejercicio 1',
                'Tabla de caracteres ASCII',
                'Visualización de la tabla ASCII completa con paginación.',
                Icons.table_chart,
                const Ejercicio01Screen(),
              ),
              _buildExerciseCard(
                'Ejercicio 2',
                'Calculadora de Factorial',
                'Calcula el factorial de un número entero positivo.',
                Icons.calculate,
                const Ejercicio02Screen(),
              ),
              _buildExerciseCard(
                'Ejercicio 3',
                'Pendiente',
                'Ejercicio en desarrollo.',
                Icons.pending,
                const Ejercicio03Screen(),
              ),
              _buildExerciseCard(
                'Ejercicio 4',
                'Pendiente',
                'Ejercicio en desarrollo.',
                Icons.pending,
                const Ejercicio04Screen(),
              ),
              _buildExerciseCard(
                'Ejercicio 5',
                'Pendiente',
                'Ejercicio en desarrollo.',
                Icons.pending,
                const Ejercicio05Screen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Color(0xFFC2D2F2)),
          children: [
            TextSpan(
              text: label + ' ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCard(String name) {
    return Card(
      color: const Color(0xFF203359),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF79F297),
          child: Icon(
            Icons.person,
            color: Color(0xFF0A1626),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Color(0xFFC2D2F2),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String title, String subtitle, String description, IconData icon, Widget screen) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF79F297).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF79F297),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF79F297),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFFC2D2F2),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: const Color(0xFFC2D2F2).withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF79F297),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

