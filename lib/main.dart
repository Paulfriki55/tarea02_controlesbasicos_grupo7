import 'package:flutter/material.dart';
import 'package:tarea02_controlesbasicos_grupo7/menu/ui/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESPE - Desarrollo de Aplicaciones Móviles',
      theme: ThemeData(
        primaryColor: const Color(0xFF203359),
        scaffoldBackgroundColor: const Color(0xFF0A1626),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF203359),
          secondary: const Color(0xFF79F297),
          background: const Color(0xFF0A1626),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFC2D2F2)),
          bodyMedium: TextStyle(color: Color(0xFFC2D2F2)),
          titleLarge: TextStyle(color: Color(0xFFC2D2F2)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF60BF78),
            foregroundColor: const Color(0xFF0A1626),
          ),
        ),
      ),
      home: const MenuScreen(),
    );
  }
}
