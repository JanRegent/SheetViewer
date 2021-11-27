  function getConfig_(fileId, sheetName ){
  
  try {
    var sheetConfig;
    if (sheetName.endsWith('__config__'))
      sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
    else
      sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName+'__config__' );  

    var sheet  = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);
    var cols = sheet.getDataRange().getValues()[0];
  }catch(_) {
    //no__sheet__config__
    return {configState: 'no__sheet__config__'}  
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

  var values = sheetConfig.getDataRange().getValues();
  var configObj = {} 
  for (var rowIx = 0; rowIx < values.length; rowIx++) {
    
    if (values[rowIx][0] == '') continue;
    if (values[rowIx][0] == 'select1') {
      getSelect1(rowIx);
      rowIx = rowIx + 1;
      continue;
    }

    var rowCells = [];
    for (var j = 1; j < values[rowIx].length; j++) {
      if (values[rowIx][j] != '')
        rowCells.push(values[rowIx][j]);

    }
    configObj[values[rowIx][0]] = rowCells;
          
  }
  //-------------------------------------columnsSelected in select
  if( configObj['columnsSelected'] === undefined)  
    configObj['columnsSelected'] = cols;
  configObj['selects1'] = selectArr;
  for (var rowIx = 0; rowIx < configObj.selects1.length; rowIx++) {
    if (configObj.selects1[rowIx].columnsSelected === undefined) 
      configObj.selects1[rowIx]['columnsSelected'] = configObj['columnsSelected'];
  }

  return configObj;
}


function getConfig_test() {
  Logger.log(getConfig_("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw" ,"DailyNotes"));
}

function getConfig_test__config() {
  Logger.log(getConfig_("1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis" ,"Launch Database__config__"));
}
