import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard(this.data);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text("It is ${data}");
  }
}
