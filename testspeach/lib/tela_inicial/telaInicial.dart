import 'package:flutter/material.dart';
import '/fala_escrita/falaParaEscrita.dart';

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
            padding: const EdgeInsets.only(top: 100, left: 90),
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
            padding: EdgeInsets.only(top: 40, left: 90),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    child: const Text("Escrita -> voz"),
                    onPressed: () {},
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
