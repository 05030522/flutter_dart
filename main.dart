import 'package:flutter/material.dart';
import 'package:my_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontFamily: 'parisienne',
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'sunflower',
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'sunflower',
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'sunflower',
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
