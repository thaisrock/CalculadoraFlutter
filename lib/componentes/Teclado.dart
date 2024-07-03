import 'package:flutter/material.dart';
import 'Botao.dart';
import 'BotaoRow.dart';

class Teclado extends StatelessWidget {
  final void Function(String) cb;
  Teclado(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          BotaoRow([
            Botao.big(text: 'AC', cb: cb),
            Botao(text: '←', cb: cb),
            Botao(text: '%', cb: cb),
            Botao.operation(text: '/', cb: cb),
          ]),
          SizedBox(height: 1),
          BotaoRow([
            Botao(text: '7', cb: cb),
            Botao(text: '8', cb: cb),
            Botao(text: '9', cb: cb),
            Botao.operation(text: 'x', cb: cb),
          ]),
          SizedBox(height: 1),
          BotaoRow([
            Botao(text: '4', cb: cb),
            Botao(text: '5', cb: cb),
            Botao(text: '6', cb: cb),
            Botao.operation(text: '-', cb: cb),
          ]),
          SizedBox(height: 1),
          BotaoRow([
            Botao(text: '1', cb: cb),
            Botao(text: '2', cb: cb),
            Botao(text: '3', cb: cb),
            Botao.operation(text: '+', cb: cb),
          ]),
          SizedBox(height: 1),
          BotaoRow([
            Botao(text: '0', cb: cb),
            Botao(text: '.', cb: cb),
            Botao.operation(text: '=', cb: cb),
          ]),
        ],
      ),
    );
  }
}
