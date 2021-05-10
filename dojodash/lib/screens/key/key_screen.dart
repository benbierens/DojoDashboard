import 'package:flutter/material.dart';
import '../action_buttons.dart';
import '../dashboard_endpoint.dart';
import 'key_dashboard.dart';

class KeyPage extends StatelessWidget {
  KeyPage({Key? key}) : super(key: key);
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(title: Text('Key Finder Scores'), actions: getActionButtons(context)),
        body: endpoint.onDashboardData((data) => KeyDashboard(
            UniqueKey(), data)));
          }
}
