import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'key_converter.dart';

class KeyDashboard extends StatefulWidget {
  KeyDashboard(Key? key, this.data) : super(key: key);
  final Map<String, dynamic> data;

  @override
  KeyDashboardState createState() =>
      KeyDashboardState(DashboardModel.fromJson((data)));
}

class KeyDashboardState extends State<KeyDashboard> {
  KeyDashboardState(this.data);
  final DashboardModel data;
  final KeyConverter converter = KeyConverter();

  List<KeyInfo> KeyInfos = <KeyInfo>[];
  late TeamInfoKeyDataSource teamInfoDataSource;

  @override
  void initState() {
    super.initState();
    KeyInfos = this.converter.getTeamInfoKeyData(this.data);
    teamInfoDataSource = TeamInfoKeyDataSource(employeeData: KeyInfos);
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
            columnName: 'totalEntries',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Total entries evaluated',
                ))),
        GridTextColumn(
            columnName: 'minEntries',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Least entries to solution',
                ))),
        GridTextColumn(
            columnName: 'maxEntries',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Most entries to solution',
                ))),
        GridTextColumn(
            columnName: 'minSeconds',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Fastest solution (sec)',
                ))),
        GridTextColumn(
            columnName: 'maxSeconds',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Slowest solution (sec)',
                )))
      ],
    );
  }
}

class TeamInfoKeyDataSource extends DataGridSource {
  TeamInfoKeyDataSource({required List<KeyInfo> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'teamName', value: e.teamName),
              DataGridCell<int>(
                  columnName: 'totalEntries', value: e.totalEntries),
              DataGridCell<int>(columnName: 'minEntries', value: e.minEntries),
              DataGridCell<int>(columnName: 'maxEntries', value: e.maxEntries),
              DataGridCell<int>(columnName: 'minSeconds', value: e.minSeconds),
              DataGridCell<int>(columnName: 'maxSeconds', value: e.maxSeconds)
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
