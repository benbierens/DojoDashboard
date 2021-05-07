import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

import '../action_buttons.dart';
import 'compiler_dashboard.dart';

class CompilerPage extends StatelessWidget {
  CompilerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(title: Text('70s Compiler Scores'), actions: getActionButtons(context)),
        body: FutureBuilder<Response>(
            future: Dio().get('http://localhost:5000/dashboard'),
            builder: (_, data) {
              if (data.hasData) {
                return CompilerDashboard(Key('dashb'), data.data!.data);
              }
              return Center(child: Text('Loading the Data...'));
            }));
  }
}
