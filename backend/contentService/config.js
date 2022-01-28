

function getsheetconfig(eParameters){
  logClear();
  getConfig_(eParameters['fileId'][0], eParameters['sheetName'][0]);
   
  logi(eParameters['fileId'][0]);
  logi(eParameters['sheetName'][0]);
  Logger.log(config.sheetParams);
  listObj(config.headers, 'headers ');
  listObj(config.getRows, 'getRows ');
  listObj(config.selects1, 'selects1 ');

  return JSON.stringify(config);
}


function getConfig2test_config_ElonX() {
  logClear();
  getConfig_('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX'  );

  Logger.log(config.sheetParams);
  listObj(config.headers, 'headers ');
  listObj(config.getRows, 'getRows ');
  listObj(config.selects1, 'selects1 ');


  // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}


function getConfig_(fileId, sheetName ){


  if (fileId == undefined || fileId == null || fileId == ''  ) {config.__ver__ = '__wrong__fileId'; return config;}
  if (sheetName == undefined || sheetName == null || sheetName == ''  ){config.__ver__ = '__wrong__sheetName';return config;}

  var sheetConfig;

    if (sheetName.endsWith('__config__'))
      sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
    else
      sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName+'__config__' );  

    //-------------------------------------------------------------------cofig NO exists
  if (sheetConfig == null)   {
    config.sheetName = sheetName;
    config.fileId =  fileId; //backend input
    if (whatAmI(fileId).name == 'Array' ) config.fileId =  fileId[0]; //e.parameters
    config.columnsSelected = getCols(config.fileId, config.sheetName);
    config.__ver__ = '__wrong__config__NotExist';
    logi('config __wrong__config__NotExist');
    return config;
  }
logi(sheetConfig.getName());
  //-------------------------------------------------------------------cofig exists
  //---------------------------------------------------------fileId, sheetName
  var values = sheetConfig.getDataRange().getValues();
  getSheetParams(values);
  getHeaders(values);
  getRowsConfig(values);
  getSelect1Config(values);
 
  for (var rowIx = 0; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '') continue;
    if (values[rowIx][0] == 'sheetName') {
      config.sheetName = values[rowIx][1];  
      continue;
    }
    if (values[rowIx][0] == 'fileId') {
      config.fileId = values[rowIx][1];  
      continue;
    }
      
  }
 
  config.__ver__ = 'defined/final';


}

function getCols(fileId, sheetName ){
  var sheet  = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
  return sheet.getDataRange().getValues()[0];
}

function getConfig_test_wrong() {
  Logger.log(getConfig_());
  Logger.log(getConfig_(''));
  Logger.log(getConfig_('t1'));

}



function getConfig_test_config_NOexists() {
  logClear();
  Logger.log(getConfig_('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'DemoSheetNoConfig'));
}

function getConfig_test_config_DemoSheet() {
  Logger.log(getConfig_('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'DemoSheet'));
}

function getConfig_test_DailyNotes() {
  Logger.log(getConfig_("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw" ,"DailyNotes"));
}

function getConfig_test__config() {
  Logger.log(getConfig_("1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis" ,"Launch Database__config__"));
}
