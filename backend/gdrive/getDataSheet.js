
function getdatasheet(eParameters) {
  try {
    logi(eParameters['fileid']);
    var spreadsheet = SpreadsheetApp.openById(eParameters['fileid']);
    var sheetName = decodeURI(eParameters['sheetname']);
    logi('encoded sheetname: ' + sheetName);
    sheet  = spreadsheet.getSheetByName(sheetName );
  }catch{
    var spreadsheet = SpreadsheetApp.openById(contentId); 
    sheet  = spreadsheet.getSheetByName('DemoSheet');

  }
  logi('opened sheet: ' + sheet.getName());
  return getDataSheet2(sheet);
}

function getDataSheet2(sheet, sheetConfig ){
  var objectArray = [];
  var config = getDataSheetConfig(sheetConfig);

  var values = sheet.getDataRange().getValues();
  logi(JSON.stringify(values));

  var columns = values[0];
  Logger.log(columns);

    //last5
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
  logi(output);
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


  getdatasheet();

}
