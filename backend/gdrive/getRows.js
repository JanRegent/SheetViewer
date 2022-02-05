
function getRowsConfig(valuesConfig) {

  config.getRows = [];

  var rowIxStart = indexOfSectionRow('__getRows__', valuesConfig);
  if (rowIxStart == -1) return;
  var cols = valuesConfig[rowIxStart]; 

  for (var rowIx = rowIxStart+1; rowIx < valuesConfig.length; rowIx++) {
    if (valuesConfig[rowIx][0] == '')        continue;
    if (valuesConfig[rowIx][0].substring(0,2) == '//') continue;
    if (valuesConfig[rowIx][0].substring(0,2) == '__') break;

    var getRowsObj ={};
    var endpoint = valuesConfig[rowIx][0];
    switch(endpoint) {

      case "getRowsLast": 
        getRowsObj['endpoint'] = 'getRowsLast';
        getRowsObj['rowsCount'] = valuesConfig[rowIx][cols.indexOf('rowsCount')];
        break;
      case "getRowsFirst":
        getRowsObj['endpoint'] = 'getRowsFirst';
        getRowsObj['rowsCount'] = valuesConfig[rowIx][cols.indexOf('rowsCount')];
        break;
      case "getRowsPage":
        getRowsObj['endpoint'] = 'getRowsPage';
        getRowsObj['startRow'] = valuesConfig[rowIx][cols.indexOf('startRow')];
        getRowsObj['endRow'] = valuesConfig[rowIx][cols.indexOf('endRow')];
        break;
    }
    if (getRowsObj.endpoint == undefined)  continue;
    config.getRows.push(getRowsObj);
  }
}



function getRowsTest_ElonX() {
  logClear();
  getRowsConfig(getValuesConfig('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX__config__')  );
  Logger.log(config.getRows);
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}


//********************************************************************************old */

//-------------------------------------------------------------------getRowsAll

function getRowsAll(fileId, sheetName){
  return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').getVal();
}
function getRowsAllTestALL(){
  Logger.log(getRowsAll(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa']));
}


//-------------------------------------------------------------------getRowsLast
function getRowsLast(fileId, sheetName, rowsCount){
  var allrows = SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').getVal();
  var lastRows = allrows.slice(Math.max(allrows.length - rowsCount, 1));
  logi(lastRows.length);
  return lastRows;

}

function getRowsLastTest(){
  var values = getRowsLast(fileidDemo, 'elonX', 2);
  Logger.log(responseData(values)); 
}

