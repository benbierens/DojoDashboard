import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import '../action_buttons.dart';
import '../dashboard_endpoint.dart';
import 'compilerserver_dashboard.dart';

class CompilerServerPage extends StatelessWidget {
  CompilerServerPage({Key? key}) : super(key: key);
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return endpoint
        .onCompilerStatusData((data) => buildCompilerStatus(data, context));
  }

  Widget buildCompilerStatus(
      CompilerStatusResponse status, BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
            title: Text('70s Compiler Server Status'),
            actions: getActionButtons(context)),
        body: CompilerServerDashboard(UniqueKey(), status),
        bottomNavigationBar: Text(formatBottomText(status)));
  }

  String formatBottomText(CompilerStatusResponse status) {
    return 'Last Compiler Run: ${status.latestCompilerRunUtc.toIso8601String()}\n' +
    'Number of turns: ${status.config.minNumberOfTurns} / ${status.config.maxNumberOfTurns} - Coop-reward: ${status.config.coopReward} - Chance of Failure: ${status.config.chanceOfFailure}';
  }
}
