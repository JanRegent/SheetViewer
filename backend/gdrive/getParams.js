oParams = {}
paramsErr = '';

function getPar(e, parName) {

  switch(parName) {
    case "action": //?action=gettabslist
      if(typeof e.parameter.action === "undefined") { paramsErr = respond('{error: "Parameter Action is not defined"}');  return paramsErr}
      oParams['action'] = e.parameter.action;
      return '';
    case "fileId": 
      if(typeof e.parameter.fileId === "undefined") { paramsErr = respond('{error: "Parameter fileId is not defined"}');  return paramsErr}
      oParams['fileId'] = e.parameter.fileId;
      logi('fileId: ' + oParams.fileId);
      return '';
    case "sheetName":
      if(typeof e.parameter.sheetName === "undefined") { paramsErr = respond('{error: "Parameter sheetName is not defined"}');  return paramsErr}
      oParams['sheetName'] = e.parameter.sheetName;
      logi('sheetName: ' + oParams.sheetName);
      return '';
    case "rowsCount":
      if(typeof e.parameter.rowsCount === "undefined") { paramsErr = respond('{error: "Parameter rowsCount is not defined"}');  return paramsErr}
      oParams['rowsCount'] = e.parameter.rowsCount;
      logi('rowsCount: ' + oParams.rowsCount);
      return '';   
    case "getLast":
      return '';
    case "getAll":
      return '';                 
    case "getsheetconfig":
      return '';           
    case "selectcontains":
      return '';
    case "post":
      return '';
    default:
      return respond('{error: "Parameter Action has no expected value: " + '+action+' }');
  }

}

function responseData(values){
  var columns = SQL.getColsLastUsed();
  Logger.log(columns);
  var objectArray = [];
  for (var i = 0; i < values.length; i++) {
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
      object[columns[j]] = values[i][j]
    }
    Logger.log(object);
    objectArray.push(object);   
  }
 
  var output = JSON.stringify({
    cols: columns,
    config: config,
    rows: objectArray,
  });
  return output;
}
