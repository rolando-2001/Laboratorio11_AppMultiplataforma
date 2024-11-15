import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextFieldComparison extends StatelessWidget {
  const TextFieldComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparación de Campos de Texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Campos de Texto Material',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const MaterialTextFieldExample(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Campos de Texto Cupertino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const CupertinoTextFieldExample(),
        ],
      ),
    );
  }
}

class MaterialTextFieldExample extends StatelessWidget {
  const MaterialTextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Material Text Field',
        ),
      ),
    );
  }
}

class CupertinoTextFieldExample extends StatelessWidget {
  const CupertinoTextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoTextField(
        placeholder: 'Cupertino Text Field',
        padding: const EdgeInsets.all(12.0),
      ),
    );
  }
}