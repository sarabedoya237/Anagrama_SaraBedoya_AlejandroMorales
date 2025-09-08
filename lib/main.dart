import 'package:flutter/material.dart';
import 'package:palindromo/vistas/anagrama_vista.dart'; // 👈 Cambié el import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnagramaVista(), // 👈 Cambié la vista inicial
    );
  }
}
