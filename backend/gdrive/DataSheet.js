

function getDataSheet(sheet, sheetConfig ){
  var objectArray = [];
  var config = getDataSheetConfig(sheetConfig);

  var values = sheet.getDataRange().getValues();
  //Logger.log(JSON.stringify(values));

  var columns = values[0];
  //Logger.log(columns);


   for (var i = values.length - 5; i < values.length; i++) {
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
      object[columns[j]] = values[i][j]

    }
    objectArray.push(object);
    
  }
 
 
  var output = JSON.stringify({
    cols: columns,
    columnsSelected: config['columnsSelected'],
    columnsDetailView: config['columnsDetailView'],
    rows: objectArray,
  });
 //Logger.log(output);
  return output;
}

function getDataSheetConfig(sheetConfig ){
  
  try {
    var values = sheetConfig.getDataRange().getValues();
  }catch(_) {
    //no__sheet__config__
    return {configState: 'no__sheet__config__'}  
  }

  var values = sheetConfig.getDataRange().getValues();
  var params = {} 
  for (var i = 0; i < values.length; i++) {
    
    var rowCells = [];
    for (var j = 1; j < values[i].length; j++) {
      if (values[i][j] != '')
        rowCells.push(values[i][j]);

    }
    params[values[i][0]] = rowCells;
          
  }
 
  return params;
}

function getSheet__test() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getActiveSheet();


  getDataSheet('', sheet);

}
