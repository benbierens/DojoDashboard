import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../action_buttons.dart';
import 'maze_dashboard.dart';

class MazePage extends StatelessWidget {
  MazePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(title: Text('Maze'), actions: getActionButtons(context)),
        body: FutureBuilder<Response>(
            future: Dio().get('http://localhost:5000/dashboard'),
            builder: (_, data) {
              if (data.hasData) {
                return MazeDashboard(Key('dashb'), data.data!.data);
              }
              return Center(child: Text('Loading the Data...'));
            }));
  }
}
