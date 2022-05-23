import 'package:gsheets/gsheets.dart';

/// Your google auth credentials //sheets2mob-223110@appspot.gserviceaccount.com
///
/// how to get credentials - https://medium.com/@a.marenkov/how-to-get-credentials-for-google-sheets-456b7e88c430
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "sheets2mob-223110",
  "private_key_id": "8d08c47d2fa201335b8e9afb46c9eed87757e367",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCaH/1V5cYbTBW5\n2IAc3fpMy/mlz/BxIU06Xwu5XUrBxXnr1AF5PfKBDNSxFNQh3QgQNqurQVpATtRQ\nc6jwYflv6wrLgH25DNKpeW2eUn5/WF9CFqk2IVMQL4ytN7b3JcSvcY+ftNVDvbnc\nzfqNonQJTymBQZXY+yIe8qq7KgDBr1IksLTC7LMFVBJH/8A4EnSmCa5PCve95RY4\nA9AV42oyIPk8TzpF6NSgOJrJbAQ0R71JN43499Vr7VRhEnkHTbbNf5MfiikJ3zSD\nothFXSDXVMOi7qb3oxCa7rV7vmIerARoRygSXaWIQNvqfrNVE7a7n79yhf/XAUih\nD7nmOEGBAgMBAAECggEACbGKH49La89X3PfTy+z+p3qbPZ1jzhu19Z5BeKO4VlJX\nIhjUDGXz5P+zd10739Lc5Vco6iUauelzU0mI9jB1TZ+S7txqm9tFexz84tylodkD\nKb8O3q2PIbkZ4BGdX3M3yQCLk9P950wtHsjyMZsGcQjyb3OaavqViWyCBjJEuKm3\nBo0A8wMkEvz3AwjyiLRgLZ+B/8LFL0xnRk8PmXw0PeGBOm1zCRENpLwsNaRbaJ32\nxLasj+UzqjzeDt8/+WK0euWR480IYa2YYFUt+pxVNd9oreJ6JfuA+n3rdcshjHth\nlXCUkW3mOjvmH6toWAQ06hgA07U28nN3n18vziQbiQKBgQDUNG5cfoPazPNwT8gh\nTrXHikIY/GkAVJXeiOxiMdU0j1kfP1n8dy9g6JXUt5GSexUqojmzm9uzDRfb3Xm7\nfVkaYkx2vds7GOTLlmOPJKjPinkmQg3xQNlpMXPFCXFLZ4dp8UsTCF2mzdDAR5Df\nvr1njfFcGhQMQfeWGQS6KEaVKQKBgQC57vvwIJFdTxVJ0MgMPh8MpUw24RFQNpnP\n4ZBvqnKDywbSaEzOygGpk+t5YtRspdHyvsBZaog0okPnMMe9/Q+Y7TgL0IrjTs0N\naGc5jT/Km2Sy23H+PCeKNMfK7ZBKj33ZFpNeQXDbsvQwUGTM+EEmgKeFt3uXg0fI\n8l4ag2e8mQKBgQC5g7TPq9L935sbHsRpSfRlI5uxWEk7frceuzlchxBLSN6zEKFM\ns6153RvPwUPEeVIB2Zz0RleFavbmwfKAVI8nH7SVQll8isDKswkKxRPHjNlo9upV\ndUocSp1ZLm4ba8DYf5gQZYnqH5hV4LrowEm5VEAjMrFAHhOi5vBZBojeMQKBgEo8\n4HztE/1UkSRq5yT0PMN40GhtDtOfKWS2JExhmt2CV9P07w313BoQRImv6y8COkSY\n4wYQoheZ3lDVyjrSasLdnG4jMwE1OmwrDmQNQLYtu1QqiGZBMGxfTJJ6rg0HI/Fk\nsSyGJoCiABu2TbkFOkYcQkcCjqddNHFITEh7xRSpAoGBAJvk8kOQoTIzJG0HZOBK\nkzSqizB/fQ3SD8SPSUM9YVxAUreKm7Vm7z8vyDTdmsK6G6y5OPWoMwxok7Fsmbv7\n/Isw0nAHK0vklLIu0LovS7KDDEqK9gxuMIcFdu64PnItk7t7iHvYbsk6SP0Ho0Lb\nlHus9ZfCYKb2eRB8NQY7Lywi\n-----END PRIVATE KEY-----\n",
  "client_email": "sheets2mob-223110@appspot.gserviceaccount.com",
  "client_id": "112942213519535712583",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sheets2mob-223110%40appspot.gserviceaccount.com"
}
''';

/// Your spreadsheet id
///
/// It can be found in the link to your spreadsheet -
/// link looks like so https://docs.google.com/spreadsheets/d/YOUR_SPREADSHEET_ID/edit#gid=0
/// [YOUR_SPREADSHEET_ID] in the path is the id your need
const _spreadsheetId = '1soitqp8gukkQeITurQYhWC_gD-AgpOA5cxMPE00MI5A';

Future<String> contentServiceUrl() async {
  // init GSheets
  final gsheets = GSheets(_credentials);
  // fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);

  // get worksheet by its title
  var sheet = ss.worksheetByTitle('serviceConfig');
  // create worksheet if it does not exist yet
  sheet ??= await ss.addWorksheet('serviceConfig');

  // get cell at 'B2' as Cell object
  final cell = await sheet.cells.cell(column: 2, row: 1);
  // prints 'new'
  return cell.value;
}
