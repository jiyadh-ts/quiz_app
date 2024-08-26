import 'package:flutter/material.dart';
import 'package:quiz_app/view/Screen_One/Screen_one.dart';
import 'package:quiz_app/view/home_screen/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenOne(),
    );
  }
}
