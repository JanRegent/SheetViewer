import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';

//final file = XFile('assets/csv.local/FlutterTest.txt');
final file = XFile('assets/csv.refresh/FlutterTest.txt');

Future csvRefresh() async {
  final fileContent = await file.readAsString();
  if (kDebugMode) {
    print('File information:');

    print('- Path: ${file.path}');
    print('- Name: ${file.name}');
    print('- MIME type: ${file.mimeType}');
    print('Content of the file:\n$fileContent');
  }
}
