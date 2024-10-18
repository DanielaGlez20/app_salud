import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          // Envuelto en SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información del paciente
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nombre: Juana Jarquin',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                ],
              ),
              const SizedBox(height: 20),
              // Próximas citas con fondo azul claro
              Container(
                color: const Color(0xFF89C8E2), // Fondo #89C8E2
                padding: const EdgeInsets.all(10.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próximas Citas',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 22, 21, 21)),
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
              ),
              const SizedBox(height: 20),
              Container(
                color: const Color(0xFF89C8E2), // Fondo #89C8E2
                padding: const EdgeInsets.all(10.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Medicamentos
                    Text(
                      'Medicamentos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        selectedItemColor: Colors.black, // Íconos
        unselectedItemColor: Colors.black54,
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
      ),
    );
  }
}

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
      child: ListTile(
        // ignore: unnecessary_string_interpolations
        title: Text('$doctorName'),
        subtitle: Text('Fecha: $date\nHora: $time'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Ver Todas las Citas'),
        ),
      ),
    );
  }
}

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
      child: ListTile(
        // ignore: unnecessary_string_interpolations
        title: Text('$name'),
        subtitle: Text('Dosis: $dose, Hora: $time'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Agregar Recordatorio'),
        ),
      ),
    );
  }
}
