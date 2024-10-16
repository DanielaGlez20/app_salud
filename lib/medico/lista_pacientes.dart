// Lista de Pacientes
import 'package:flutter/material.dart';
import 'package:nicamed/medico/config.dart';

class Paciente {
   String nombre;
   String imagen;

  Paciente({required this.nombre, required this.imagen});
}

class Pacientes extends StatelessWidget {
  final Paciente paciente; // Recibe el objeto paciente

  const Pacientes({super.key, required this.paciente}); // Constructor que recibe el paciente

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset(
                  paciente.imagen, // Usa la imagen del paciente
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        paciente.nombre, // Usa el nombre del paciente
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}


// pacientes.dart
class ListaPacientesScreen extends StatelessWidget {
  const ListaPacientesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Paciente> pacientes = [
      Paciente(nombre: 'Sofia Lopez', imagen: 'assets/1.jpg'),
      Paciente(nombre: 'Juan Perez', imagen: 'assets/2.jpg'),
      Paciente(nombre: 'Maria Garcia', imagen: 'assets/3.jpg'),
      Paciente(nombre: 'Carlos Mendez', imagen: 'assets/4.jpg'),
      Paciente(nombre: 'Ana Torres', imagen: 'assets/5.jpg'),
      Paciente(nombre: 'Luis Ramirez', imagen: 'assets/6.jpg'),
      Paciente(nombre: 'Isabel Martinez', imagen: 'assets/7.jpg'),
      Paciente(nombre: 'Roberto Fernandez', imagen: 'assets/8.jpg'),
      Paciente(nombre: 'Patricia Ruiz', imagen: 'assets/9.jpg'),
      Paciente(nombre: 'Diego Salazar', imagen: 'assets/10.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pacientes', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: const Color(0xFF89C8E2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: pacientes.length, // Aquí usamos la lista de pacientes
                itemBuilder: (context, index) {
                  return Pacientes(paciente: pacientes[index]); // Pasa el objeto Paciente al widget Pacientes
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
