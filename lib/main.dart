import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex1/Main_Screen.dart';
import 'package:flutter_lab_4_1/Ex2/firstRoute.dart';
import 'package:flutter_lab_4_1/Ex3/FirstScreen.dart';
import 'package:flutter_lab_4_1/Ex3/SecondScreen.dart';
import 'package:flutter_lab_4_1/Ex4/ExtractArgumentScreen.dart';
import 'package:flutter_lab_4_1/Ex4/HomeScreen.dart';
import 'package:flutter_lab_4_1/Ex4/PassArgumentScreen.dart';
import 'package:flutter_lab_4_1/Ex4/ScreenArguments_class.dart';
import 'package:flutter_lab_4_1/Ex5/HomeScreen.dart';

void main() => runApp(HeroApp4());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}
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

class HeroApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Provide a function to handle named routes. Use this function to
        // identify the named route being pushed, and create the correct
        // Screen.
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == PassArgumentsScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments args = settings.arguments;

            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return PassArgumentsScreen(
                  title: args.title,
                  message: args.message,
                );
              },
            );
          }
          // The code only supports PassArgumentsScreen.routeName right now.
          // Other values need to be implemented if we add them. The assertion
          // here will help remind us of that higher up in the call stack, since
          // this assertion would otherwise fire somewhere in the framework.
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
        title: 'Navigation with Arguments',
        home: HomeScreen(),
        routes: {
          ExtractArgumentsScreen.routeName: (context) =>
              ExtractArgumentsScreen(),
        });
  }
}


class HeroApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returning Data',
    home: HomeScreen1(),
    );
  }
}

