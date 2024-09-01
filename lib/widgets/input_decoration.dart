import 'package:flutter/material.dart';

// clase que contiene el metodo "Input Decoration", lo que va en los campos de texto.

class InputDecorations {
  static InputDecoration inputDecoration({
    required String hintext,
    required String labeltext,
    required Icon icono,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 126, 182, 228)),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 24, 7, 179), width: 2),
                ),
        hintText: hintext,
        labelText: labeltext,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 51, 26, 194)
        ),
        prefixIcon: icono
    );
  }
}
