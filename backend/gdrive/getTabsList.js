
function getTabsList(eParameters ){

  var tabslistSheet;
  try {
    logi(eParameters['fileid']);
    var spreadsheet = SpreadsheetApp.openById(eParameters['fileid']);
    tabslistSheet  = spreadsheet.getSheetByName(eParameters['sheetname'] );
  }catch{
    var spreadsheet = SpreadsheetApp.openById('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis');
    tabslistSheet  = spreadsheet.getSheetByName('tabsList');

  }
  logi('opened sheet: ' + tabslistSheet.getName());
  var objectArray = [];
  

  var values = tabslistSheet.getDataRange().getValues();
  //Logger.log(JSON.stringify(values));

  var columns = values[0].join('","').split(',');
  columns[0] = '"' + columns[0];
  columns[columns.length-1] = columns[columns.length-1] + '"';
 Logger.log(columns);
  var keyStartAt = 0;
  for (var i = 1; i < values.length; i++) {
    if (values[i][0] == '') continue;
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
       object[columns[j]] = '"'  + values[i][j] + '"' ;
    }
    objectArray.push(object);
    
  }
 
  var output = JSON.stringify({
    "cols": columns,
    "rows": objectArray,
  });
  Logger.log(output);
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
function getTabListTest(){

    //?sheetName=tabsList&action=gettabslist&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
    getTabsList();
}


