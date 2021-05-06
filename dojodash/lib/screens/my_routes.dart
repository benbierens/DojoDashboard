import 'package:dojodash/main.dart';
import 'package:yeet/yeet.dart';
import 'home/home_screen.dart';
import 'key/key_screen.dart';
import 'maze/maze_screen.dart';

final myRoutes = Yeet(
  children: [
    Yeet(path: '/', builder: (_) => MyHomePage()),
    Yeet(path: '/maze', builder: (_) => MazePage()),
    Yeet(path: '/key', builder: (_) => KeyPage())
  ]
);
