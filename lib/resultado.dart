// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resultado extends StatelessWidget {
  late final int pontuacao;
  late final void Function() onReiniciarFormulario;

  Resultado(this.onReiniciarFormulario,
      {super.key, required this.pontuacao});

  String get fraseResultado {
    if (pontuacao <= 9) {
      return '\nParabens.';
    } else if (pontuacao < 12) {
      return '\nVocê é bom!';
    } else if (pontuacao < 16) {
      return '\nVocê é imprecionante';
    } else {
      return '\nVocê é outro nível!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: onReiniciarFormulario,
          style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
          child: const Text('Reiniciar?'),
        ),
      ],
    );
  }
}
