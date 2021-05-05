import 'package:dojodash/main.dart';
import 'package:yeet/yeet.dart';
import 'home/home_screen.dart';

final myRoutes = Yeet(
  children: [
    Yeet(path: '/', builder: (_) => MyHomePage())
  ]
);
