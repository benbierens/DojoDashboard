import 'package:dojodash/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  Dashboard(Key? key, this.data) : super(key: key);
  final Map<String, dynamic> data;

  @override
  DashboardState createState() =>
      DashboardState(DashboardModel.fromJson((data)));
}

class DashboardState extends State<Dashboard> {
  DashboardState(this.data);
  final DashboardModel data;

  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  List<Employee> getEmployeeData() {
    //var firstName = data!['scores'][0]['teamInfo']['teamName'];
    //[0].teamInfo.teamName;
    var firstName = data.scores[0].teamInfo.teamName;

    return [
      Employee(10001, firstName, 'Project Lead',
          'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmedia.ifunny.com%2Fresults%2F2016%2F01%2F15%2Fxlxprckn64.jpg&f=1&nofb=1'),
      Employee(10002, 'Kathryn', 'Manager',
          'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmedia.ifunny.com%2Fresults%2F2016%2F01%2F15%2Fxlxprckn64.jpg&f=1&nofb=1'),
      Employee(10003, 'Lara', 'Developer',
          'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmedia.ifunny.com%2Fresults%2F2016%2F01%2F15%2Fxlxprckn64.jpg&f=1&nofb=1'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridTextColumn(
              columnName: 'id',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'ID',
                  ))),
          GridTextColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridTextColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridTextColumn(
              columnName: 'icon',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Icon'))),
        ],
      ),
    );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.icon);

  final int id;
  final String? name;
  final String designation;
  final String icon;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<Image>(
                  columnName: 'salary', value: Image.network(e.icon))
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
