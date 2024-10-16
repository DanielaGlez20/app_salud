import 'package:flutter/material.dart';
import 'package:nicamed/widgets/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [fondo(), logo(), login(context)],
        ),
      ),
    );
  }

  SingleChildScrollView login(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250), // Ajustado para un mejor espaciado
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(
                  0xFFD7E2F1), // Fondo de la tarjeta, azul muy claro (neutro)
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF416f9a)
                      .withOpacity(0.9), // Azul oscuro con opacidad
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Form(
                  key: _formKey, // Clave del formulario
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: 'Ingrese su ID',
                          labelText: 'ID',
                          icono: const Icon(Icons.contact_page,
                              color: Color(0xFF416f9a)), // Azul oscuro
                        ),
                        validator: (value) {
                          String pattern =
                              r'^[1-9]\d{5}$'; // Expresión regular para validar exactamente 6 dígitos y sin empezar con 0
                          RegExp regExp = RegExp(pattern);
                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }
                          return regExp.hasMatch(value)
                              ? null
                              : 'El ID debe contener exactamente 6 números.';
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: 'Ingrese su teléfono',
                          labelText: 'Teléfono',
                          icono: const Icon(Icons.phone,
                              color: Color(0xFF416f9a)), // Azul oscuro
                        ),
                        validator: (value) {
                          String pattern =
                              r'^[0-9]{8}$'; // Expresión regular para validar exactamente 8 dígitos
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          return regExp.hasMatch(value)
                              ? null
                              : 'Debe ingresar exactamente 8 números.';
                        },
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledColor: const Color(
                            0xFF89C8E2), // Azul claro para botón deshabilitado
                        color: const Color(
                            0xFF89c8e2), // Azul brillante para botón habilitado
                        textColor: const Color(0xFF416f9a),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          child: const Text('Enviar Token'),
                        ),
                        onPressed: () {
                          // Validar el formulario antes de proceder
                          if (_formKey.currentState!.validate()) {
                            // Si es válido, navega a la pantalla 'token'
                            Navigator.pushReplacementNamed(context, 'token');
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
          const SizedBox(height: 60),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'recoverid');
            },
            child: const Text(
              'Recuperar ID',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF416f9a), // Azul oscuro
              ),
            ),
          )
        ],
      ),
    );
  }

  SafeArea logo() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Image.asset(
          'assets/L.png',
          width: 230, // Ajustado para un mejor ajuste visual
          height: 230,
        ),
      ),
    );
  }

  Container fondo() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFd7e2f1),
            Color(0xFFffffff),
            Color(0xFFd7e2f1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
