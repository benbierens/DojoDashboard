import 'package:flutter/material.dart';
import '../action_buttons.dart';

class KeyServerPage extends StatelessWidget {
  KeyServerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
            title: Text('Key Finder Server Status'),
            actions: getActionButtons(context)),
        body: Text('a'));
  }
}
