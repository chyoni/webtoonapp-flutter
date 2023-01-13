import 'package:flutter/material.dart';
import 'package:webtoonapp/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: const Color(0xFFE6726C),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Color(0xFF232B55),
            ),
          ),
          cardColor: const Color(0xFFF4EDDB),
        ),
        home: const Scaffold(
          body: HomeScreen(),
        ));
  }
}
