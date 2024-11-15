import 'package:flutter/material.dart';
import 'home.dart';
import 'DatePicker.dart';
import 'TextField.dart';
import 'progress.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/date_picker': (context) => const DatePickerScreen(),
        '/text_fields': (context) => const TextFieldComparison(),
        '/progress': (context) => const ProgressScreen(), 
      },
    );
  }
}