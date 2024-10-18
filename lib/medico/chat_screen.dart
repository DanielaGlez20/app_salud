import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hola, que tal? me gustaria hacerle una consulta', 'sender': 'paciente', 'time': '10:00 AM'},
    {'text': 'Buenos dias.Todo bien, gracias.', 'sender': 'doctor', 'time': '10:05 AM'},
    {'text': 'Digame!', 'sender': 'doctor', 'time': '10:05 AM'},
  ];

  final TextEditingController _controller = TextEditingController();

  // Nombre del médico desde el perfil (asumiendo que ya lo tienes en tu código)
  final String doctorName = 'Dr. Sebastian Jimenez';

  // Nombre del paciente (será el del primer mensaje del paciente)
  final String patientName = 'Isabel Martinez';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/7.jpg'),
            ),
            SizedBox(width: 10),
            Text('$patientName'),
          ],
        ),
        backgroundColor: Color(0xFF89C8E2),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10), // Espacio entre el AppBar y los mensajes
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          SizedBox(height: 10), // Espacio entre los mensajes y el campo de texto
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    bool isDoctor = message['sender'] == 'doctor';
    String senderName = isDoctor ? doctorName : patientName;
    String avatarImage = isDoctor
        ? 'assets/dr.jpg'
        : 'assets/7.jpg'; // Imagen para doctor o paciente

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Mayor espacio vertical
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isDoctor ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isDoctor) // Muestra la imagen solo para el paciente (en la izquierda)
            CircleAvatar(
              backgroundImage: AssetImage(avatarImage),
              radius: 30,
            ),
          SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(15), // Mayor padding interno en la burbuja
              decoration: BoxDecoration(
                color: isDoctor ? Color(0xFF89C8E2) : Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: isDoctor
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message['text'],
                    style: TextStyle(
                        color: isDoctor ? Colors.white : Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    message['time'],
                    style: TextStyle(
                        color: isDoctor ? Colors.white70 : Colors.black54,
                        fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          if (isDoctor) // Muestra la imagen solo para el doctor (en la derecha)
            CircleAvatar(
              backgroundImage: AssetImage(avatarImage),
              radius: 30,
            ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Aumenta el padding alrededor del campo de texto
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Escribe tu mensaje...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF89C8E2)),
            onPressed: () {
              // Lógica para enviar el mensaje
              if (_controller.text.isNotEmpty) {
                setState(() {
                  messages.add({
                    'text': _controller.text,
                    'sender': 'doctor',
                    'time': 'Ahora',
                  });
                  _controller.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
