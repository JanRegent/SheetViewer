//?sheetName=tabsList&action=getListSheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
function getListSheet(){
  var listSheet;
  try {
    var spreadsheet = SpreadsheetApp.openById(config.sheetIds.fileId);
    listSheet  = spreadsheet.getSheetByName(config.sheetIds.sheetName);
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

function getKeyValParams(values, keyStartAt ){
  
  if (keyStartAt == 0)
    return {}

  var params = {} 

  for (var i = keyStartAt; i < values.length; i++) {
    
    var rowCells = [];
    for (var j = 1; j < values[i].length; j++) {
      if (values[i][j] != '')
        rowCells.push(values[i][j]);

    }
    params[values[i][0]] = rowCells;
          
  }
 
  return params;
}


//----------------------------------------------------------------------------------------test
function getListSheetTest(){
    logClear();
    config.sheetIds.fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
    config.sheetIds.sheetName = 'tabsList';
    logi(config);
    getListSheet();
}


