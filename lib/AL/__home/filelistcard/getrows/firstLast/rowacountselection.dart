// import 'package:flutter/material.dart';



// List<String> reportList = [
//   "Not relevant",
//   "Illegal",
//   "Spam",
//   "Offensive",
//   "Uncivil"
// ];

// List<String> interestList = [];

// Future<String> selectInterestDialog(BuildContext context) async {
//   String selectedInterst = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         //Here we will build the content of the dialog
//         return AlertDialog(
//           title: const Text("Select interest"),
//           content: MultiSelectChip(
//             reportList,
//             onSelectionChanged: (selectedList) {
//               interestList = selectedList;
//             },
//             maxSelection: 2,
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//                 child: const Text("Select interest"),
//                 onPressed: () {
//                   Navigator.of(context).pop(interestList.join(" , "));
//                 })
//           ],
//         );
//       });

//   return selectedInterst;
// }
