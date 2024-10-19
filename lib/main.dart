import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa Google Fonts
import 'package:nicamed/Admin/interfaz_admin.dart';
import 'package:nicamed/login_screen.dart';
import 'package:nicamed/medico/homeMedico.dart';
import 'package:nicamed/recover_id_screen.dart';
import 'package:nicamed/token_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "Debug"
      title: 'App de Salud',
      
      // Agregar el tema global con Roboto y Nunito
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.roboto(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.roboto(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      
      // Definir las rutas
      routes: {
        'login': (_) => const LoginScreen(),
        'token': (_) => const TokenScreen(),
        'recoverid': (_) => const RecoverIdScreen(),
        'medico': (_) => const HomeMedico(),
        'admin': (_) => AdminScreen(), // Ruta para pantalla del admin
      },
      initialRoute: 'login', // Ruta inicial
    );
  }
}
