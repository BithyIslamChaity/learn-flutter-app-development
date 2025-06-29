import 'package:flutter/material.dart';
import 'package:employee_crud/screens/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const HomeScreen(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
