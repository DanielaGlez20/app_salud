import 'package:flutter/material.dart';
import 'package:nicamed/medico/configuracion_screen.dart';
import 'package:nicamed/medico/lista_pacientes.dart';
import 'package:nicamed/medico/appointment.dart';
import 'package:nicamed/medico/config.dart';
import 'package:nicamed/medico/perfil_medico.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeMedico extends StatefulWidget {
  const HomeMedico({super.key});

  @override
  State<HomeMedico> createState() => _HomeMedicoState();
}

class _HomeMedicoState extends State<HomeMedico> {
  List<Map<String, dynamic>> access = [
    {"icon": FontAwesomeIcons.users, "acceso": "Pacientes"},
    {"icon": FontAwesomeIcons.calendarAlt, "acceso": "Citas"},
    {"icon": FontAwesomeIcons.calendarPlus, "acceso": "Programar Cita"},
    {"icon": FontAwesomeIcons.syringe, "acceso": "Historial Vacunacion"},
    {"icon": FontAwesomeIcons.stethoscope, "acceso": "Consulta"},
    {"icon": FontAwesomeIcons.infoCircle, "acceso": "General"},
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
          Icon(FontAwesomeIcons.cog,
              color: Colors.white), // Ícono de configuración
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
                            'Dra. Tania Cisnero',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/dra.jpg'),
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
                      SizedBox(
                        height: Config.heightSize * 0.07,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              List<Widget>.generate(access.length, (index) {
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
                                }
                              },
                              child: Card(
                                margin: const EdgeInsets.only(right: 20),
                                color: const Color(0xFF89C8E2),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      FaIcon(
                                        access[index]['icon'],
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        access[index]['acceso'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
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