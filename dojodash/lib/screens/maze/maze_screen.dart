import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

class MazePage extends StatelessWidget {
  MazePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Maze'),
   actions: [
          IconButton(icon: Icon(Icons.home), onPressed: () => context.yeet('/')),
          IconButton(icon: Icon(Icons.person), onPressed: () => context.yeet('/maze'))
        ]),
        body: Text('My Maze Page!'));
  }
}
