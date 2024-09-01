import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TokenScreen extends StatefulWidget {
  const TokenScreen({super.key});

  @override
  _TokenScreenState createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [fondo1(), animacionid(), token(context)],
        ),
      ),
    );
  }

  SingleChildScrollView token(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 280),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(193, 255, 255, 255),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 5, 61, 107),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Form(
                  key: _formKey, // Clave del formulario
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          hintText: '', // Texto de ayuda
                          labelText: 'Ingresa Token',
                          icon: Icon(Icons.message),
                        ),
                        validator: (value) {
                          String pattern = r'^\d{6}$'; // Expresión regular para validar exactamente 6 dígitos
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          // Validar que el valor cumpla con el patrón definido
                          if (!regExp.hasMatch(value)) {
                            return 'Ingrese un número de exactamente 6 dígitos.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        disabledColor: Colors.grey,
                        color: const Color.fromARGB(192, 156, 150, 243),
                        textColor: const Color.fromARGB(255, 210, 228, 247),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 1, vertical: 5),
                            child: const Text(' Iniciar Sesión ')),
                        onPressed: () {
                          // Validar el formulario antes de proceder
                          if (_formKey.currentState!.validate()) {
                            // Si es válido, navega a la pantalla 'admin'
                            Navigator.pushReplacementNamed(context, 'admin');
                          } else {
                            // Si no es válido, muestra los errores
                            print("Formulario no válido.");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SafeArea animacionid() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Lottie.asset(
          'assets/sms.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Container fondo1() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 60, 57, 223),
          Color.fromARGB(255, 186, 176, 243),
          Color.fromARGB(255, 164, 178, 241),
          Color.fromARGB(255, 60, 57, 223),
        ]),
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
