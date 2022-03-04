//?sheetName=tabsList&action=getSheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
function getSheet(fileId, sheetName){
  var listSheet;
  try {
    var spreadsheet = SpreadsheetApp.openById(fileId);
    listSheet  = spreadsheet.getSheetByName(sheetName);
  }catch(e){
    logi(JSON.stringify(e));
    var output = JSON.stringify({
      cols: [],
      rows: [],
    });
    return output;
  }

  var objectArray = [];
  
  var values = listSheet.getDataRange().getValues();

  var columns = values[0].join(',').split(',');
  columns[0] = columns[0];
  columns[columns.length-1] = columns[columns.length-1] ;
  
  for (var i = 1; i < values.length; i++) {
    if (values[i][0] == '') continue;
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
       object[columns[j]] = values[i][j];
    }
    objectArray.push(object);
    
  }
 
  var output = JSON.stringify({
    cols: columns,
    rows: objectArray,
  });
  return output;
}



//----------------------------------------------------------------------------------------test
function getTablistTest(){
    logClear();
    config.sheetIdent.fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
    config.sheetIdent.sheetName = 'tabsList';
    Logger.log(getSheet('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'tabsList'));
}


function getListSheetTest(){
    logClear();
    config.sheetIdent.fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
    config.sheetIdent.sheetName = 'tabsList';
    Logger.log(getSheet('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'hledaniList'));
}