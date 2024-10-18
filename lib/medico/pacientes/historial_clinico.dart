import 'package:flutter/material.dart';
import 'package:nicamed/medico/pacientes/lista_pacientes.dart';

class HistorialClinico extends StatelessWidget {
  final Paciente
      paciente; // Asegúrate de que 'Paciente' esté correctamente definido

  const HistorialClinico({Key? key, required this.paciente})
      : super(key: key); // Constructor que recibe 'paciente'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial Clínico'),
        backgroundColor: const Color(0xFF89C8E2), // Usando tu paleta de colores
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Datos Personales'),
              _buildDetailField('Nombre', paciente.nombre),
              _buildDetailField(
                  'Edad', paciente.edad.toString()), // Convertir a string
              _buildDetailField('Género', paciente.genero),

              _buildSectionTitle('Motivo de Consulta'),
              _buildTextField('Motivo', ''),

              _buildSectionTitle('Antecedentes Médicos'),
              _buildTextField('Antecedentes Personales', ''),
              _buildTextField('Antecedentes Familiares', ''),

              _buildSectionTitle('Síntomas Actuales'),
              _buildTextField('Síntomas', ''),

              _buildSectionTitle('Examen Físico'),
              _buildTextField('Observaciones', ''),

              _buildSectionTitle('Resultados de Pruebas'),
              _buildTextField('Resultados', ''),

              _buildSectionTitle('Diagnósticos'),
              _buildTextField('Diagnóstico', ''),

              _buildSectionTitle('Plan de Tratamiento'),
              _buildTextField('Tratamiento', ''),

              _buildSectionTitle('Historial de Vacunación'),
              _buildTextField('Vacunas', ''),

              _buildSectionTitle('Notas de Evolución'),
              _buildTextField('Notas', ''),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica para guardar el historial
                },
                child: const Text('Guardar Historial',),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF416F9A), // Color de texto ajustado a la paleta
        ),
      ),
    );
  }

  // Método para mostrar los detalles de nombre, edad y género
  Widget _buildDetailField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color(0xFF416F9A)), // Color de borde
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$label: $value',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF0A8DD1), // Cambiar a un color diferente
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir campos de texto con bordes de color
  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                const BorderSide(color: Color(0xFF416F9A)), // Color del borde
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: const Color(0xFF0A8DD1)), // Color del borde enfocado
          ),
          labelStyle:
              TextStyle(color: const Color(0xFF416F9A)), // Color de la etiqueta
          hintStyle:
              TextStyle(color: Colors.grey.shade600), // Color para el hint
        ),
        style: const TextStyle(
          color: Color(0xFF0A8DD1), // Cambiar a un color diferente
        ),
        maxLines: 2, // Permite múltiples líneas
        minLines: 1, // Mínimo una línea visible
      ),
    );
  }
}
