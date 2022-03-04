
//-------------------------------------------------------------------getRowsLast
// ?action=getRowsLast&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3
function getRowsLast(fileId, sheetName, rowsCount){
  var allrows = getValues(fileId, sheetName);
  var lastRows = allrows.slice(Math.max(allrows.length - rowsCount, 1));
  return lastRows;

}

function getRowsLastTest(){
  logClear();
  var values = getRowsLast('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes', 2);
  Logger.log(responseData(values)); 
}


function getValues(fileId, sheetName) {
  var spreadsheet = SpreadsheetApp.openById(fileId);
  var sheet  = spreadsheet.getSheetByName(sheetName);
  var values = sheet.getDataRange().getValues();
  colsLastUsed = values[0];
  return values;
}

function getValuesTest() {

  var values = getValues('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes');
}
