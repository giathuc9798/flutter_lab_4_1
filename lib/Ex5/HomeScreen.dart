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