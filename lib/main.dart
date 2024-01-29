import 'package:flutter/material.dart';

import '../pages/HomePage.dart';

void main() {
  runApp(const FocusTrail());
}

/// This is the main widget of the app
class FocusTrail extends StatelessWidget {
  const FocusTrail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 246, 246, 247),
        ),
        // useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 7, 56, 13),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          elevation: 4,
          shadowColor: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}
