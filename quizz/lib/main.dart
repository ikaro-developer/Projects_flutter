import 'package:flutter/material.dart';
import 'package:tete/banner_component.dart';
import 'package:tete/questionario.dart';
import 'package:tete/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;
  int pontuacaoTotal = 0;
  final List<Map<String, Object>> perguntas = [
    {
      "texto": "Qual sua cor favorita?",
      "resposta": [
        {"texto": "preto", "pontuacao": 7},
        {"texto": "vermelho", "pontuacao": 4},
        {"texto": "verde", "pontuacao": 8},
        {"texto": "azul", "pontuacao": 3},
      ],
    },
    {
      "texto": "Qual seu animal favorito?",
      "resposta": [
        {"texto": "cachorro", "pontuacao": 9},
        {"texto": "gato", "pontuacao": 6},
        {"texto": "coelho", "pontuacao": 5},
        {"texto": "hamster", "pontuacao": 2},
      ],
    },
    {
      "texto": "Qual sua fruta favorita?",
      "resposta": [
        {"texto": "maçã", "pontuacao": 8},
        {"texto": "banana", "pontuacao": 7},
        {"texto": "laranja", "pontuacao": 5},
        {"texto": "uva", "pontuacao": 3},
      ],
    },
    {
      "texto": "Qual seu meio de transporte favorito?",
      "resposta": [
        {"texto": "carro", "pontuacao": 10},
        {"texto": "moto", "pontuacao": 6},
        {"texto": "bicicleta", "pontuacao": 4},
        {"texto": "ônibus", "pontuacao": 2},
      ],
    },
    {
      "texto": "Qual planeta você mais gosta?",
      "resposta": [
        {"texto": "Terra", "pontuacao": 10},
        {"texto": "Marte", "pontuacao": 7},
        {"texto": "Lua", "pontuacao": 5},
        {"texto": "Vênus", "pontuacao": 3},
      ],
    },
  ];

  void responder(int pontuacao) {
    setState(() {
      perguntaSelecionada++;

      pontuacaoTotal += pontuacao;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  void reiniciar() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1C1C1C),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF272727),
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Projeto Quizz")),
        body: temPerguntaSelecionada
            ? BannerComponent(
                Questionario(
                  perguntas: perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  responder: responder,
                ),
              )
            : BannerComponent(Resultado(pontuacaoTotal, reiniciar)),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
