import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          fondotoken(),
          verificartoken(context),
        ],
      ),
    );
  }

  Widget fondotoken() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFd7e2f1),
      ),
    );
  }

  Widget verificartoken(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFFD7E2F1), // Neutro
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color(0xFF416f9a).withOpacity(0.9), // Principal
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: const Color(
                            0xFF89c8e2), // Cambia esto al color deseado para el cursor
                        decoration: InputDecoration(
                          labelText: 'Ingresa el Token',
                          labelStyle: const TextStyle(
                            color: Color(0xFF416f9a), // Color de la etiqueta
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF416f9a), // Color del ícono
                          ),
                          filled: true,
                          fillColor: const Color(
                              0xFFFFFFFF), // Fondo claro para el campo de texto
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFF89c8e2), // Cambia esto al color deseado
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFF89c8e2), // Cambia esto al color deseado
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFF89c8e2), // Cambia esto al color deseado
                              width: 3.0, // Grosor del borde al tener foco
                            ),
                          ),
                        ),
                        validator: (value) {
                          String pattern = r'^\d{6}$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          if (!regExp.hasMatch(value)) {
                            return 'Ingrese un número de exactamente 6 dígitos.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF89c8e2), // Principal
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text('Iniciar Sesion',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, '/Pages-paciente');
                          } else {
                            print("Formulario no válido.");
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
