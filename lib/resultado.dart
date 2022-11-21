// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resultado extends StatelessWidget {
  late final String texto;

  Resultado(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
