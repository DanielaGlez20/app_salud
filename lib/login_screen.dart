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
          children: [fondo1(), logo(), login(context)],
        ),
      ),
    );
  }

  SingleChildScrollView login(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 300),
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
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintext: '',
                          labeltext: 'ID',
                          icono: const Icon(Icons.contact_page),
                        ),
                        validator: (value) {
                          String pattern = r'^[1-9]\d{5}$'; // Expresión regular para validar exactamente 6 dígitos y sin empezar con 0
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
                          hintext: '',
                          labeltext: 'Telefono',
                          icono: const Icon(Icons.phone),
                        ),
                        validator: (value) {
                          String pattern = r'^[0-9]{8}$'; // Expresión regular para validar exactamente 8 dígitos
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
                        disabledColor: Colors.grey,
                        color: const Color.fromARGB(176, 160, 224, 240),
                        textColor: const Color.fromARGB(255, 2, 35, 68),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          child: const Text(' Enviar Token '),
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
          const SizedBox(height: 90),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'recoverid');
            },
            child: const Text(
              'Recuperar ID',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 33, 59),
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
          'assets/logo.png',
          width: 350,
          height: 350,
        ),
      ),
    );
  }

  Container fondo1() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 124, 172, 240),
          Color.fromARGB(255, 217, 232, 247),
          Color.fromARGB(255, 217, 232, 247),
          Color.fromARGB(255, 124, 172, 240),
        ]),
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
