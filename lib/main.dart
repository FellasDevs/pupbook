import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PupBook',
      theme: ThemeData(
          primarySwatch: const MaterialColor(
        0xFFFD9340,
        {
          50: Color(0xFFFFE9D9),
          60: Color(0xFFFED4B3),
          70: Color(0xFFFEBE8C),
          80: Color(0xFFFDA966),
          90: Color(0xFFFD9E53),
          100: Color(0xFFFD9340),
          200: Color(0xFFE4843A),
          300: Color(0xFFCA7633),
          400: Color(0xFFB1672D),
          500: Color(0xFF985826),
          600: Color(0xFF653B1A),
          700: Color(0xFF4C2C13),
          800: Color(0xFF331D0D),
          900: Color(0xFF000000),
        },
      )),
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
            "PupBook",
            style: TextStyle(color: Colors.white),
          )),
          body: const Text('PupBook')),
    );
  }
}
