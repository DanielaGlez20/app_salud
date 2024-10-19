import 'package:flutter/material.dart';

class ConfiguracionPages extends StatelessWidget {
  const ConfiguracionPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo con degradado
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono atractivo
              Icon(
                Icons.settings,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              // Texto con estilo
              const Text(
                "Configuración",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Descripción adicional
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Aquí puedes ajustar todas las configuraciones de la aplicación.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Lista de opciones de configuración
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    _buildSettingOption("Perfil", Icons.person),
                    _buildSettingOption("Notificaciones", Icons.notifications),
                    _buildSettingOption("Privacidad", Icons.lock),
                    _buildSettingOption("Ayuda", Icons.help),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir cada opción de configuración
  Widget _buildSettingOption(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Aquí puedes definir la acción al hacer clic
        },
      ),
    );
  }
}
