import 'package:calculadora1/componentes/Botao.dart';
import 'package:flutter/material.dart';

class BotaoRow extends StatelessWidget {
  final List<Botao> buttons;

  BotaoRow(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}
