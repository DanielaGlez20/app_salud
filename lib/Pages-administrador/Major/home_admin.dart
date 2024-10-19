import 'package:flutter/material.dart';
import 'package:nicamed/Pages-administrador/configuracion/configuracion.dart';
import 'package:nicamed/Pages-administrador/notificacion/notificaciones.dart';

class HomeAdmin extends StatefulWidget {


  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Inicializa la lista de páginas con el DatabaseHelper pasado desde HomeAdmin
    _pages = [
      // Pasa la instancia de DatabaseHelper
      const NotificacionesPages(),
      const ConfiguracionPages(),
    ];
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF636AE8),
        unselectedItemColor: const Color(0xFF416F9A),
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Panel",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificaciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuración",
          ),
        ],
      ),
    );
  }
}