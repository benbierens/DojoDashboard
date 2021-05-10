import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import '../action_buttons.dart';
import '../dashboard_endpoint.dart';

class MazeServerPage extends StatelessWidget {
  MazeServerPage({Key? key}) : super(key: key);
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
            title: Text('Maze Server Status'),
            actions: getActionButtons(context)),
        body: endpoint.onMazeStatusData(buildMazeStatus));
  }

  String indicator(DateTime utc) {
    if (DateTime.now().difference(utc).inMinutes > 5) {
      return 'Server is probably offline\n';
    }
    return 'Server is online\n';
  }

  Widget buildMazeStatus(MazeServerStatusResponse status) {
    var when = status.lastServerUpdateUtc.toIso8601String();

    var text = 'Latest Server Update: $when \n';
    text += indicator(status.lastServerUpdateUtc);
    text += 'Most recent number of players: ${status.lastNumberOfPlayerMoves}';

    return Center(
        child: Container(
            width: 500, child: Text(text, style: TextStyle(fontSize: 22))));
  }
}
