import 'package:flutter/material.dart';
//import '/fala_escrita/falaParaEscrita.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicial createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice TOTVS - NLP"),
      ),
      floatingActionButton: Text("Fala p/ Escrita"),
    );
  }
}
