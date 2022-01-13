

function getUNIQUE(fileId, sheetName, columnName) {

  
  logi('---------------------------------------------getUNIQUE');
  logi(fileId);
  logi(sheetName);
  logi(columnName);
  



  var sheet = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
  var values = sheet.getDataRange().getValues();
  var cols = values[0];
  var columnLetter = columnToLetter(values[0], columnName);
  logi('columnLetter '  + columnLetter);

  var lastFreeLetter = getLastFreeLetter(cols);
  logi('lastFreeLetter '  + lastFreeLetter);

  sheet.getRange(lastFreeLetter+"1").setFormula("=UNIQUE("+ columnLetter + '1:' + columnLetter +")");

 

  var allCol = sheet.getRange(lastFreeLetter+":"+lastFreeLetter).getValues().map(([lastFreeLetter]) => [lastFreeLetter] );
  var uniqValues = new Set();

   for (var rowIx = 1; rowIx < allCol.length; rowIx++) {
     if (allCol[rowIx][0].toString() === '') break;
     uniqValues.add(allCol[rowIx][0]);
   }
  
  sheet.getRange(lastFreeLetter+"1").setFormula('');
  
  return   Array.from(uniqValues);
}

function columnToLetter(cols, columnName) {
  var tempIndex = cols.indexOf(columnName) % 26;
  var columnLetter =  String.fromCharCode(tempIndex + 65);
  return columnLetter;
}
function getLastFreeLetter(cols) {
  var tempIndex = cols.length % 26;
  var columnLetter =  String.fromCharCode(tempIndex + 65);
  return columnLetter;
}

function create_filterTest() {
  logClear();
  getUNIQUE('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'DailyNotes', 'title').forEach(f=>Logger.log(f))
}
