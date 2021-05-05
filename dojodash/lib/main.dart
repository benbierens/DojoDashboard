import 'package:dojodash/screens/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: YeetInformationParser(),
        routerDelegate: YeeterDelegate(yeet: myRoutes),
        title: 'Public Virtual Async Coding-Dojo Dashboard Jonge!',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
