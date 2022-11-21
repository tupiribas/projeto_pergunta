// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  static const _tituloBarraNav = 'Perguntas';
  static const _tituloResposta = 'Parabés!';

  late final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual sua OM favorita?',
      'respostas': [
        {'texto': 'ESFEx', 'pontuacao': 10},
        {'texto': 'CIA / COMANDO', 'pontuacao': 5},
        {'texto': 'HGEs', 'pontuacao': 3},
        {'texto': 'CMC', 'pontuacao': 10},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
                child: Text(_tituloBarraNav),
              ),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntasSelecioanda: _perguntaSelecionada,
                    onResponder: _responder,
                  )
                : Resultado(_tituloResposta, _reiniciarQuestionario,
                    pontuacao: _pontuacaoTotal)));
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
