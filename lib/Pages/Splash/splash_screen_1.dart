import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa el paquete para fuentes de Google
import 'package:nicamed/Pages/WelcomePage_1.dart'; // Importa la página a la que se navega después de la pantalla de inicio

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador de animaciones con una duración de 3 segundos
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    // Configura la animación de escala para aumentar el tamaño del widget
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Configura la animación de deslizamiento para subir desde la parte inferior
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Navega a la página de bienvenida cuando la animación esté completa
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo con gradiente armonizado usando los colores de la aplicación
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD7E2F1), // Azul Claro
              Color(0xFF89C8E2), // Azul Vibrante
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SlideTransition(
            position: _slideAnimation, // Aplicar animación de deslizamiento
            child: ScaleTransition(
              scale: _scaleAnimation, // Aplicar animación de escala
              child: Text(
                'NICAMED', //Texto de la representacion de la app
                style: GoogleFonts.roboto(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0A8DD1), // Azul vibrante para el texto
                  shadows: [
                    Shadow(
                      blurRadius: 12.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Limpia el controlador de animaciones
    super.dispose();
  }
}
