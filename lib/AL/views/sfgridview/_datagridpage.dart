// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material.dart';
// import 'package:sheetviewer/AL/views/sfgridview/rowscontainssearch.dart';
// import 'package:sheetviewer/DL/isardb/sheetview.dart';

// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// import '/AL/views/sfgridview/rows.dart';

// import 'cols.dart';

// /// The home page of the application which hosts the datagrid.
// class DatagridPage extends StatefulWidget {
//   final SheetView sheetView;
//   final String fileTitle;
//   const DatagridPage(this.sheetView, this.fileTitle, {Key? key})
//       : super(key: key);

//   @override
//   _DatagridPageState createState() => _DatagridPageState();
// }

// class _DatagridPageState extends State<DatagridPage> {
//   late RowsDataSource rowsDataSource;
//   String fileurlId = '';
//   @override
//   void initState() {
//     super.initState();
//   }

//   List<String> searchWordSearchInColumn = ['', '__all__']; // 'ship';
//   Future<String> getData() async {
//     rowsDataSource = RowsDataSource(widget.sheetView, context,
//         searchWordSearchInColumn[0], searchWordSearchInColumn[1]);

//     return rowsDataSource.sheetView.rows.length.toString();
//   }

//   void setStateFunc() {
//     setState(() {});
//   }

//   static const double dataPagerHeight = 60;
//   // final DataGridController _controller = DataGridController();
//   // final int _rowsPerPage = 15;

//   LayoutBuilder sfDataGrid() {
//     return LayoutBuilder(builder: (context, constraint) {
//       return Column(
//         children: [
//           SizedBox(
//               height: constraint.maxHeight - dataPagerHeight,
//               width: constraint.maxWidth,
//               child: SfDataGrid(
//                 source: rowsDataSource,
//                 columnWidthMode: ColumnWidthMode.fill,
//                 columns: colsHeader(widget.sheetView, context, setStateFunc),
//               )),
//           Container(
//             height: dataPagerHeight,
//             color: Colors.white,
//             child: SfDataPager(
//               delegate: rowsDataSource,
//               direction: Axis.horizontal,
//               pageCount: widget.sheetView.rows.length / 10,
//             ),
//           )
//         ],
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: searchWordSearchInColumn.isEmpty
//               ? Text(widget.fileTitle)
//               : Text(widget.fileTitle + ' $searchWordSearchInColumn'),
//           actions: [
//             searchWordSearchInColumn.isNotEmpty
//                 ? IconButton(
//                     onPressed: () async {
//                       searchWordSearchInColumn = ['', '__all'];
//                       setState(() {});
//                     },
//                     icon: const Icon(Icons.clear))
//                 : const Text(' '),
//             // Navigate to the Search Screen
//             IconButton(
//                 onPressed: () async {
//                   searchWordSearchInColumn = ['', '__all'];
//                   searchWordSearchInColumn = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               RowsContainsSearch(widget.sheetView.cols)));

//                   setState(() {});
//                 },
//                 icon: const Icon(Icons.search)),
//             IconButton(
//                 onPressed: () async {
//                   // await Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) =>
//                   //             EndpointsTabPage(widget.dataSheet)));
//                 },
//                 icon: const Icon(Icons.developer_board))
//           ],
//         ),
//         body: FutureBuilder<String>(
//           future: getData(), // async work
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return Column(
//                   children: const [
//                     Text('Loading....'),
//                     CircularProgressIndicator()
//                   ],
//                 );

//               default:
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return sfDataGrid();
//                 }
//             }
//           },
//         ));
//   }
// }
