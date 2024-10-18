import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nicamed/medico/config.dart';
import 'package:nicamed/medico/pacientes/datos_personales_screen.dart';
import 'package:nicamed/medico/pacientes/historial_clinico.dart';
import 'package:nicamed/medico/pacientes/historial_de_vacunacion.dart';
import 'package:nicamed/widgets/input_decoration.dart';

// Clase Paciente
class Paciente {
  String nombre;
  String imagen;
  String fechaNacimiento; // Añadido
  String direccion; // Añadido
  String telefono;
  String genero;
  String email;
  String edad; // Añadido

  Paciente({
    required this.nombre,
    required this.imagen,
    required this.fechaNacimiento,
    required this.direccion,
    required this.telefono,
    required this.genero,
    required this.email,
    required this.edad,
  });

  get apellido => null;

}

// Clase principal de la lista de pacientes
class ListaPacientesScreen extends StatefulWidget {
  const ListaPacientesScreen({super.key});

  @override
  _ListaPacientesScreenState createState() => _ListaPacientesScreenState();
}

class _ListaPacientesScreenState extends State<ListaPacientesScreen> {
  List<Paciente> pacientes = [
    Paciente(
      nombre: 'Sofia Lopez',
      imagen: 'assets/1.jpg',
      fechaNacimiento: '1990-01-01',
      direccion: 'Avenida Central, Managua',
      telefono: '8888-9999',
      genero: 'Femenino',
      email: 'slo@gmil.com', 
      edad: '34',
    ),
    Paciente(
      nombre: 'Juan Perez',
      imagen: 'assets/2.jpg',
      fechaNacimiento: '1970-02-02',
      direccion: 'Barrio Monseñor Lezcano, Managua',
      telefono: '7777-8888',
      genero: 'Masculino',
      email: 'jpl@gmil.com', 
      edad: '54',
    ),
    Paciente(
      nombre: 'Maria Garcia',
      imagen: 'assets/3.jpg',
      fechaNacimiento: '1996-03-03',
      direccion: 'Colonia Centroamérica, Managua',
      telefono: '5790-1233',
      genero: 'Femenino',
      email: 'garcmo@gmil.com', edad: '28',
    ),
    Paciente(
      nombre: 'Carlos Mendez',
      imagen: 'assets/4.jpg',
      fechaNacimiento: '1965-04-04',
      direccion: 'Altamira, Managua',
      telefono: '8752-2345',
      genero: 'Masculino',
      email: 'menc@gmil.com', edad: '59',
    ),
    Paciente(
      nombre: 'Ana Torres',
      imagen: 'assets/5.jpg',
      fechaNacimiento: '1994-05-05',
      direccion: 'Carretera Sur, Managua',
      telefono: '8799-5555',
      genero: 'Femenino',
      email: 'ato@gmil.com', edad: '30',
    ),
    Paciente(
      nombre: 'Luis Ramirez',
      imagen: 'assets/6.jpg',
      fechaNacimiento: '2000-06-06',
      direccion: 'Villa Fontana, Managua',
      telefono: '8954-0029',
      genero: 'Masculino',
      email: 'luisslo@gmil.com', edad: '24',
    ),
    Paciente(
      nombre: 'Isabel Martinez',
      imagen: 'assets/7.jpg',
      fechaNacimiento: '1988-07-07',
      direccion: 'Residencial Las Colinas, Managua',
      telefono: '2222-3333',
      genero: 'Femenino',
      email: 'ezisas@gmil.com', 
      edad: '36',
    ),
    Paciente(
      nombre: 'Roberto Fernandez',
      imagen: 'assets/8.jpg',
      fechaNacimiento: '1960-08-08',
      direccion: 'Ciudad Jardín, Managua',
      telefono: '2290-1231',
      genero: 'Masculino',
      email: 'ferrob@gmil.com', edad: '64',
    ),
    Paciente(
      nombre: 'Patricia Ruiz',
      imagen: 'assets/9.jpg',
      fechaNacimiento: '1994-09-09',
      direccion: 'Reparto San Juan, Managua',
      telefono: '2202-1234',
      genero: 'Femenino',
      email: 'patriruiz@gmil.com', edad: '30',
    ),
    Paciente(
      nombre: 'Diego Salazar',
      imagen: 'assets/10.jpg',
      fechaNacimiento: '1969-10-10',
      direccion: 'Colonia Nicarao, Managua',
      telefono: '8820-1231',
      genero: 'Masculino',
      email: 'salzarslo@gmil.com', edad: '55',
    ),
  ];

  List<Paciente> pacientesFiltrados = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pacientesFiltrados = pacientes; // Inicializa los pacientes filtrados
  }

  void _filtrarPacientes(String query) {
    List<Paciente> resultados = [];
    if (query.isEmpty) {
      resultados = pacientes;
    } else {
      resultados = pacientes.where((paciente) {
        return paciente.nombre.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {
      pacientesFiltrados = resultados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Pacientes',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF89C8E2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecorations.inputDecoration(
                labelText: 'Buscar paciente',
                hintText: '',
                icono: const Icon(Icons.search, color: Color(0xFF416f9a)),
              ),
              onChanged: _filtrarPacientes,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _buildCarouselSlider(), // Aquí agregamos el carrusel
            ),
          ],
        ),
      ),
    );
  }

  // Construimos el carrusel de tarjetas
  Widget _buildCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: pacientesFiltrados.length,
      itemBuilder: (context, index, realIndex) {
        final cardKey = GlobalKey<FlipCardState>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Pacientes(
            paciente: pacientesFiltrados[index],
            cardKey: cardKey,
          ),
        );
      },
      options: CarouselOptions(
        height: 380, // Ajusta el tamaño de las tarjetas
        enlargeCenterPage: true, // Aumenta el tamaño de la tarjeta central
        autoPlay: false, // Desactiva la reproducción automática
        viewportFraction:
            0.8, // Controla el ancho visible de las tarjetas adyacentes
        enableInfiniteScroll: true,
      ),
    );
  }
}

// Clase para las tarjetas de pacientes
class Pacientes extends StatelessWidget {
  final Paciente paciente;
  final GlobalKey<FlipCardState> cardKey; // Clave para el control del flip

  const Pacientes({super.key, required this.paciente, required this.cardKey});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GestureDetector(
      child: Card(
        elevation: 5,
        color: const Color(0xFFD7E2F1),
        child: SizedBox(
          height: 200, // Ajusta el tamaño de la tarjeta
          child: FlipCard(
            key: cardKey, // Añade el key de la tarjeta
            flipOnTouch: true,
            front: _buildFrontCard(), // Tarjeta frontal
            back: _buildBackCard(context), // Tarjeta trasera con opciones
          ),
        ),
      ),
      onTap: () {
        print(
            "Seleccionando paciente: ${paciente.nombre}"); // Verifica que se selecciona el paciente correcto
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DatosPersonales(
                paciente: paciente), // Cambia aquí a la clase correcta
          ),
        );
      },
    );
  }

  // Construcción de la tarjeta frontal con el nombre y la imagen
  Widget _buildFrontCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 280,
          width: 280,
          child: Image.asset(
            paciente.imagen,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            paciente.nombre,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

// Construcción de la tarjeta trasera con las opciones
Widget _buildBackCard(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Opciones para ${paciente.nombre}',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF416F9A), // Color de texto ajustado a la paleta
        ),
      ),
      const SizedBox(height: 8),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD7E2F1), // Color de fondo del botón
          foregroundColor: const Color(0xFF416F9A), // Color del texto del botón
          side: BorderSide(color: const Color(0xFF416F9A)), // Color del borde del botón
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DatosPersonales(paciente: paciente), // Cambia aquí
            ),
          );
        },
        child: const Text('Ver Datos Personales'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD7E2F1), // Color de fondo del botón
          foregroundColor: const Color(0xFF416F9A), // Color del texto del botón
          side: BorderSide(color: const Color(0xFF416F9A)), // Color del borde del botón
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistorialClinico(
                  paciente: paciente), // Asegúrate de que esta clase acepte el paciente
            ),
          );
        },
        child: const Text('Ver Historial Clínico'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD7E2F1), // Color de fondo del botón
          foregroundColor: const Color(0xFF416F9A), // Color del texto del botón
          side: BorderSide(color: const Color(0xFF416F9A)), // Color del borde del botón
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => historial_vacunacion(
                paciente: paciente,
                vacunasRecibidas: [], // Debes proporcionar los datos reales
              ),
            ),
          );
        },
        child: const Text('Ver Historial de Vacunación'),
      ),
    ],
  );
}
}
