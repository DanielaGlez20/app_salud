import 'package:flutter/material.dart';
import 'package:nicamed/widgets/input_decoration.dart';
import 'package:lottie/lottie.dart';


class RecoverIdScreen extends StatelessWidget {
  const RecoverIdScreen ({super.key});

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
      child: Column(children: [
        const SizedBox(height: 230),
        Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            // height: 350,
            decoration: BoxDecoration(
                color: const Color.fromARGB(193, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 5, 61, 107),
                      blurRadius: 15,
                      offset: Offset(0, 5) //para aumentar el sobreado
                      )
                ]),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                              hintext: '',
                              labeltext: 'Nombre Completo',
                              icono: const Icon(Icons.person)),
                          validator: (value) {
                            // Validando que el ID contenga exactamente 6 dígitos numéricos y no comience con 0
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
                        const SizedBox(height: 5),

                        TextFormField(
                          keyboardType: TextInputType.text,  // Cambiar a TextInputType.text para permitir letras y números
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                              hintext: 'XXX-XXXXXX-XXXXA',  // Formato de cédula nicaragüense
                              labeltext: 'Cédula',
                              icono: const Icon(Icons.assignment)),
                          validator: (value) {
                            // Expresión regular para aceptar cédulas con formato XXX-XXXXXX-XXXXA
                            String pattern = r'^\d{3}-\d{6}-\d{4}[A-Z]$'; // Permite exactamente el formato XXX-XXXXXX-XXXXA
                            RegExp regExp = RegExp(pattern);

                            if (value == null || value.isEmpty) {
                              return 'El campo no puede estar vacío.';
                            }

                            // Validar que el valor cumpla con el patrón definido
                            return regExp.hasMatch(value)
                                ? null
                                : 'La cédula debe tener el formato XXX-XXXXXX-XXXXA';
                          },
                        ),
                        const SizedBox(height: 10),
       
                        TextFormField(
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                              hintext: '1234-5678',  // Ejemplo de formato para el texto de ayuda
                              labeltext: 'Telefono',
                              icono: const Icon(Icons.phone)),
                          validator: (value) {
                            
                            String pattern = r'^\d{4}-\d{4}$';            // Expresión regular para validar 4 dígitos, un guion, y otros 4 dígitos                // 4 dígitos, un guion, 4 dígitos
                            RegExp regExp = RegExp(pattern);

                            if (value == null || value.isEmpty) {
                              return 'El campo no puede estar vacío.';
                            }

                            // Validar que el valor cumpla con el patrón definido
                            if (!regExp.hasMatch(value)) {
                              if (value.contains(RegExp(r'[a-zA-Z]'))) {
                                return 'No se permiten letras. sigue el formato "1234-5678".';
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
                              borderRadius: BorderRadius.circular(5)),
                          disabledColor: Colors.grey,
                          color: const Color.fromARGB(176, 160, 224, 240),
                          textColor: const Color.fromARGB(255, 2, 35, 68),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            child: const Text(' Enviar ')),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ]),
    );
  }

  SafeArea animacionsms() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top:5),
        width: double.infinity,
        child: Lottie.asset(
          'assets/candado.json',
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
        Color.fromARGB(255, 124, 172, 240),
        Color.fromARGB(255, 217, 232, 247),
        Color.fromARGB(255, 217, 232, 247),
        Color.fromARGB(255, 57, 126, 223),
      ])),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
