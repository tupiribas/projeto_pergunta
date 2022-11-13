import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resposta extends StatelessWidget {
  List<String> resposta;
  final void Function() onSelecionado;

  Resposta(this.resposta, this.onSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      child: ListView.builder(
        itemCount: resposta.length,
        itemBuilder: (context, index) =>
            ElevatedButton(onPressed: () => onSelecionado(), child: Text(resposta[index])),
      ),
    );
  }
}
