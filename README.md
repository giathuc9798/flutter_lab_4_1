# flutter_lab_4_1

A new Flutter project.

## Cấu trúc của bài

## 1. Animate a widget across screens

Đường dẫn của bài tập:[Animate a widget across screens](https://flutter.dev/docs/cookbook/navigation/hero-animations)

### Main.dart

```dart

import 'package:flutter/material.dart';
void main() => runApp(HeroApp5());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}
```

#### DetaiScreen.dart

```dart

import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
```

#### Main_Screen.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex1/detailScreen.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}
```

#### Kết quả Ex1

![trước khi click](\lib\pic\Ex1_1.jpg) ![Sau khi click](\lib\pic\Ex1_2.jpg)

## 2. Navigate to a new screen and back

Đường dẫn của bài tập:[Navigate to a new screen and back](https://flutter.dev/docs/cookbook/navigation/navigation-basics)

### fristRoute.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex2/Second_route.dart';
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}
```

#### SecondRoute.dart

```dart

import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```

#### main.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex2/firstRoute.dart';
void main() => runApp(HeroApp());
class HeroApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Basics',
      home: FirstRoute(),
    );
  }
}
```

#### Kết quả Ex2

![trước khi click](\lib\pic\Ex2_1.jpg) ![Sau khi click](\lib\pic\Ex2_2.jpg)

## 3. Navigate with named routes

Đường dẫn của bài tập:[Navigate with named routes](https://flutter.dev/docs/cookbook/navigation/named-routes)

### FristScreen

```dart
import 'package:flutter/material.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
```

### SecondScreen.dart

```dart
import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```

### main_Ex3.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex3/FirstScreen.dart';
import 'package:flutter_lab_4_1/Ex3/SecondScreen.dart';
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
```

#### Kết quả Ex3

![trước khi click](\lib\pic\Ex3_1.jpg) ![Sau khi click](\lib\pic\Ex3_2.jpg)

## 4. Pass arguments to a named route

Đường dẫn của bài tập:[Pass arguments to a named route](https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments)

### ExtractArgument.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex4/ScreenArguments_class.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
```

### HomeScreen.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex4/ScreenArguments_class.dart';
import 'package:flutter_lab_4_1/Ex4/ExtractArgumentScreen.dart';
import 'package:flutter_lab_4_1/Ex4/PassArgumentScreen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A button that navigates to a named route that. The named route
            // extracts the arguments by itself.
            ElevatedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to a named route
                // and provide the arguments as an optional parameter.
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                );
              },
            ),
            // A button that navigates to a named route. For this route, extract
            // the arguments in the onGenerateRoute function and pass them
            // to the screen.
            ElevatedButton(
              child: Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to a named route
                // and provide the arguments as an optional parameter.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute function.',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### PassArgumentScreen.dart

```dart
import 'package:flutter/material.dart';
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
```

### ScreenArguments.dart

```dart
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
```

### Main_Ex4.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex4/ExtractArgumentScreen.dart';
import 'package:flutter_lab_4_1/Ex4/HomeScreen.dart';
import 'package:flutter_lab_4_1/Ex4/PassArgumentScreen.dart';
import 'package:flutter_lab_4_1/Ex4/ScreenArguments_class.dart';
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
```

#### Kết quả Ex4

![trước khi click](\lib\pic\Ex4_1.jpg) ![Sau khi click Navigate to screen](\lib\pic\Ex4_2.jpg)![Sau khi click Navigate to a name](\lib\pic\Ex4_3.jpg)

## 5. Return data from a screen

Đường dẫn của bài tập:[Return data from a screen](https://flutter.dev/docs/cookbook/navigation/returning-data)

### HomeScreen_Ex4.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex5/Selectionbutton.dart';
class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}
```

### Selectionbutton.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex5/SelectionScreen.dart';
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}
```

### seclectionScreen.dart

```dart
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Nope!" as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

### Main_ex5.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex5/HomeScreen.dart';
class HeroApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returning Data',
    home: HomeScreen1(),
    );
  }
}
```

### Kết quả Ex 5

![trước khi click](\lib\pic\Ex5_1.jpg) ![Sau khi click pick an option](\lib\pic\Ex5_2.jpg)![Sau khi click yes](\lib\pic\Ex5_3.jpg)![Sau khi click no](\lib\pic\Ex5_4.jpg)

## 6. Send data to a new screen

Đường dẫn của bài tập:[Send data to a new screen](https://flutter.dev/docs/cookbook/navigation)

### DetailScreen.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex6/todo.dart';
class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
```

### todo.dart

```dart
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
```

### todoScreen.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex6/todo.dart';
import 'package:flutter_lab_4_1/Ex6/DetailScreen.dart';
class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```

### Main_ex6.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/Ex6/todo.dart';
import 'package:flutter_lab_4_1/Ex6/todoScreen.dart';
class HeroApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(
        20,
        (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
        ),
      ),
    ),
    );
  }
}
```

### kết quả Ex 6

![trước khi click](\lib\pic\Ex6_1.jpg) ![Sau khi click ](\lib\pic\Ex6_2.jpg)
