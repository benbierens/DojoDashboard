import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'Compiler_converter.dart';

class CompilerDashboard extends StatefulWidget {
  CompilerDashboard(Key? key, this.data) : super(key: key);
  final DashboardModel data;

  @override
  CompilerDashboardState createState() => CompilerDashboardState(data);
}

class CompilerDashboardState extends State<CompilerDashboard> {
  CompilerDashboardState(this.data);
  final DashboardModel data;
  final CompilerConverter converter = CompilerConverter();

  List<CompilerInfo> compilerInfos = <CompilerInfo>[];
  late TeamInfoCompilerDataSource teamInfoDataSource;

  @override
  void initState() {
    super.initState();
    compilerInfos = this.converter.getCompilerData(this.data);
    teamInfoDataSource =
        TeamInfoCompilerDataSource(employeeData: compilerInfos);
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: teamInfoDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridTextColumn(
            columnName: 'teamName',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Team Name',
                ))),
        GridTextColumn(
            columnName: 'utc',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'UTC',
                ))),
        GridTextColumn(
            columnName: 'numberOfGames',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Number of Games',
                ))),
        GridTextColumn(
            columnName: 'totalTurns',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Number of Turns Played',
                ))),
        GridTextColumn(
            columnName: 'spentPerTurn',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Spent / Turn',
                ))),
        GridTextColumn(
            columnName: 'receivedPerTurn',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Received / Turn',
                ))),
        GridTextColumn(
            columnName: 'winsPerTurn',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Wins / Turn',
                )))
      ],
    );
  }
}

class TeamInfoCompilerDataSource extends DataGridSource {
  TeamInfoCompilerDataSource({required List<CompilerInfo> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'teamName', value: e.teamName),
              DataGridCell<String>(columnName: 'utc', value: e.utc),
              DataGridCell<int>(
                  columnName: 'numberOfGames', value: e.numberOfGames),
              DataGridCell<int>(columnName: 'totalTurns', value: e.totalTurns),
              DataGridCell<double>(
                  columnName: 'spentPerTurn', value: e.spentPerTurn),
              DataGridCell<double>(
                  columnName: 'receivedPerTurn', value: e.receivedPerTurn),
              DataGridCell<double>(columnName: 'winsPerTurn', value: e.winsPerTurn)
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

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
