import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
          Text(
            "Sua pontuação foi: $pontuacao",
            style: const TextStyle(fontSize: 18),
          ),
          Container(
            height: 16,
          ),
          TextButton.icon(
            onPressed: reiniciarQuestionario,
            icon: const Icon(Icons.refresh_outlined),
            label: const Text(
              "Reiniciar",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
