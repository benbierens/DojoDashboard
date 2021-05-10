import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../dashboard_model.dart';

class DashboardEndpoint {
  bool _running = true;

  Stream<DashboardModel> _clock() async* {
    while (_running) {
      var data = await fetchDashboardData();
      if (data != null) {
        yield DashboardModel.fromJson(data);
      }
      await Future<void>.delayed(Duration(seconds: 10));
    }
  }

  Future<dynamic> fetchDashboardData() async {
    var result = await Dio().get('http://localhost:5000/dashboard');
    return result.data;
  }

  StreamBuilder onDashboardData(Function dashboardRenderer) {
    return StreamBuilder(
        stream: _clock(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Loading the Data...'));
          }
          if (snapshot.data == null) {
            return Center(child: Text('No data received yet...'));
          }
          return dashboardRenderer(snapshot.data);
        });
  }
}
