// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resultado extends StatelessWidget {
  late final String texto;
  late final int pontuacao;

  Resultado(this.texto, {super.key, required this.pontuacao});

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
    return Center(
      child: Text(
        texto + fraseResultado,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
