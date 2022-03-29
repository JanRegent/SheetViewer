
function getValues(fileId, sheetName) {
  var spreadsheet = SpreadsheetApp.openById(fileId);
  var sheet  = spreadsheet.getSheetByName(sheetName);
  var values = sheet.getDataRange().getValues();
  colsLastUsed = values[0];
  return values;
}

function getValuesTest() {

  var values = getValues('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes');
  Logger.log(values);
}
