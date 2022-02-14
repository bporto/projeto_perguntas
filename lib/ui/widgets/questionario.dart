import 'package:flutter/cupertino.dart';
import 'package:projeto_perguntas/ui/widgets/textPergunta.dart';

import 'btn_default.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()["respostas"]
        : [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textPergunta(perguntas[perguntaSelecionada]['texto'].toString()),

          ///Esse é uma alternativa para criar a lista de botões ao invés de
          ///criar através do ListView.Buider
          ///nesse caso, respostas é uma lista de widgets, e o "...respostas"
          ///adiciona todos os itens
          ///da lista de widgets.
          ...respostas
              .map((resp) => btnDefault(resp["texto"].toString(),
                  () => responder(int.parse(resp["pontuacao"].toString()))))
              .toList(),
        ],
      ),
    );
  }
}
