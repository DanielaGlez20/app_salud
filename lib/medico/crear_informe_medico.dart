import 'package:flutter/material.dart';
import 'package:nicamed/Pages/widgets/input_decoration.dart'; // Asegúrate de importar tu clase de estilos

class CrearInformeMedicoScreen extends StatefulWidget {
  const CrearInformeMedicoScreen({Key? key}) : super(key: key);

  @override
  _CrearInformeMedicoScreenState createState() => _CrearInformeMedicoScreenState();
}

class _CrearInformeMedicoScreenState extends State<CrearInformeMedicoScreen> {
  // Controladores para los campos de texto
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController diagnosticoController = TextEditingController();
  final TextEditingController tratamientoController = TextEditingController();
  final TextEditingController observacionesController = TextEditingController();

  // Método para crear el informe médico
  void _crearInformeMedico() {
    String nombrePaciente = nombreController.text;
    String diagnostico = diagnosticoController.text;
    String tratamiento = tratamientoController.text;
    String observaciones = observacionesController.text;

    // Puedes manejar estos valores como desees, por ejemplo, guardarlos en una base de datos
    print('Informe Médico:');
    print('Paciente: $nombrePaciente');
    print('Diagnóstico: $diagnostico');
    print('Tratamiento: $tratamiento');
    print('Observaciones: $observaciones');

    // Mostrar mensaje de confirmación (o usar otra lógica)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Informe Médico creado exitosamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Informe Médico'),
        backgroundColor: const Color(0xFF89C8E2), // Color del AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre del Paciente',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: nombreController, // Controlador para el nombre
                decoration: InputDecorations.inputDecoration(
                  hintText: '',
                  labelText: 'Paciente',
                  icono: const Icon(
                    Icons.contact_page,
                    color: Color(0xFF416f9a),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Diagnóstico',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: diagnosticoController, // Controlador para el diagnóstico
                decoration: InputDecorations.inputDecoration(
                  hintText: '',
                  labelText: 'Diagnóstico',
                  icono: const Icon(
                    Icons.medical_services,
                    color: Color(0xFF416f9a),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Tratamiento',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: tratamientoController, // Controlador para el tratamiento
                decoration: InputDecorations.inputDecoration(
                  hintText: '',
                  labelText: 'Tratamiento',
                  icono: const Icon(
                    Icons.healing,
                    color: Color(0xFF416f9a),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Observaciones',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: observacionesController, // Controlador para observaciones
                maxLines: 5,
                decoration: InputDecorations.inputDecoration(
                  hintText: '',
                  labelText: 'Observaciones',
                  icono: const Icon(
                    Icons.note_alt,
                    color: Color(0xFF416f9a),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _crearInformeMedico, // Llamar al método para crear el informe
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF89C8E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    child: Text('Guardar Informe',style: TextStyle(color: Colors.black),),
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
