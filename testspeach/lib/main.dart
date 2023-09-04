import 'package:flutter/material.dart';
import 'tela_inicial/telaInicial.dart';

void main() {
  runApp(const SpecchToText());
}

class SpecchToText extends StatelessWidget {
  const SpecchToText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOTVS Voice',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: TelaInicial(),
    );
  }
}
