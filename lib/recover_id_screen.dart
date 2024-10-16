import 'package:flutter/material.dart';
import 'package:nicamed/widgets/input_decoration.dart';
import 'package:lottie/lottie.dart';

class RecoverIdScreen extends StatelessWidget {
  const RecoverIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [fondo1(), animacionsms(), recover(context)],
        ),
      ),
    );
  }

  SingleChildScrollView recover(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 240),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF416F9A), // Sombra de color principal
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Form(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: 'Escribe tu nombre completo',
                          labelText: 'Nombre Completo',
                          icono: const Icon(
                            Icons.person,
                            color: Color(0xFF416f9a), // Color principal
                          ),
                        ),
                        validator: (value) {
                          String pattern = r'^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s]+$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }
                          return regExp.hasMatch(value)
                              ? null
                              : 'Este campo solo puede contener letras.';
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: 'XXX-XXXXXX-XXXXA',
                          labelText: 'Cédula',
                          icono: const Icon(
                            Icons.assignment,
                            color: Color(0xFF416f9a), // Color secundario
                          ),
                        ),
                        validator: (value) {
                          String pattern = r'^\d{3}-\d{6}-\d{4}[A-Z]$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          return regExp.hasMatch(value)
                              ? null
                              : 'La cédula debe tener el formato XXX-XXXXXX-XXXXA';
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: '1234-5678',
                          labelText: 'Teléfono',
                          icono: const Icon(
                            Icons.phone,
                            color: Color(0xFF416f9a), // Color secundario
                          ),
                        ),
                        validator: (value) {
                          String pattern = r'^\d{4}-\d{4}$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          if (!regExp.hasMatch(value)) {
                            if (value.contains(RegExp(r'[a-zA-Z]'))) {
                              return 'No se permiten letras. Sigue el formato "1234-5678".';
                            } else if (value.contains(RegExp(r'[^\d-]'))) {
                              return 'Solo se permiten números y un guion en el formato 1234-5678.';
                            } else {
                              return 'Ingrese un número en el formato 1234-5678.';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: const Color(0xFFDFE2E6),
                        color: const Color(0xFF416f9a), // Color principal
                        textColor: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: const Text('Enviar'),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SafeArea animacionsms() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Lottie.asset(
          'assets/candado.json',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Container fondo1() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFffffff),
            Color(0xFFd7e2f1),
            
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
