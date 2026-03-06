import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() reiniciar;

  const Resultado(this.pontuacaoTotal, this.reiniciar, {super.key});

  String get resultadoss {
    if (pontuacaoTotal < 8) {
      return "Parabéns";
    } else if (pontuacaoTotal < 12) {
      return "Você é Bom";
    } else if (pontuacaoTotal < 16) {
      return "Impressionante";
    } else {
      return "complicado";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(resultadoss, style: TextStyle(fontSize: 28))),
        TextButton(
          onPressed: reiniciar,
          child: Text(
            "Reiniciar?",
            style: TextStyle(
              fontSize: 18,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
