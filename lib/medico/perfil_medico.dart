import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PerfilMedicoScreen extends StatefulWidget {
  const PerfilMedicoScreen({Key? key}) : super(key: key);

  @override
  _PerfilMedicoScreenState createState() => _PerfilMedicoScreenState();
}

class _PerfilMedicoScreenState extends State<PerfilMedicoScreen> {
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = pickedImage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xFFffffff),
        // Eliminamos el leading que contiene la flecha de retroceso
        actions: const [
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 50), // Aumentamos el padding en la parte inferior
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen de perfil con ícono de edición
            Center(
              child: Stack(
                children: [
                  // Cuadro para resaltar la imagen de perfil
                  Container(
                    padding: const EdgeInsets.all(4), // Espacio interno para el borde
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF89c8e2), // Color del borde
                        width: 4, // Grosor del borde
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: _image != null
                          ? FileImage(File(_image!.path))
                          : const AssetImage('assets/dr.jpg') as ImageProvider,
                    ),
                  ),
                  // Ícono de ca para cambiar la imagen de perfil
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: _pickImage, // Abre el selector de imágenes
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF89c8e2), // Fondo del ícono de lápiz
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 40, // Tamaño del ícono
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dr. Sebastian Jimenez',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Especialista en Psicología',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),

            // Información con íconos de lápiz para editar
            buildEditableInfoContainer(
              context,
              'Acerca de mí',
              'Especialista en psicología con más de 10 años de experiencia...',
              'acercaDe',
            ),
            const SizedBox(height: 15),
            buildEditableInfoContainer(
              context,
              'Formación Académica',
              '• Licenciatura en Psicología - UNAN Managua\n• Maestría en Psicoterapia Cognitivo-Conductual...',
              'formacion',
            ),
            const SizedBox(height: 15),
            buildEditableInfoContainer(
              context,
              'Filosofía de Trabajo',
              'Acompañar a mis pacientes en su proceso de sanación...',
              'filosofia',
            ),
            const SizedBox(height: 15),
            buildEditableInfoContainer(
              context,
              'Idiomas',
              '• Español (nativo)\n• Inglés (fluido)\n• Francés (intermedio)',
              'idiomas',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableInfoContainer(BuildContext context, String title, String content, String field) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFFffffff),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF416f9a).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF416f9a)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarSeccionScreen(
                    title: title,
                    content: content,
                    field: field,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EditarSeccionScreen extends StatefulWidget {
  final String title;
  final String content;
  final String field;

  const EditarSeccionScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.field,
  }) : super(key: key);

  @override
  _EditarSeccionScreenState createState() => _EditarSeccionScreenState();
}

class _EditarSeccionScreenState extends State<EditarSeccionScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar ${widget.title}'),
        backgroundColor: const Color(0xFF89c8e2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: widget.title,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 160),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89c8e2),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Guardar Cambios',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
