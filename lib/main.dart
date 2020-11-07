import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex1/Main_Screen.dart';
import 'package:flutter_lab_4_1/Ex2/firstRoute.dart';
import 'package:flutter_lab_4_1/Ex3/FirstScreen.dart';
import 'package:flutter_lab_4_1/Ex3/SecondScreen.dart';

void main() => runApp(HeroApp2());

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

class HeroApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
    }
    );
  }
}
