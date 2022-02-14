import 'package:flutter/material.dart';
import 'package:projeto_perguntas/ui/widgets/questionario.dart';
import 'package:projeto_perguntas/ui/widgets/resultado.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 10},
        {"texto": "Vermelho", "pontuacao": 5},
        {"texto": "Verde", "pontuacao": 3},
        {"texto": "Branco", "pontuacao": 1},
      ]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 5},
        {"texto": "Elefante", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1},
      ]
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": [
        {"texto": "Maria", "pontuacao": 10},
        {"texto": "João", "pontuacao": 5},
        {"texto": "Leo", "pontuacao": 3},
        {"texto": "Pedro", "pontuacao": 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: _responder)
            : Resultado(
                _pontuacaoTotal,
                reiniciarQuestionario,
              ),
      ),
    );
  }
}
