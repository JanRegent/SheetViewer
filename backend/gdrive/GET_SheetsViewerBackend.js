

// ?action=getRowsLast&sheetName=hledaniList&fileId=1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo
// ?action=getRowsAll&sheetName=hledaniList&fileId=1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo
function doGet(e) {
  logClear();
  config.queryString = e.queryString;

  logi(e.queryString);

  if(getPar(e, 'action') != '')    return paramsErr; 
  if(getPar(e, 'fileId') != '')    return paramsErr; 
  if(getPar(e, 'sheetName') != '') return paramsErr; 

  if (e.parameter.action == 'getRowsLast')
    try{
      var values = getRowsLast1(config.fileId, config.sheetName, config.rowsCount);
      return responseDataTamotsu(values);
    }catch(err){
      logi(err);
      respond('{error: \n " + '+err+' }');
    }
  
    if (e.parameter.action == 'getRowsAll')
    try{
      var values = getRowsAll(config.fileId, config.sheetName);
      return responseDataTamotsu(values);
    }catch(err){
      logi(err);
      respond('{error: \n " + '+err+' }');
    }
}


function getPar(e, parName) {
  var err = '';
  switch(parName) {
    case "action": ``
      if(typeof e.parameter.action === "undefined") { 
        err = ('{error: "Parameter \'action\' is not defined"}');  logi(err);  
        return respond(err);
      }
    case "fileId": ``
      if(typeof e.parameter.fileId === "undefined") { 
        err = ('{error: "Parameter fileId is not defined"}');  logi(err);  
        return respond(err);
      }
      config.fileId = e.parameter.fileId;
      logi('fileId: ' + config.fileId);
      return '';
    case "sheetName":
      if(typeof e.parameter.sheetName === "undefined") { 
        err = ('{error: "Parameter sheetName is not defined"}'); logi(err);  
        return respond(err);
      }
      config.sheetName = e.parameter.sheetName;
      logi('sheetName: ' + config.sheetName);
      return '';

    default:
      return respond('{error: "Parameter not defined in getPar: " + '+parName+' }');
  }

}

//----------------------------------------------------------------------------------------getRowsLast1
function getRowsLast1(fileId, sheetName) {
  var listRows = getSheetTam(fileId, sheetName);
 
  var sheetRows = []
  for (var listIx = 0; listIx < listRows.length; listIx++) {
    var listRow = listRows[listIx];
    var Agent = getAgent(listRow['fileUrl'], listRow['sheetName'] );
    if (Agent == undefined) continue;
   
    sheetRow = {};
    sheetRow['aSheetName'] = listRow['sheetName'] ;
    sheetRow['row']  = getRowLast(Agent);
    sheetRow['aRowNo'] = sheetRow['row']['row_'];
    sheetRow['zfileId']  = SpreadsheetApp.openByUrl(listRow['fileUrl']).getId();

    sheetRows.push(sheetRow);
  }

  function getRowLast(Agent) {
    if (Agent == undefined) return {};
    return Agent.last();
  }

   return sheetRows;
}


function getRowsLast1byList_test() {
  Logger.log(getRowsLast1('1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo', 'hledaniList'));
}

//----------------------------------------------------------------------------------------getRowsAll
function getRowsAll(fileId, sheetName) {
  var Agent = getAgent(fileId,sheetName );
  if (Agent == undefined) return {};
  
  all = {};
  all['cols'] = Agent.columns();
  all['rows'] = Agent.all();
  
  return all;
}


function getRowsAll_test() {
  Logger.log(getRowsAll('1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo', 'hledaniList'));
}
