import 'package:flutter/material.dart';
import 'package:nicamed/medico/configuracion_screen.dart';
import 'package:nicamed/medico/crear_informe_medico%20.dart';
import 'package:nicamed/medico/pacientes/lista_pacientes.dart';
import 'package:nicamed/medico/appointment.dart';
import 'package:nicamed/medico/config.dart';
import 'package:nicamed/medico/perfil_medico.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nicamed/medico/programar_cita_screen.dart';
import 'package:nicamed/medico/chat_screen.dart'; // Importa la pantalla del chat

class HomeMedico extends StatefulWidget {
  const HomeMedico({super.key});

  @override
  State<HomeMedico> createState() => _HomeMedicoState();
}

class _HomeMedicoState extends State<HomeMedico> {
  List<Map<String, dynamic>> access = [
    {"icon": FontAwesomeIcons.envelope, "acceso": "Chat"},
    {"icon": FontAwesomeIcons.users, "acceso": "Pacientes"},
    {"icon": FontAwesomeIcons.calendarPlus, "acceso": "Programar Cita"},
    {"icon": FontAwesomeIcons.fileAlt, "acceso": "Crear Informe Médico"},
    {"icon": FontAwesomeIcons.medkit, "acceso": "Consultar Medicamentos"},
    {"icon": FontAwesomeIcons.pills, "acceso": "Enviar Recetas"},
  ];

  int _intpage = 0; // Controla el índice de la página actual

  @override
  Widget build(BuildContext context) {
    Config().init(context); // Inicialización de la configuración
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFFFFFFF),
        color: const Color(0xFF89C8E2),
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 400),
        height: 50.0,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(FontAwesomeIcons.userDoctor, color: Colors.white),
          Icon(FontAwesomeIcons.cog, color: Colors.white), // Ícono de configuración
        ],
        onTap: (index) {
          setState(() {
            _intpage = index; // Actualiza el índice de la página actual
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _intpage == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Dr. Sebastian Jimenez',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/dr.jpg'),
                            ),
                          ),
                        ],
                      ),
                      Config.spaceMedium,
                      const Text(
                        'Accesos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Config.spaceSmall,
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Dos columnas
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 13,
                          childAspectRatio: 1.2, // Ajusta el tamaño de los cuadros
                        ),
                        physics: const NeverScrollableScrollPhysics(), // Desactiva el desplazamiento del GridView
                        shrinkWrap: true, // Ajusta el tamaño del GridView al contenido
                        itemCount: access.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (access[index]['acceso'] == 'Pacientes') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ListaPacientesScreen(),
                                  ),
                                );
                              } else if (access[index]['acceso'] == 'Programar Cita') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProgramarCitaScreen(),
                                  ),
                                );
                              } else if (access[index]['acceso'] == 'Chat') {
                                // Navegación a la pantalla de chat
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ChatScreen(), // Pantalla del chat
                                  ),
                                );
                              } else if (access[index]['acceso'] == 'Crear Informe Médico') {
                                // Navegación a la pantalla de Crear Informe Médico
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CrearInformeMedicoScreen(), // Pantalla de Crear Informe Médico
                                  ),
                                );
                              }
                            },
                            child: Card(
                              color: const Color(0xFF89C8E2),
                              elevation: 5, // Sombra más pronunciada
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Bordes redondeados
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FaIcon(
                                      access[index]['icon'],
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      access[index]['acceso'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Config.spaceSmall,
                      const Text(
                        'Proxima Cita',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Config.spaceSmall,
                      const AppointmentCard(),
                    ],
                  ),
                ),
              ),
            )
          : _intpage == 1
              ? const PerfilMedicoScreen() // Pantalla del perfil del médico
              : const SettingsScreen(), // Pantalla de configuración (cuando el índice sea 2)
    );
  }
}
