import 'package:flutter/material.dart';
import 'package:nicamed/medico/pacientes_list/lista_pacientes.dart';

class DatosPersonales extends StatelessWidget {
  final Paciente paciente;

  const DatosPersonales({Key? key, required this.paciente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
        backgroundColor: const Color(0xFF89C8E2), // Usando tu paleta de colores
      ),
      body: Center(
        child: Container(
          width: 350, // Ancho fijo para simular una tarjeta de presentación
          height: 250, // Altura fija
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFD7E2F1), // Fondo neutro de la tarjeta
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Se estira todo horizontalmente
            children: [
              // Nombre del paciente en la parte superior
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF89C8E2), // Usando color secundario
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    paciente.nombre, // Mostrar el nombre del paciente
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF416F9A).withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Espacio entre nombre y contenido
              // Sección de la imagen y los detalles del paciente
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Imagen del paciente
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        paciente.imagen,
                        width: 90, // Ajustado para que sea más pequeña en la tarjeta
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Detalles del paciente
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDetailRow(Icons.phone, paciente.telefono),
                          _buildDetailRow(Icons.email, paciente.email),
                          _buildDetailRow(
                            Icons.location_on, 
                            paciente.direccion, 
                            overflow: TextOverflow.ellipsis // Manejo de overflow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para construir cada fila de detalle con icono y valor
  Widget _buildDetailRow(IconData icon, String value, {TextOverflow overflow = TextOverflow.clip}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF416F9A), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              overflow: overflow, // Control de overflow
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF416F9A), // Color secundario oscuro
              ),
            ),
          ),
        ],
      ),
    );
  }
}
