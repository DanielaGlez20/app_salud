import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PanelPages extends StatefulWidget {
  const PanelPages({super.key});

  @override
  _PanelPagesState createState() => _PanelPagesState();
}

class _PanelPagesState extends State<PanelPages> {
  DateTime today = DateTime.now();
  final TextEditingController _searchController = TextEditingController();
  List<Usuario> _users = [];
  List<Usuario> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterUsers);
  }

  void _filterUsers() {
    setState(() {
      _filteredUsers = _users
          .where((user) => user.nombre.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _onAddUser() {
    // Aquí puedes implementar la lógica para agregar un nuevo usuario
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gestión de Usuarios',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: "Buscar usuario",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: const BorderSide(color: Color(0xFF416F9A)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: _onAddUser,
                        icon: const Icon(Icons.add, color: Color(0xFF416F9A)),
                        label: const Text(
                          "Añadir",
                          style: TextStyle(color: Color(0xFF416F9A)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Color(0xFF416F9A), width: 2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(color: const Color(0xFF416F9A)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredUsers[index].nombre),
                          visualDensity: const VisualDensity(vertical: -4),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 0.0),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    // Código para ir a otra pantalla, si es necesario
                  },
                  icon: const Icon(Icons.list),
                  label: const Text("Usuarios"),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_alert),
                  label: const Text("Alertas"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TableCalendar(
              focusedDay: today,
              firstDay: DateTime.now().subtract(const Duration(days: 30)),
              lastDay: DateTime.now().add(const Duration(days: 30)),
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF416F9A),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                defaultDecoration: BoxDecoration(shape: BoxShape.circle),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              onDaySelected: _onDaySelected,
            ),
          ],
        ),
      ),
    );
  }
}

class Usuario {
  get nombre => null;
}