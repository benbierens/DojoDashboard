import 'package:yeet/yeet.dart';
import 'compiler/compiler_screen.dart';
import 'home/home_screen.dart';
import 'key/key_screen.dart';
import 'keyserver/keyserver_screen.dart';
import 'maze/maze_screen.dart';
import 'mazeserver/mazeserver_screen.dart';

final myRoutes = Yeet(
  children: [
    Yeet(path: '/', builder: (_) => MyHomePage()),
    Yeet(path: '/maze', builder: (_) => MazePage()),
    Yeet(path: '/mazeserver', builder: (_) => MazeServerPage()),
    Yeet(path: '/key', builder: (_) => KeyPage()),
    Yeet(path: '/keyserver', builder: (_) => KeyServerPage()),
    Yeet(path: '/compiler', builder: (_) => CompilerPage())
  ]
);
