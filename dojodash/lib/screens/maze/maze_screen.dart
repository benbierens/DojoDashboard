import 'package:flutter/material.dart';
import '../action_buttons.dart';
import '../dashboard_endpoint.dart';
import 'maze_dashboard.dart';

class MazePage extends StatelessWidget {
  MazePage({Key? key}) : super(key: key);
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(title: Text('Maze Solver Scores'), actions: getActionButtons(context)),
                body: endpoint.onDashboardData((data) => MazeDashboard(
            UniqueKey(), data)));
  }
}
