import 'package:flutter/material.dart';
import 'package:yeet/yeet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  final String title = 'Dojo Dashboard';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          IconButton(
              icon: Icon(Icons.home), onPressed: () => context.yeet('/')),
          IconButton(
              icon: Icon(Icons.person), onPressed: () => context.yeet('/maze'))
        ]),
        body: FutureBuilder(
            future: Future.delayed(Duration(seconds: 3), () => 'Cheese'),
            builder: (_, data) {
              if (data.hasData) {
                return Text('It was: ${data.data}');
              }
              return Text('Bussje komt zo');
            }));
  }
}
