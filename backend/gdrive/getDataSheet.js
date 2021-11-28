
function getdatasheet(eParameters) {
  var sheet, config;
  try {
    var sheetName = decodeURI(eParameters['sheetname']);

    if (sheetName.endsWith('__config__')) {
      config  = getConfig_(eParameters['fileid'],sheetName);
      sheet  = SpreadsheetApp.openByUrl(config.url[0]).getSheetByName(config.sheetName[0]);
    }
    else {
      var dataSS = SpreadsheetApp.openById(eParameters['fileid']);
      sheet  = dataSS.getSheetByName(sheetName );
      config  = getConfig_(eParameters['fileid'],sheetName );
    }

  }catch(e) {
    logi(e);
    var testSS = SpreadsheetApp.openById(contentId); 
    sheet  = testSS.getSheetByName('DemoSheet');
    config  = getConfig_(contentId,'DemoSheet' );

  }
  return getDataSheet2(sheet, config);
}

function getDataSheet2(sheet, config){
  var objectArray = [];

 Logger.log(config);

  var values = sheet.getDataRange().getValues();

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
    config: config,
    rows: objectArray,
  });
  Logger.log(output);

  return output;
}



function getSheet__test_DemoSheet() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getActiveSheet();
  getdatasheet();

}

function getSheet__test2__config() {

  var config = getConfig_('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'Launch Database__config__' );
  
  var sheet  = SpreadsheetApp.openById(config.fileId).getSheetByName(config.sheetName);

  getDataSheet2(sheet, config );
}

function getSheet__test3temp() {
 
  var config = getConfig_('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis','__temp__' );

  var tempUrl = 'https://docs.google.com/spreadsheets/d/1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis/edit#gid=575489284';
  
  var sheet  = SpreadsheetApp.openByUrl(tempUrl).getSheetByName('__temp__');

  getDataSheet2(sheet, config);
}