import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import '../action_buttons.dart';
import '../dashboard_endpoint.dart';

class CompilerServerPage extends StatelessWidget {
  CompilerServerPage({Key? key}) : super(key: key);
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

  Widget buildKeyStatus(dynamic status) {
    var text = 'a';

    return Center(
        child: Container(
            width: 500, child: Text(text, style: TextStyle(fontSize: 22))));
  }
}
