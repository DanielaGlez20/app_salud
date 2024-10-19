import 'package:flutter/material.dart';
import 'package:nicamed/medico/pacientes_list/lista_pacientes.dart';
import 'package:nicamed/Pages/widgets/input_decoration.dart';

// Clase para representar el historial de vacunación
class historial_vacunacion extends StatelessWidget {
  final Paciente paciente;

  const historial_vacunacion({
    Key? key,
    required this.paciente,
    required List vacunasRecibidas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Vacunación de ${paciente.nombre}'),
        backgroundColor: const Color(0xFF89C8E2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Añadir el SingleChildScrollView aquí
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Datos del Paciente',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildPacienteInfo(),
              const SizedBox(height: 20),
              const Text(
                'Vacunas Recibidas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildVacunaForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPacienteInfo() {
    return Card(
      color: const Color(0xFF89C8E2),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(paciente.imagen),  // Asegúrate de que la imagen esté en los assets
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${paciente.nombre}', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Género: ${paciente.genero}'),
                  Text('Fecha de Nacimiento: ${paciente.fechaNacimiento}'),
                  Text('Teléfono: ${paciente.telefono}'),
                  Text('Dirección: ${paciente.direccion}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVacunaForm() {
    return Column(  // Cambiado a Column para que se ajuste al tamaño de la pantalla
      children: [
        TextField(
          cursorColor: const Color(0xFF416f9a),
          decoration: InputDecorations.inputDecoration(
            labelText: 'Nombre de la Vacuna',
            hintText: '',
            icono: Icon(Icons.medical_services, color: Color(0xFF416f9a)),
          ),
        ),
        const SizedBox(height: 15), // Espaciado entre campos
        TextField(
          cursorColor: const Color(0xFF416f9a),
          decoration: InputDecorations.inputDecoration(
            labelText: 'Fecha de Vacunación',
            hintText: '',
            icono: Icon(Icons.calendar_today, color: Color(0xFF416f9a)),
          ),
        ),
        const SizedBox(height: 15), // Espaciado entre campos
        TextField(
          cursorColor: const Color(0xFF416f9a),
          decoration: InputDecorations.inputDecoration(
            labelText: 'Observaciones',
            hintText: '',
            icono: Icon(Icons.notes, color: Color(0xFF416f9a)),
          ),
        ),
        const SizedBox(height: 20), // Espaciado antes del botón
        ElevatedButton(
          onPressed: () {
            print('Vacuna registrada');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF416f9a),
            foregroundColor: Colors.white,
          ),
          child: const Text('Registrar Vacuna'),
        ),
      ],
    );
  }
}
