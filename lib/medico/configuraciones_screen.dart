import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6), // Fondo similar al de la imagen
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xFF89C8E2),
        elevation: 0, // Eliminamos la sombra
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Imagen y datos del médico
            const Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/dr.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sebastian Jimenez',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Especialista en Psicología',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Lista de opciones
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(context, Icons.edit, 'Editar Perfil',
                      const EditProfileScreen()),
                  _buildListTile(context, Icons.info, 'Información', null),
                  _buildListTile(
                      context, Icons.update, 'Actualizar Aplicación', null),
                  const Divider(),
                  _buildListTile(context, Icons.logout, 'Cerrar Sesión', null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir cada opción
  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Widget? route) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10.0), // Separación entre opciones
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF89C8E2),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          if (route != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          }
        },
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: const Color(0xFF89C8E2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/dr.jpg'),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildTextField('Correo electrónico', 'sebasjimenez@gmail.com'),
            const SizedBox(height: 10),
            _buildTextField('Numero de Celular ', '5487-9001'),
            const SizedBox(height: 10),
            _buildTextField('Departamento', 'Managua'),
            const SizedBox(height: 10),
            _buildTextField('Fecha de Nacimiento', '20-Junio-1990'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Guardar cambios
                },
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89C8E2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir los campos de texto
  Widget _buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
 