import 'package:flutter/material.dart';

class PagesScreen extends StatelessWidget {
  const PagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Fondo blanco para el AppBar
        title: const Text(
          'Inicio',
          style: TextStyle(color: Colors.black), // Texto negro
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black), // Iconos negros
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPatientInfo(), // Información del paciente
              const SizedBox(height: 20),
              _buildUpcomingAppointments(), // Próximas citas
              const SizedBox(height: 20),
              _buildMedications(), // Medicamentos
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // Barra de navegación
    );
  }

  // Método para construir la información del paciente
  Widget _buildPatientInfo() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 30,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre: Juana Jarquin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text('Resumen de salud: Sin alergias conocidas.'),
              const SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ver más'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Método para construir la sección de próximas citas
  Widget _buildUpcomingAppointments() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF89C8E2), // Fondo azul claro
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Próximas Citas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 22, 21, 21),
            ),
          ),
          SizedBox(height: 10),
          AppointmentCard(
            doctorName: 'Dr. García',
            date: '12 Nov, 2024',
            time: '10:00 AM',
          ),
          AppointmentCard(
            doctorName: 'Dr. López',
            date: '1 Dec, 2024',
            time: '2:00 PM',
          ),
        ],
      ),
    );
  }

  // Método para construir la sección de medicamentos
  Widget _buildMedications() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF89C8E2), // Fondo azul claro
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Medicamentos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          MedicationCard(
            name: 'Metformina',
            dose: '500mg',
            time: '1:00 PM',
          ),
          MedicationCard(
            name: 'Lisinopril',
            dose: '10mg',
            time: '6:00 PM',
          ),
        ],
      ),
    );
  }

  // Método para construir la barra de navegación inferior
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      selectedItemColor: Colors.black, // Íconos seleccionados
      unselectedItemColor: Colors.black54, // Íconos no seleccionados
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Citas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Medicamentos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
      ],
    );
  }
}

// Tarjeta para las citas
class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String date;
  final String time;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10), // Espacio entre tarjetas
      child: ListTile(
        title: Text(doctorName),
        subtitle: Text('Fecha: $date\nHora: $time'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Ver Todas las Citas'),
        ),
      ),
    );
  }
}

// Tarjeta para los medicamentos
class MedicationCard extends StatelessWidget {
  final String name;
  final String dose;
  final String time;

  const MedicationCard({
    super.key,
    required this.name,
    required this.dose,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10), // Espacio entre tarjetas
      child: ListTile(
        title: Text(name),
        subtitle: Text('Dosis: $dose, Hora: $time'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Agregar Recordatorio'),
        ),
      ),
    );
  }
}
