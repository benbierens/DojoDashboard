import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import '../action_buttons.dart';
import '../dashboard_endpoint.dart';

class KeyServerPage extends StatelessWidget {
  KeyServerPage({Key? key}) : super(key: key);
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
            title: Text('Key Finder Server Status'),
            actions: getActionButtons(context)),
        body: endpoint.onKeyStatusData(buildKeyStatus));
  }

  String single(List<String> list) {
    return list.join(",");
  }

  Widget buildKeyStatus(KeyServerStatusResponse status) {
    var text = 'Current key: ${status.currentKeyNumber}\n';
    if (status.currentKeyNumber == -1) {
      text += 'The server is offline.\n\n';
    }
    text += 'Expires: ${status.expiresUtc.toIso8601String()}\n';
    text += 'Current players: ${single(status.playersJoined)}\n';
    text += 'Winners: ${single(status.winners)}\n';
    text += 'Maximum number of entries: ${status.maxNumberOfEntries}\n';
    text += 'Maximum line length: ${status.maxLineLength}\n';



    return Center(
        child: Container(
            width: 500, child: Text(text, style: TextStyle(fontSize: 22))));
  }
}
