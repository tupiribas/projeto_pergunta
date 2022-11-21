// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  static const titulo = 'Perguntas';

  late final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 3},
        {'texto': 'Verde', 'nota': 1},
        {'texto': 'Branco', 'nota': 10},
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual sua OM favorita?',
      'respostas': [
        {'texto': 'ESFEx',         'nota': 10},
        {'texto': 'CIA / COMANDO', 'nota': 5},
        {'texto': 'HGEs',          'nota': 3},
        {'texto': 'CMC',           'nota': 9},
      ]
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(titulo),
              ),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntasSelecioanda: _perguntaSelecionada,
                    onResponder: _responder,
                  )
                : Resultado('Parabéns!')));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
