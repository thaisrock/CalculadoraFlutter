import 'package:calculadora1/modelo/Memoria.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../componentes/Display.dart';
import '../componentes/Teclado.dart';

class Calculadora extends StatefulWidget {
  _CalculadoraState createState() => _CalculadoraState();
}

@override
class _CalculadoraState extends State<Calculadora> {
  final Memoria memoria = Memoria();
  _onPressed(String comando) {
    setState(() {
      memoria.applyComando(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp // evita a mudança de posiçao da tlea
    ]);
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(memoria.valor),
          Teclado(_onPressed),
        ],
      ),
    );
  }
}
