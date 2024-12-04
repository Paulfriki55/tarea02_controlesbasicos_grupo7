import 'package:flutter/material.dart';

class Ejercicio03Screen extends StatelessWidget {
  const Ejercicio03Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3'),
      ),
      body: const Center(
        child: Text('Contenido del Ejercicio 3'),
      ),
    );
  }
}

