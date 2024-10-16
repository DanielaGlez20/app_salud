import 'package:flutter/material.dart';
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
      routes: {
        'login': (_) => const LoginScreen(),
        'token': (_) => const TokenScreen(),
        'recoverid': (_) => const RecoverIdScreen(),
        'medico': (_) => const HomeMedico(),
      },
      initialRoute: 'login',
    );
  }
}
