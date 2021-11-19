
function getdatasheet(eParameters) {
  var sheet, sheetConfig;
  try {
    var sheetName = decodeURI(eParameters['sheetname']);
        logi(sheetName);

    if (sheetName.endsWith('__config__')) {
      var configSS = SpreadsheetApp.openById(eParameters['fileid']);
      var sheetConfig  = configSS.getSheetByName(sheetName );
      var config = getDataSheetConfig(sheetConfig );
  logi(config.url[0]);
  logi(config.sheetName[0])
      sheet  = SpreadsheetApp.openByUrl(config.url[0]).getSheetByName(config.sheetName[0]);
    }
    else {
      var dataSS = SpreadsheetApp.openById(eParameters['fileid']);
      sheet  = dataSS.getSheetByName(sheetName );
      sheetConfig  = dataSS.getSheetByName(sheetName+'__config__' );
    }

  }catch(e) {
    logi(e);
    var testSS = SpreadsheetApp.openById(contentId); 
    sheet  = testSS.getSheetByName('DemoSheet');
    sheetConfig  = testSS.getSheetByName('DemoSheet__config__' );

  }
  return getDataSheet2(sheet, sheetConfig);
}

function getDataSheet2(sheet, sheetConfig ){
  var objectArray = [];
  var config = getDataSheetConfig(sheetConfig);
  var values = sheet.getDataRange().getValues();
  logi(JSON.stringify(values));
  logi('values----------------A');
  var columns = values[0];
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
  Logger.log(output);

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

function getSheet__test2() {
  var ss = SpreadsheetApp.openById('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis');

  var sheetConfig = ss.getSheetByName('Launch Database__config__');

  var config = getDataSheetConfig(sheetConfig );

  Logger.log(config.url[0]);
  Logger.log(config.sheetName[0]);

  
  var sheet  = SpreadsheetApp.openByUrl(config.url[0]).getSheetByName(config.sheetName[0]);

  getDataSheet2(sheet, sheetConfig );
}