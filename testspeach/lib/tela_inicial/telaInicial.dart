import 'package:flutter/material.dart';
import '/fala_escrita/falaParaEscrita.dart';
import '/fala_escrita/escritaParaFala.dart';

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 148, left: 50),
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    child: const Text("Voz -> escrita"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpeechScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 60, left: 50),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    child: const Text("Escrita -> voz"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TextToSpeech()),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      //),
    );
  }
}
