function getsheetconfig(fileId, sheetName){
  logi('---------------------------------------------getsheetconfig')
  logi(fileId);
  logi(sheetName);
  
  var configValues = getValuesConfig(fileId,sheetName) ;
  logi(configValues.length.toString());
  getSheetIdent(configValues); 
  config.headers  = getLabelParams(configValues, '__headers__', 'headers' ); 
  config.selects1 = getLabelParams(configValues, '__select1__', 'select1' ); 
 
  return JSON.stringify(config);
}

function getConfig2test_config_DailyNotes() {
  logClear();

  getsheetconfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__'  );


  listObj(config.headers, 'headers ');
  listObj(config.getRows, 'getRows ');
  listObj(config.selects1, 'selects1 ');

  Logger.log(config);

  // 
  // ?sheetName=dailyNotes&action=getSheetConfig&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw
}

function headersTest_dailyNotesConfig() {
  logClear();
  var configValues = getValuesConfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__') ;
  config.headers = getLabelParams(configValues, '__headers__', 'headers'); 
  Logger.log(config.headers);
}
function selects1Test_dailyNotesConfig() {
  logClear();
  var configValues = getValuesConfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__') ;
  config.selects1 = getLabelParams(configValues, '__select1__', 'select1' ) ;  
  Logger.log(config.selects1);
}


function getLabelParams(values, headerLabel, columnAlabel) {

  config.headers = [];

  var rowIxStart = indexOfSectionRow(headerLabel, values);
  if (rowIxStart == -1) return;
  
  var list = [];
  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {

    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0] != columnAlabel) continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;

    
    var arr =values[rowIx].slice(1, values[rowIx].length);  

    if (arr.length == 0)  conrinue;

    list.push(arr.join('__|__'));
    
  }
  return list.join('__EOL__');

}