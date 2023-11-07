import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _textEditingController = TextEditingController();

  Future speak(String text) async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(1); // vai de 0.5 até 1.5
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('N.L.P. -> Texto para VOZ'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 256, left: 12, right: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                child: const Text("Click para Falar"),
                onPressed: () {
                  speak(_textEditingController.text);
                })
          ],
        ),
      ),
    );
  }
}
