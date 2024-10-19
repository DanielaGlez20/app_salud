import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nicamed/Pages/widgets/input_decoration.dart';

class ProgramarCitaScreen extends StatefulWidget {
  @override
  _ProgramarCitaScreenState createState() => _ProgramarCitaScreenState();
}

class _ProgramarCitaScreenState extends State<ProgramarCitaScreen> {
  DateTime? selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String patientName = '';
  String appointmentType = '';

  // Método para seleccionar la fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF89C8E2), // Color de la barra de título
            colorScheme: ColorScheme.light(primary: const Color(0xFF89C8E2)), // Color de los días seleccionados
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Estilo de botones
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Método para seleccionar la hora
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF89C8E2), // Color de la barra de título
            colorScheme: ColorScheme.light(primary: const Color(0xFF89C8E2)), // Color de los días seleccionados
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Estilo de botones
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Método para confirmar la cita
  void _confirmAppointment() {
    final String formattedDate = selectedDate != null
        ? DateFormat.yMMMd().format(selectedDate!)
        : 'Sin fecha seleccionada';
    final String formattedTime = selectedTime.format(context);

    // Muestra un diálogo de confirmación
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmación de Cita"),
          content: Text(
              "Cita programada para $patientName el $formattedDate a las $formattedTime para $appointmentType."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programar Cita'),
        backgroundColor: const Color(0xFF89C8E2), // Color ajustado
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Campo de texto para el nombre del paciente
              TextField(
                decoration: InputDecorations.inputDecoration(
                  hintText: '',
                  labelText: 'Buscar Paciente',
                  icono: Icon(Icons.person, color: const Color(0xFF416f9a)), // O cualquier ícono que desees
                ),
                cursorColor: const Color(0xFF89C8E2), // Color del cursor
                onChanged: (value) {
                  setState(() {
                    patientName = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Botón para seleccionar la fecha
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Seleccionar Fecha'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89C8E2), // Color ajustado
                  foregroundColor: const Color(0xFF416f9a), // Cambiado a blanco
                ),
              ),
              Text(
                selectedDate != null
                    ? DateFormat.yMMMd().format(selectedDate!)
                    : 'Sin fecha seleccionada',
                style: TextStyle(color: const Color(0xFF696969)), // Color del texto
              ),

              const SizedBox(height: 16.0),

              // Botón para seleccionar la hora
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: const Text('Seleccionar Hora'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89C8E2), // Color ajustado
                  foregroundColor: const Color(0xFF416f9a), // Cambiado a blanco
                ),
              ),
              Text(
                "${selectedTime.format(context)}",
                style: TextStyle(color: const Color(0xFF696969)), // Color del texto
              ),

              const SizedBox(height: 16.0),

              // Campo de texto para el tipo de cita
              TextField(
                decoration: InputDecorations.inputDecoration(
                  hintText: '',
                  labelText: 'Tipo de Cita',
                  icono: Icon(Icons.calendar_today, color: const Color(0xFF416f9a)), // O cualquier ícono que desees
                ),
                cursorColor: const Color(0xFF89C8E2), // Color del cursor
                onChanged: (value) {
                  setState(() {
                    appointmentType = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Botón para confirmar la cita
              ElevatedButton(
                onPressed: _confirmAppointment,
                child: const Text('Confirmar Cita'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89C8E2), // Color ajustado
                  foregroundColor: Colors.white, // Cambiado a blanco
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
