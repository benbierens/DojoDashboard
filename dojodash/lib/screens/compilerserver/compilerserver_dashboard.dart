import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'compilerserver_converter.dart';

class CompilerServerDashboard extends StatefulWidget {
  CompilerServerDashboard(Key? key, this.data) : super(key: key);
  final CompilerStatusResponse data;

  @override
  CompilerServerDashboardState createState() => CompilerServerDashboardState(data);
}

class CompilerServerDashboardState extends State<CompilerServerDashboard> {
  CompilerServerDashboardState(this.data);
  final CompilerStatusResponse data;
  final CompilerServerConverter converter = CompilerServerConverter();

  List<CompilerServerInfo> compilerServerInfos = <CompilerServerInfo>[];
  late CompilerStatusDataSource compilerStatusDataSource;

  @override
  void initState() {
    super.initState();
    compilerServerInfos = this.converter.getCompilerServerData(this.data);
    compilerStatusDataSource =
        CompilerStatusDataSource(compilerServerInfos);
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: compilerStatusDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridTextColumn(
            columnName: 'playerId',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Player Id',
                ))),
        GridTextColumn(
            columnName: 'playerName',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Player Name',
                ))),
        GridTextColumn(
            columnName: 'statusString',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Status',
                ))),
        GridTextColumn(
            columnName: 'gameReports',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Game Reports',
                )))
      ],
    );
  }
}

class CompilerStatusDataSource extends DataGridSource {
  CompilerStatusDataSource(List<CompilerServerInfo> data) {
    _compilerData = data
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'playerId', value: e.playerId),
              DataGridCell<String>(columnName: 'playerName', value: e.playerName),
              DataGridCell<String>(columnName: 'statusString', value: e.statusString),
              DataGridCell<String>(
                  columnName: 'gameReports', value: e.gameReports)
            ]))
        .toList();
  }

  List<DataGridRow> _compilerData = [];

  @override
  List<DataGridRow> get rows => _compilerData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
