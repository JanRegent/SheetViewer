import 'package:http/http.dart' as http;

Future<String> post0(String fileId, String sheetName, String column,
    String operator, String value) async {
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.https('script.google.com',
            'macros/s/AKfycbzFVSOAxR2W8NZ1Ptu-qYnZNB6Xv-VdYG-jkZOMbXz4-FBtiO6nZbHtNcI_-Wa00mlU/exec'),
        body: {
          'name': DateTime.now().toIso8601String(),
          'fileId': fileId,
          'sheetName': sheetName,
          'column': column,
          'operator': operator,
          'value': value,
        });
    return response.body;
  } finally {
    client.close();
  }
}
