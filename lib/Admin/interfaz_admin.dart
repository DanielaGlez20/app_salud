import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Panel de Administrador')),
      body: Center(
        child: Text('Bienvenido, Administrador!'),
      ),
    );
  }
}
