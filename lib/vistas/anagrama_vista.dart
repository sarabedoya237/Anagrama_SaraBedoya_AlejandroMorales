import 'package:flutter/material.dart';

class AnagramaVista extends StatefulWidget {
  const AnagramaVista({super.key});

  @override
  State<AnagramaVista> createState() => _AnagramaVistaState();
}

class _AnagramaVistaState extends State<AnagramaVista> {
  final _txtFrase1 = TextEditingController();
  final _txtFrase2 = TextEditingController();
  String _resultado = "";

  // Función para limpiar el texto (ignorar espacios, tildes y mayúsculas/minúsculas)
  String _normalizarTexto(String texto) {
    return texto
        .toLowerCase()
        .replaceAll(RegExp(r'[\s\p{P}]', unicode: true), '') // quita espacios y signos
        .replaceAll("á", "a")
        .replaceAll("é", "e")
        .replaceAll("í", "i")
        .replaceAll("ó", "o")
        .replaceAll("ú", "u");
  }

  void _verificarAnagrama() {
    String frase1 = _normalizarTexto(_txtFrase1.text);
    String frase2 = _normalizarTexto(_txtFrase2.text);

    // Ordenar letras de cada frase
    List<String> lista1 = frase1.split('')..sort();
    List<String> lista2 = frase2.split('')..sort();

    setState(() {
      if (lista1.join() == lista2.join()) {
        _resultado = "✅ Las frases son anagramas";
      } else {
        _resultado = "❌ Las frases no son anagramas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificador de Anagramas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _txtFrase1,
              decoration: const InputDecoration(
                labelText: "Ingrese primera frase",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _txtFrase2,
              decoration: const InputDecoration(
                labelText: "Ingrese segunda frase",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verificarAnagrama,
              child: const Text("Verificar"),
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
