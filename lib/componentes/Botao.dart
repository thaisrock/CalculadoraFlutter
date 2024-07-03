// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  static const DARK = Color.fromRGBO(195, 183, 183, 1);
  static const AMARELO = Color.fromRGBO(247, 219, 162, 1);
  static const VERDE = Color.fromRGBO(201, 233, 226, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(156, 140, 107, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  Botao({
    required this.text,
    this.big = false,
    this.color = AMARELO,
    required this.cb,
  });

  Botao.big({
    required this.text,
    this.big = true,
    this.color = AMARELO,
    required this.cb,
  });
  Botao.operation({
    required this.text,
    this.big = false,
    this.color = OPERATION,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: this.color,
        ), // define a cor fundo do botao
        onPressed: () => cb(text),
        child: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(
                255, 5, 36, 71), // cores dos numeros e dos icones, parou aqui
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
