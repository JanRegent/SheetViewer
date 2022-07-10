

//?sheetName=hledaniList&fileId=1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo

function doGet(e) {
  logClear();
  config.queryString = e.queryString;

  logi(e.queryString);

  if(getPar(e, 'fileId') != '')    return paramsErr; 
  if(getPar(e, 'sheetName') != '') return paramsErr; 

  try{
    var values = getRowsLast1(config.fileId, config.sheetName, config.rowsCount);
    return responseDataTamotsu(values);
  }catch(err){
    logi(err);
    respond('{error: \n " + '+err+' }');
  }
  
}


function getPar(e, parName) {
  var err = '';
  switch(parName) {
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

//----------------------------------------------------------------------------------------getRowsLast1quote
function getRowsLast1(fileId, sheetName) {
  var listRows = getSheetTam(fileId, sheetName);
 
  var sheetRows = []
  for (var listIx = 0; listIx < listRows.length; listIx++) {
    var listRow = listRows[listIx];
    var Agent = getAgent(listRow['fileUrl'], listRow['sheetName'] );
    if (Agent == undefined) continue;
   
    sheetRow = {};
    sheetRow['aSheetName'] = listRow['sheetName'] ;
    sheetRow['row']  = getRow(Agent);
    sheetRow['aRowNo'] = sheetRow['row']['aRowNo'];
    sheetRow['zfileId']  = SpreadsheetApp.openByUrl(listRow['fileUrl']).getId();

    sheetRows.push(sheetRow);
  }

  function getRow(Agent) {
    if (Agent == undefined) return {};
    var cols = Agent.columns();
    logi(cols);
    var lastRow = Agent.last()
    var row = {};
    for (var colIx = 0; colIx < cols.length; colIx++) {
      row[cols[colIx]] = lastRow[cols[colIx]];
      row['aRowNo'] = lastRow['row_'];
    }
    logi(row);
    return row;
  }


  colsLastUsed.push('quote');
  return sheetRows;
  // ?sheetName=hledaniList&fileId=1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo
}

//----------------------------------------------------------------------------------------test
function getRowsLast1byList_test() {
  Logger.log(getRowsLast1('1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo', 'hledaniList'));
}

