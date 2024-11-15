import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/progress');
              },
              child: const Text('Comparación de Indicadores de Progreso'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/date_picker');
              },
              child: const Text('Comparación de Selectores de Fecha'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/text_fields');
              },
              child: const Text('Comparación de Campos de Texto'),
            ),
          ],
        ),
      ),
    );
  }
}