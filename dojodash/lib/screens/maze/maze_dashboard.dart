import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'maze_converter.dart';

class MazeDashboard extends StatefulWidget {
  MazeDashboard(Key? key, this.data) : super(key: key);
  final DashboardModel data;

  @override
  MazeDashboardState createState() =>
      MazeDashboardState(data);
}

class MazeDashboardState extends State<MazeDashboard> {
  MazeDashboardState(this.data);
  final DashboardModel data;
  final MazeConverter converter = MazeConverter();

  List<MazeInfo> mazeInfos = <MazeInfo>[];
  late TeamInfoMazeDataSource teamInfoDataSource;

  @override
  void initState() {
    super.initState();
    mazeInfos = this.converter.getTeamInfoMazeData(this.data);
    teamInfoDataSource = TeamInfoMazeDataSource(employeeData: mazeInfos);
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
            columnName: 'numMazesCompleted',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Number of mazes completed',
                ))),
        GridTextColumn(
            columnName: 'maxSteps',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Max steps taken',
                ))),
        GridTextColumn(
            columnName: 'minSteps',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Min steps taken',
                ))),
        GridTextColumn(
            columnName: 'maxSize',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Largest maze solved',
                ))),
        GridTextColumn(
            columnName: 'minSize',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Smallest maze solved',
                ))),
        GridTextColumn(
            columnName: 'maxHits',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Players attacked',
                ))),
        GridTextColumn(
            columnName: 'maxTimesHit',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Number of times attacked',
                )))
      ],
    );
  }
}

class TeamInfoMazeDataSource extends DataGridSource {
  TeamInfoMazeDataSource({required List<MazeInfo> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'teamName', value: e.teamName),
              DataGridCell<int>(
                  columnName: 'numMazesCompleted', value: e.numMazesCompleted),
              DataGridCell<int>(columnName: 'maxSteps', value: e.maxSteps),
              DataGridCell<int>(columnName: 'minSteps', value: e.minSteps),
              DataGridCell<int>(columnName: 'maxSize', value: e.maxSize),
              DataGridCell<int>(columnName: 'minSize', value: e.minSize),
              DataGridCell<int>(columnName: 'maxHits', value: e.maxHits),
              DataGridCell<int>(columnName: 'maxTimesHit', value: e.maxTimesHit)
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
