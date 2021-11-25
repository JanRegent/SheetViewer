function selectContains(fileId, sheetName) {
  var sheetTemp = SpreadsheetApp.getActive().getSheetByName('__temp__');
  sheetTemp.clear();
  var sheet = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
  var values = sheet.getDataRange().getValues();
  sheetTemp.appendRow(values[0]);

  //=Query(IMPORTRANGE("1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA" ,"DailyNotes!A:D"),"SELECT Col1 WHERE Col1 contains 'ego' ")
  var sheetUrl = 'Query(IMPORTRANGE("' + fileId + '"';
  var sheetRange = ',"' + sheetName + '!A:A"' ;
  var sel = ',"SELECT Col1 WHERE Col1 contains \'ego\' ';
  sheetTemp.getRange('A2').setFormula(sheetUrl +  sheetRange +')' + ',"SELECT Col1 WHERE Col1 contains \'ego\' ")'  );

  
  return getTemp();
}

function selectContainsTest(){
  return selectContains("1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA" ,"DailyNotes");
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
  
  Logger.log(values.length);
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
  Logger.log(output);

  return output;
}