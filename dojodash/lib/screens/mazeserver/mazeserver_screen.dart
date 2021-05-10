import 'package:flutter/material.dart';
import '../action_buttons.dart';

class MazeServerPage extends StatelessWidget {
  MazeServerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
            title: Text('Maze Server Status'),
            actions: getActionButtons(context)),
        body: Text('a'));
  }
}
