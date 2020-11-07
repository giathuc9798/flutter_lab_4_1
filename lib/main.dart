import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex1/Main_Screen.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}