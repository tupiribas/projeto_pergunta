import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  late final List<Map<String, Object>> perguntas;
  late final int perguntasSelecioanda;
  late final void Function(int) onResponder;

  // ignore: prefer_const_constructors_in_immutables
  Questionario({
    super.key,
    required this.perguntas,
    required this.perguntasSelecioanda,
    required this.onResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntasSelecioanda < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final String tituloQuestao = temPerguntaSelecionada
        ? perguntas[perguntasSelecioanda]['texto'] as String
        : '';

    final List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntasSelecioanda].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Stack(
      children: [Questao(tituloQuestao), Resposta(respostas, onResponder)],
    );
  }
}
