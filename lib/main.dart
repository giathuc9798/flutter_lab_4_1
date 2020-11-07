import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex1/Main_Screen.dart';
import 'package:flutter_lab_4_1/Ex2/firstRoute.dart';

void main() => runApp(HeroApp1());

// class HeroApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Transition Demo',
//       home: MainScreen(),
//     );
//   }
// }
class HeroApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Basics',
      home: FirstRoute(),
    );
  }
}