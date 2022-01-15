
function getdatasheet(eParameters, getLastAll) {
  var sheet, config;

  try {
    var sheetName = decodeURI(eParameters['sheetName']);

    if (sheetName.endsWith('__config__')) {
      config  = getConfig_(eParameters['fileId'],sheetName);
      sheet  = SpreadsheetApp.openByUrl(config.url[0]).getSheetByName(config.sheetName[0]);
      logi('dataSSUrl from __config__')
      logi(config.url[0]);
    }
    else {
      var dataSS = SpreadsheetApp.openById(eParameters['fileId']);
      logi('dataSSUrl')
      logi(dataSS.getUrl());
      sheet  = dataSS.getSheetByName(sheetName );
      config  = getConfig_(eParameters['fileId'],sheetName );
    }

  }catch(e) {
    logi(e);
    var testSS = SpreadsheetApp.openById(contentId); 
    logi('testUrl')
    logi(testSS.getUrl());
    sheet  = testSS.getSheetByName('DemoSheet');
    config  = getConfig_(contentId,'DemoSheet' );


  }

  return getDataSheet2(sheet, config, getLastAll);
}

function getDataSheet2(sheet, config, getLastAll){
  var objectArray = [];

  logi('sheetname: ' + sheet.getName().toString() );

  var values = sheet.getDataRange().getValues();

  var columns = values[0];
  var rowStart = values.length - 10;
  if (getLastAll === undefined) rowStart = values.length - 10;
  if (getLastAll === 'getLast') rowStart = values.length - 10;
  if (getLastAll === 'getAll')  rowStart = 1;
  if (rowStart< 1) rowStart = 1;
  //last5
  for (var i = rowStart; i < values.length; i++) {
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
      object[columns[j]] = values[i][j]
    }
    objectArray.push(object);   
  }
 
  var output = JSON.stringify({
    cols: columns,
    config: config,
    rows: objectArray,
  });
  
  logi('rows: ' + objectArray.length);
  logi(output.toString());
  return output;
}



function getSheet__test_DemoSheet() {
  logClear();
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getActiveSheet();
  getdatasheet();

}

function getSheet__test2__config() {
  logClear();
  var config = getConfig_('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'Launch Database__config__' );
  
  var sheet  = SpreadsheetApp.openById(config.fileId).getSheetByName(config.sheetName);

  getDataSheet2(sheet, config );
}

function getSheet__apidoc__config() {
  logClear();
  var config = getConfig_('1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M', 'getRowsLast' );
  
  var sheet  = SpreadsheetApp.openById(config.fileId).getSheetByName(config.sheetName);

  getDataSheet2(sheet, config );
}


function getSheet__test3temp() {
  logClear();
  var config = getConfig_('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis','__temp__' );

  var tempUrl = 'https://docs.google.com/spreadsheets/d/1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis/edit#gid=575489284';
  
  var sheet  = SpreadsheetApp.openByUrl(tempUrl).getSheetByName('__temp__');

  getDataSheet2(sheet, config);
}