import 'package:dojodash/dashboard_model.dart';
import 'package:dojodash/screens/home/overview_converter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OverviewDashboard extends StatefulWidget {
  OverviewDashboard(Key? key, this.data) : super(key: key);
  final Map<String, dynamic> data;

  @override
  OverviewDashboardState createState() =>
      OverviewDashboardState(DashboardModel.fromJson((data)));
}

class OverviewDashboardState extends State<OverviewDashboard> {
  OverviewDashboardState(this.data);
  final DashboardModel data;
  final OverviewConverter converter = OverviewConverter();

  List<TeamInfoOverview> teamInfos = <TeamInfoOverview>[];
  late TeamInfoOverviewDataSource teamInfoDataSource;

  @override
  void initState() {
    super.initState();
    teamInfos = this.converter.getTeamInfoOverviewData(this.data);
    teamInfoDataSource = TeamInfoOverviewDataSource(employeeData: teamInfos);
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
            columnName: 'teamMembers',
            label: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('Team Members'))),
        GridTextColumn(
            columnName: 'maze',
            label: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  'Maze Puzzle',
                  overflow: TextOverflow.ellipsis,
                ))),
        GridTextColumn(
            columnName: 'key',
            label: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('Key Puzzle'))),
                 GridTextColumn(
            columnName: 'compiler',
            label: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text('Compiler Puzzle')))
      ],
    );
  }
}

class TeamInfoOverviewDataSource extends DataGridSource {
  TeamInfoOverviewDataSource({required List<TeamInfoOverview> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'teamName', value: e.teamName),
              DataGridCell<String>(
                  columnName: 'teamMembers', value: e.teamMembers),
              DataGridCell<String>(columnName: 'maze', value: e.mazeReport),
              DataGridCell<String>(columnName: 'key', value: e.keyReport),
              DataGridCell<String>(columnName: 'compiler', value: e.compilerReport)
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
