import 'package:flutter/material.dart';

import '../action_buttons.dart';
import '../dashboard_endpoint.dart';
import 'compiler_dashboard.dart';
import 'package:yeet/yeet.dart';

class CompilerPage extends StatelessWidget {
  CompilerPage({Key? key}) : super(key: key);
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
            title: Text('70s Compiler Scores'),
            actions: getActionButtons(context)),
        body: endpoint
            .onDashboardData((data) => CompilerDashboard(UniqueKey(), data)),
        bottomNavigationBar: ElevatedButton(
            child: Text('Compiler Server Status'),
            onPressed: () => context.yeet('/compilerserver')));
  }
}
