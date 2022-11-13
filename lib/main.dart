// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  static const titulo = 'Perguntas';

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual sua OM favorita?',
      'respostas': ['ESFEx', 'CIA / COMANDO', 'HGEs', 'CMC']
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String tituloQuestao =
        _perguntas[_perguntaSelecionada]['texto'].toString();
    final List<String> respostas =
        _perguntas[_perguntaSelecionada].cast()['respostas'];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(titulo),
              ),
            ),
            body: Stack(
              children: [
                Questao(tituloQuestao),
                Resposta(respostas, _responder)
              ],
            )));
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
