import 'package:flutter/cupertino.dart';

Widget textPergunta(String text) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
