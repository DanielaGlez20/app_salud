import 'package:flutter/material.dart';
import 'package:nicamed/Pages-administrador/Major/home_admin.dart';

import 'package:nicamed/Pages/Login/login_screen_1.dart';
import 'package:nicamed/Pages/WelcomePage_1.dart';
import 'package:nicamed/Pages/Splash/splash_screen_1.dart';
import 'package:nicamed/Pages/token/token_screen.dart';
import 'package:nicamed/Pages/recover_id/recover_id_1.dart';
import 'package:nicamed/Pages-paciente/paciente.dart';
import 'package:nicamed/medico/homeMedico.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NICAMED',
      theme: ThemeData(
        primaryColor: const Color(0xFF7D8ABC),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginScreen(),
        '/token': (context) => const TokenScreen(),
        '/recover_id': (context) => const RecoverIdScreen(),
        '/home_admin': (context) => const HomeAdmin(),

        '/medico': (context) => const HomeMedico(),

        '/Pages-paciente': (contex) =>
            const PagesScreen(), // Pasando la base de datos, // Ruta para UserDatabaseApp
      },
    );
  }
}
