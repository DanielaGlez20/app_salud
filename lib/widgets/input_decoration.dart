import 'package:flutter/material.dart';

// Clase que contiene el método "InputDecoration", lo que va en los campos de texto.
class InputDecorations {
  static InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    required Icon icono,
  }) {
    return InputDecoration(
      // Borde habilitado
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Esquina redondeada
        borderSide: const BorderSide(color: Color(0xFF89c8e2), width: 2), // Cambiar al color deseado
      ),
      // Borde enfocado
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Esquina redondeada
        borderSide: const BorderSide(color: Color(0xFF89c8e2), width: 3), // Cambiar al color deseado
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF416f9a), 
      ),
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color(0xFF416f9a), 
      ),
      prefixIcon: icono,
    );
  }
}
