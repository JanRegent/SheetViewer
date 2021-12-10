
    var config = { 
        sheetName: '',
        fileId: '',

        copyrightUrl: '',
        sheetUrl: '',

        columnsSelected: [],
        selects1: [],
        __ver__: '0'
      }

function getConfig_(fileId, sheetName ){

  logi('getConfig_(fileId, sheetName )');
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
    logi(JSON.stringify(config));
    return config;
  }

  //-------------------------------------------------------------------cofig exists
  //---------------------------------------------------------fileId, sheetName
  var values = sheetConfig.getDataRange().getValues();
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
  //-------------------------------------------------func
  var selects1Arr = [];
  function select1Add(rowIxCurr) {

    function removeLabel(array, label){
      const index = array.indexOf(label);
      if (index > -1) {
        array.splice(index, 1);
      }
      return array;
    }

    var selectObj = {};
    if (values[rowIxCurr][1] !== '')
      selectObj['columnsSelected'] = removeLabel(values[rowIxCurr], 'select1');
    selectObj['where'] = removeLabel(values[rowIxCurr+1], 'where');
    selects1Arr.push(selectObj); 
  }

  function getLabelArr(rowIx){
    var rowCellsArr = [];
    for (var j = 1; j < values[rowIx].length; j++) {
      if (values[rowIx][j] != '')
        rowCellsArr.push(values[rowIx][j]);

    }
    return rowCellsArr;
  }


 //---------------------------------------------------------other pars than fileId, sheetName 
   if( config.columnsSelected == [])  
    config.columnsSelected = getCols(config.fileId, config.sheetName);


  for (var rowIx = 0; rowIx < values.length; rowIx++) {

    if (values[rowIx][0] == '') continue;
    if (values[rowIx][0] == 'sheetName') continue;
    if (values[rowIx][0] == 'fileId') continue;

    if (values[rowIx][0] == 'select1') {
      select1Add(rowIx);
      rowIx = rowIx + 1;
      continue;
    }

    if (values[rowIx][0] == 'columnsSelected' ) {
      config.columnsSelected = getLabelArr(rowIx);
      continue;
    }

    //
    var rowCells = [];
    for (var j = 1; j < values[rowIx].length; j++) {
      if (values[rowIx][j] != '')
        rowCells.push(values[rowIx][j]);

    }
    if (rowCells.length > 1) //lists-arr
      config[values[rowIx][0]] = rowCells;
    else
      config[values[rowIx][0]] = rowCells[0]; //Strings-->Urls..
        
  }
  //---------------------------------------------------columnsSelected in selects
  config.selects1 = selects1Arr;
  for (var rowIx = 0; rowIx < config.selects1.length; rowIx++) {
  if (config.selects1[rowIx].columnsSelected === undefined) 
    config.selects1[rowIx]['columnsSelected'] = config.columnsSelected;
  }
  config.__ver__ = 'defined/final';
  logi('config defined/final');
  logi(JSON.stringify(config));
  return config;
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
