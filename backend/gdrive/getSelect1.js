function getSelect1byIndex(fileId, sheetName, index) {
  var config  = getConfig_(fileId,sheetName );

Logger.log(config.selects1[index].where)
  var column = config.selects1[index].where[0];
  operator   = config.selects1[index].where[1];
  value      = config.selects1[index].where[2];

  return getSelect1(fileId, sheetName, column, operator, value);

}


function getSelect1(fileId, sheetName, column, operator, value) {

  
  
  logi(fileId);
  logi(sheetName);
  logi(column);
  logi(operator);
  logi(value);

  var sheetTemp = SpreadsheetApp.getActive().getSheetByName('__temp__');
  if (!sheetTemp) ss.insertSheet('__temp__');
  logi('3');
  sheetTemp.clear();



  var sheet = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
  var values = sheet.getDataRange().getValues();
    var cols = values[0];
  
  //=Query(IMPORTRANGE("1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA" ,"DailyNotes!A:D"),"SELECT Col1 WHERE Col1 contains 'ego' ")
  var sheetUrl = 'Query(IMPORTRANGE("' + fileId + '"';

  
  var lastLetter = getA1Notation(0, cols.indexOf(cols[cols.length-1]));
  lastLetter = lastLetter.substr(0,lastLetter.length-1);
  var sheetRange = ',"' + sheetName + '!A:'+lastLetter+'"' ;

  var allcols = '';
  for (var i = 0; i < cols.length; i++) {
    allcols = allcols + 'Col'+ (i+1) + ','
  }
  allcols = allcols.substring(0,allcols.length-1);

  var colIndex = cols.indexOf(column) + 1;
  var col = 'Col' + colIndex.toString();
  var sel = ',"SELECT ' + allcols +' WHERE '+ col +' '+operator+' \''+value+'\' ';
  logi(sel);
  sheetTemp.getRange('A1').setFormula(sheetUrl +  sheetRange +')' + sel + ' ")'  );

  
  return getTemp();
}

function selectContainsTest(){
  return getSelect1("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw" ,"DailyNotes", 'cesky', 'contains', 'Filozof');
}

function selectByIndexTest(){
  return getSelect1byIndex("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw" ,"DailyNotes", 1);
}

//holds processing of next script till last one has completed
function testWait(){
  var lock = LockService.getScriptLock(); lock.waitLock(30000); 
  SpreadsheetApp.flush(); lock.releaseLock();
}


function getTemp(){

  var sheet = SpreadsheetApp.getActive().getSheetByName('__temp__');

  var objectArray = [];

  var values = sheet.getDataRange().getValues();

  var columns = values[0];
  
  for (var i = 0; i < values.length; i++) {
    var object = {}
     for (var j = 0; j < values[i].length; j++) {
      object[columns[j]] = values[i][j]
    }
    objectArray.push(object);   
  }
 
 
  var output = JSON.stringify({
    cols: columns,
    //columnsSelected: config['columnsSelected'],
    //sheetUrl: sheetUrl,
    rows: objectArray,
  });
  //Logger.log(output);

  return output;
}


//--------------------------------------------------------------------A1notations letter
/**
 *
 * @param {number} row - The row number of the cell reference. Row 1 is row number 0.
 * @param {number} column - The column number of the cell reference. A is column number 0.
 * @returns {string} Returns a cell reference as a string using A1 Notation
 *
 * @example
 *
 *   getA1Notation(2, 4) returns "E3"
 *   getA1Notation(2, 4) returns "E3"
 *
 */
const getA1Notation = (row, column) => {
  const a1Notation = [`${row + 1}`];
  const totalAlphabets = "Z".charCodeAt() - "A".charCodeAt() + 1;
  let block = column;
  while (block >= 0) {
    a1Notation.unshift(
      String.fromCharCode((block % totalAlphabets) + "A".charCodeAt())
    );
    block = Math.floor(block / totalAlphabets) - 1;
  }
  return a1Notation.join("");
};