import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

import 'key_dashboard.dart';

class KeyPage extends StatelessWidget {
  KeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(title: Text('Key'), actions: [
          IconButton(
              icon: Icon(Icons.home), onPressed: () => context.yeet('/')),
          IconButton(
              icon: Icon(Icons.person), onPressed: () => context.yeet('/maze')),
          IconButton(
              icon: Icon(Icons.vpn_key), onPressed: () => context.yeet('/key'))
        ]),
        body: FutureBuilder<Response>(
            future: Dio().get('http://localhost:5000/dashboard'),
            builder: (_, data) {
              if (data.hasData) {
                return KeyDashboard(Key('dashb'), data.data!.data);
              }
              return Center(child: Text('Loading the Data...'));
            }));
  }
}
