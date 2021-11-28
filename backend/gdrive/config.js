  function getConfig_(fileId, sheetName ){
  
    var config = { 
        sheetName: sheetName,
        fileId: fileId,

        copyrightUrl: '',
        sheetUrl: '',

        columnsSelected: [],
        selects1: [],
        __ver__: '0'
      }

    if (sheetName == null) {
        config.sheetName = sheetName;
        config.fileId =  fileId;
        config.__ver__ = 'sheetName == null';
        return config;
    }

    try {
      var sheetConfig;
      if (sheetName.endsWith('__config__'))
        sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
      else
        sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName+'__config__' );  


      //--------------------------------------------------------------------config NO exists
      if (sheetConfig === undefined) {
        config.sheetName = sheetName;
        config.fileId =  fileId;
        config.__ver__ = 'undefined';
        return config;
      }
      //--------------------------------------------------------------------config exists
    
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

    }catch(_) {
      config.sheetName = sheetName;
      config.fileId =  fileId;
      config.__ver__ = 'catch';
      return config;
    }

  var selectArr = [];
  function getSelect1(rowIxCurr) {

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
    selectArr.push(selectObj); 
  }

  function getLabelArr(rowIx){
    var rowCellsArr = [];
    for (var j = 1; j < values[rowIx].length; j++) {
      if (values[rowIx][j] != '')
        rowCellsArr.push(values[rowIx][j]);

    }
    return rowCellsArr;
  }

  
  //-----------------------------------------------------------others pars 
  for (var rowIx = 0; rowIx < values.length; rowIx++) {
    
    if (values[rowIx][0] == '') continue;
    if (values[rowIx][0] == 'sheetName') continue;
    if (values[rowIx][0] == 'fileId') continue;

    if (values[rowIx][0] == 'select1') {
      getSelect1(rowIx);
      rowIx = rowIx + 1;
      continue;
    }

    if (values[rowIx][0] == 'columnsSelected' ) {
      config.columnsSelected = getLabelArr(rowIx);
      continue;
    }


    var rowCells = [];
    for (var j = 1; j < values[rowIx].length; j++) {
      if (values[rowIx][j] != '')
        rowCells.push(values[rowIx][j]);

    }
    config[values[rowIx][0]] = rowCells;
          
  }
  //---------------------------------------------------columnsSelected in selects
  //cols    
  var sheet  = SpreadsheetApp.openById(config.fileId).getSheetByName(config.sheetName);
  Logger.log(sheet.getName());
  var cols = sheet.getDataRange().getValues()[0];
  Logger.log(cols);
  if( config.columnsSelected == [])  
    config.columnsSelected = cols;
  config.selects1 = selectArr;
  for (var rowIx = 0; rowIx < config.selects1.length; rowIx++) {
    if (config.selects1[rowIx].columnsSelected === undefined) 
      config.selects1[rowIx]['columnsSelected'] = config['columnsSelected'];
  }
  config.__ver__ = 'defined/final';
  return config;
}


function getConfig_test() {
  Logger.log(getConfig_("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw" ,"DailyNotes"));
}

function getConfig_test__config() {
  Logger.log(getConfig_("1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis" ,"Launch Database__config__"));
}
