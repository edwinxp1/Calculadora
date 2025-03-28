import 'package:flutter/material.dart';

class DeveloperInfoScreen extends StatelessWidget {
  const DeveloperInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del Desarrollador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Creado por Edwin Rodriguez',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Email: erodriguez.7957@unimar.edu.ve'),
          ],
        ),
      ),
    );
  }
}