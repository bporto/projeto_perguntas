import 'package:flutter/material.dart';

final ButtonStyle style = ElevatedButton.styleFrom(
  alignment: Alignment.center,
  minimumSize: const Size(120, 24),
  maximumSize: const Size(240, 48),
  padding: const EdgeInsets.all(16),
  textStyle: const TextStyle(fontSize: 20),
);

Widget btnDefault(String text, onPressed) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    width: double.infinity,
    child: ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}
