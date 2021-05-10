import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../dashboard_model.dart';

class DashboardEndpoint {
  bool _running = true;

  Stream<dynamic> _clock(String url, Function jsonParser) async* {
    while (_running) {
      var data = await _fetchDashboardData(url);
      if (data != null) {
        yield jsonParser(data);
      }
      await Future<void>.delayed(Duration(seconds: 10));
    }
  }

  Future<dynamic> _fetchDashboardData(String url) async {
    var full = 'http://localhost:5000/$url';
    var result = await Dio().get(full);
    return result.data;
  }

  StreamBuilder _onEndpointData(
      Function renderMethod, String url, Function jsonParser) {
    return StreamBuilder(
        stream: _clock(url, jsonParser),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Loading the Data...'));
          }
          if (snapshot.data == null) {
            return Center(child: Text('No data received yet...'));
          }
          return renderMethod(snapshot.data);
        });
  }

  StreamBuilder onDashboardData(Function dashboardRenderer) {
    return _onEndpointData(
        dashboardRenderer, 'dashboard', (map) => DashboardModel.fromJson(map));
  }

  StreamBuilder onMazeStatusData(Function mazeStatusRenderer) {
    return _onEndpointData(mazeStatusRenderer, 'dashboard/server',
        (map) => MazeServerStatusResponse.fromJson(map));
  }

  StreamBuilder onKeyStatusData(Function keyStatusRenderer) {
    return _onEndpointData(keyStatusRenderer, 'evaluate/status',
        (map) => KeyServerStatusResponse.fromJson(map));
  }

  StreamBuilder onCompilerStatusData(Function compilerStatusRenderer) {
    return _onEndpointData(compilerStatusRenderer, 'compiler/status',
        (map) => CompilerStatusResponse.fromJson(map));
  }
}
