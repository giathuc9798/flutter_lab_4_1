# flutter_lab_4_1

A new Flutter project.

##### Cấu trúc của bài 

## 1. Animate a widget across screens
Đường dẫn của bài tập:[Animate a widget across screens](https://flutter.dev/docs/cookbook/navigation/hero-animations)

#### Main.dart
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

#### Kết quả
![](https://www.redbubble.com/i/photographic-print/Reylo-Fire-by-TaevynAstra/31305547.6Q0TX)