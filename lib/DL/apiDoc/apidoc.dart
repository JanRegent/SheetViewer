// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'apidoccols.dart';
import 'apidocrows.dart';

class ApidocDataGrid extends StatefulWidget {
  final DataSheet dataSheet;
  static String id = 'datagrid';
  ApidocDataGrid(this.dataSheet, {Key? key}) : super(key: key);

  @override
  _ApidocDataGridState createState() => _ApidocDataGridState();
}

class _ApidocDataGridState extends State<ApidocDataGrid> {
  late RowsDataSource rowsDataSource;

  @override
  void initState() {
    super.initState();
    rowsDataSource = RowsDataSource(widget.dataSheet, context, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: Column(
        children: [
          SfDataGrid(
            source: rowsDataSource,
            columnWidthMode: ColumnWidthMode.fill,
            selectionMode: SelectionMode.multiple,
            columns: colsHeader(widget.dataSheet, context),
          ),
          MaterialButton(
              color: Colors.red,
              onPressed: () {
                /// Add new Row
              })
        ],
      ),
    );
  }
}

// List<Employee> getEmployeeData() {
//   return [
//     Employee(10001, 'James', 'Project Lead', 20000),
//     Employee(10002, 'Kathryn', 'Manager', 30000),
//     Employee(10003, 'Lara', 'Developer', 15000),
//     Employee(10004, 'Michael', 'Designer', 15000),
//     Employee(10005, 'Martin', 'Developer', 15000),
//     Employee(10006, 'Newberry', 'Developer', 15000),
//     Employee(10007, 'Balnc', 'Developer', 15000),
//     Employee(10008, 'Perry', 'Developer', 15000),
//     Employee(10009, 'Gable', 'Developer', 15000),
//     Employee(20202, 'Grimes', 'Developer', 15000),
//   ];
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the employee which will be rendered in datagrid.
// class Employee {
//   /// Creates the employee class with required details.
//   Employee(this.id, this.name, this.designation, this.salary);

//   /// Id of an employee.
//   final int id;

//   /// Name of an employee.
//   final String name;

//   /// Designation of an employee.
//   final String designation;

//   /// Salary of an employee.
//   final int salary;
// }

// /// An object to set the employee collection data source to the datagrid. This
// /// is used to map the employee data to the datagrid widget.
// class EmployeeDataSource extends DataGridSource {
//   EmployeeDataSource({required List<Employee> employeeData}) {
//     _employeeData = employeeData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'id', value: e.id),
//               DataGridCell<String>(columnName: 'name', value: e.name),
//               DataGridCell<String>(
//                   columnName: 'designation', value: e.designation),
//               DataGridCell<int>(columnName: 'salary', value: e.salary),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _employeeData = [];

//   @override
//   List<DataGridRow> get rows => _employeeData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }
