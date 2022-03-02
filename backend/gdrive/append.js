function appendCSV(csv) {
  //csv = ';xxx;Tomášová Míla;Svoboda ducha;31;Jana Bravencová;';

  var sheet = SpreadsheetApp.openByUrl('https://docs.google.com/spreadsheets/d/1Sgk5dTByTnUUzzQOAXDmkj5mwKl9F-Yb4e8LEIODAas/edit#gid=993345355').getSheetByName('__all');
  logi('sheet open');
  var row = csv.split(';');
  logi('row split done');
  sheet.appendRow(row);
  
}
