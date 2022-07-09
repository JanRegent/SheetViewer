import 'package:cross_file/cross_file.dart';

//final file = XFile('assets/csv.local/FlutterTest.txt');
final file = XFile('assets/csv.refresh/FlutterTest.txt');

Future csvRefresh() async {
  print('File information:');
  print('- Path: ${file.path}');
  print('- Name: ${file.name}');
  print('- MIME type: ${file.mimeType}');

  final fileContent = await file.readAsString();
  print('Content of the file:\n${fileContent}');
}
