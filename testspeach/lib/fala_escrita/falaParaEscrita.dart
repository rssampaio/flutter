// ignore: file_names
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListing = false;
  String _ulttexto = 'Pressione o botão e fale';
  double _confianca = 1.0;

  Map<String, HighlightedWord> highlights = {
    "Todos": HighlightedWord(
      onTap: () {
        print("Todos");
      },
      textStyle: const TextStyle(
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confiança: ${(_confianca * 100.0).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListing,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListing ? Icons.mic : Icons.mic_off),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        //child: Text(_ulttexto),
        child: TextHighlight(
          text: _ulttexto,
          words: highlights,
          textStyle: const TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListing) {
      bool avaiable = await _speech.initialize(
        onStatus: (val) => print('onStatus : $val'),
        onError: (val) => print('onError : $val'),
      );

      if (avaiable) {
        setState(() => _isListing = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _ulttexto = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confianca = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() {
        _isListing = false;
      });
      _speech.stop();
    }
  }
}
