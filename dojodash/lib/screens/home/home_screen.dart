import 'package:dojodash/screens/action_buttons.dart';
import 'package:dojodash/screens/dashboard_endpoint.dart';
import 'package:flutter/material.dart';
import 'overview_dashboard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  final String title = 'Dojo Dashboard - Score Overview';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DashboardEndpoint endpoint = DashboardEndpoint();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title), actions: getActionButtons(context)),
        body: endpoint.onDashboardData((data) => OverviewDashboard(
            UniqueKey(), data)));
  }
}
