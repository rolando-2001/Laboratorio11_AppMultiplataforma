import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparación de Indicadores de Progreso'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Indicadores de Progreso Material',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const MaterialProgressIndicatorExample(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Indicadores de Progreso Cupertino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const CupertinoProgressIndicatorExample(),
        ],
      ),
    );
  }
}

class MaterialProgressIndicatorExample extends StatelessWidget {
  const MaterialProgressIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}

class CupertinoProgressIndicatorExample extends StatelessWidget {
  const CupertinoProgressIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CupertinoActivityIndicator(),
          SizedBox(height: 20),
          CupertinoActivityIndicator(radius: 20),
        ],
      ),
    );
  }
}