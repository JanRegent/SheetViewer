function getsheetconfig(fileId, sheetName){
  logi('---------------------------------------------getsheetconfig')
  logi(fileId);
  logi(sheetName);
  
  var configValues = getValuesConfig(fileId,sheetName) ;
  logi(configValues.length.toString());
  getSheetIdent(configValues); 
  getHeaders(configValues); 
  getSelect1(configValues); ;
  listObj(config.headers, 'headers ');
  listObj(config.getRows, 'getRows ');
  listObj(config.selects1, 'selects1 ');
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
