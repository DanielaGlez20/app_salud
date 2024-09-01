import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel del Administrador'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Gestionar Usuarios'),
            onTap: () {
              // Navegar a la pantalla de gestión de usuarios
              Navigator.pushNamed(context, '/manageUsers');
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: const Text('Gestionar Médicos'),
            onTap: () {
              // Navegar a la pantalla de gestión de médicos
              Navigator.pushNamed(context, '/manageDoctors');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Gestionar Pacientes'),
            onTap: () {
              // Navegar a la pantalla de gestión de pacientes
              Navigator.pushNamed(context, '/managePatients');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Gestionar Citas'),
            onTap: () {
              // Navegar a la pantalla de gestión de citas
              Navigator.pushNamed(context, '/manageAppointments');
            },
          ),
        ],
      ),
    );
  }
}
