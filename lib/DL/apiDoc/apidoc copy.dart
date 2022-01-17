// // ignore_for_file: prefer_const_constructors_in_immutables

// import 'package:flutter/material.dart';
// import 'package:sheetviewer/BL/sheet/datasheet.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// import 'apidoccols.dart';
// import 'apidocrows.dart';

// class ApidocDataGrid extends StatefulWidget {
//   final DataSheet dataSheet;
//   static String id = 'datagrid';
//   ApidocDataGrid(this.dataSheet, {Key? key}) : super(key: key);

//   @override
//   _ApidocDataGridState createState() => _ApidocDataGridState();
// }

// class _ApidocDataGridState extends State<ApidocDataGrid> {
//   late RowsDataSource rowsDataSource;

//   @override
//   void initState() {
//     super.initState();
//     rowsDataSource = RowsDataSource(widget.dataSheet, context, '');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter DataGrid'),
//       ),
//       body: Column(
//         children: [
//           SfDataGrid(
//             source: rowsDataSource,
//             columnWidthMode: ColumnWidthMode.fill,
//             selectionMode: SelectionMode.multiple,
//             columns: colsHeader(widget.dataSheet, context),
//           ),
//           MaterialButton(
//               color: Colors.red,
//               onPressed: () {
//                 /// Add new Row
//               })
//         ],
//       ),
//     );
//   }
// }
