import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == 2) {
        Future.delayed(const Duration(seconds: 1), () {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage(
                color: const Color(0xFFD7E2F1), // Azul Claro
                title: 'Bienvenidos',
                description:
                    'NICAMED es una aplicación diseñada para el sector de salud en Nicaragua.',
                imagePath: 'assets/L.png',
                alignBottom: false,
                isAnimatedTitle: true,
                titleColor:
                    Colors.black, // Color del título en la primera página
                descriptionColor: Colors
                    .black, // Color de la descripción en la primera página
              ),
              _buildPage(
                color: const Color(0xFF89C8E2), // Azul Vibrante
                title: 'Funcionalidad',
                description:
                    'Gestiona tu información médica desde cualquier lugar.',
                //imagePath: 'assets/lottie/Doctor_inicio.json',
                isLottie: true,
                alignBottom: false,
                titleColor:
                    Colors.white, // Color del título en la segunda página
                descriptionColor: Colors
                    .white, // Color de la descripción en la segunda página
              ),
              _buildPage(
                color: const Color(0xFF0460B7), // Azul Profundo
                title: 'Comienza Ahora',
                description: '¡Listo para explorar nuestra aplicación!',
                alignBottom: false,
                centerText: true,
                titleColor:
                    Colors.white, // Color del título en la tercera página
                descriptionColor: Colors
                    .white, // Color de la descripción en la tercera página
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => _buildDot(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required Color color,
    required String title,
    required String description,
    String? imagePath,
    bool isLottie = false,
    bool alignBottom = false,
    bool centerText = false,
    bool isAnimatedTitle = false,
    required Color titleColor,
    required Color descriptionColor,
  }) {
    return Stack(
      children: [
        Container(
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: centerText
                ? MainAxisAlignment.center
                : (alignBottom
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imagePath != null)
                Column(
                  children: [
                    Center(
                      child: isLottie
                          ? Lottie.asset(
                              imagePath,
                              height: 300,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              imagePath,
                              height: 300,
                              fit: BoxFit.contain,
                            ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              isAnimatedTitle
                  ? AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          title,
                          textStyle: GoogleFonts.roboto(
                            fontSize: 36, // Tamaño del texto
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          speed: const Duration(milliseconds: 150),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    )
                  : Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: 36, // Tamaño del texto
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(height: 20),
              Text(
                description,
                style: GoogleFonts.openSans(
                  fontSize: 22, // Tamaño del texto
                  fontWeight: FontWeight.w400,
                  color: descriptionColor,
                  shadows: [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              if (alignBottom && !centerText) const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 12 : 8,
      height: 12, // Tamaño de los puntos de navegación
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color.fromARGB(255, 8, 8, 8)
            : const Color(0xFF89C8E2), // Azul Intenso y Azul Vibrante
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
