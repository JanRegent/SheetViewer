
//?action=getRowsLast&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX&rowsCount=2
function doGet(e) {
  try{
    var v = PropertiesService.getScriptProperties().getProperties();
    logClear();
    if(getPar(e, 'action') != '') return paramsErr;
    var action = e.parameter.action.toString().toLowerCase();
    logi('action: ' + action);

    if(getPar(e, 'fileId') != '')    return paramsErr; 
    if(getPar(e, 'sheetName') != '') return paramsErr; 
    getConfig_(config.fileId, config.sheetName);

    return switchEndpoints(action, e);
    
  }catch(err){
      respond('{error: \n' + err + '}');  
  }  
}

function switchEndpoints(endpoint, e) {

  switch(endpoint) {
    case "logon": //?action=gettabslist
      logOn_();
      return respond('{action:logOn}');
    case "gettabslist": //?action=gettabslist
      return respond(getTabsList(e.parameters)); 
    case "getfilelist":
      return respond(getFileList(e.parameters));                 
    case "getsheetconfig":
      return respond(getsheetconfig(e.parameters));            
    case "selectcontains":
      return respond(selectcontains()); 
    case "post":
      return respond(getTemp() );
    //--------------------------------------------------------
     case "getcolumnvaluesuniq":
      if(getPar(e, 'column') != '') return paramsErr; 
      var values = getColumnValuesUniq(config.fileId, config.sheetName, config.column);
      return respond(responseData(undefined));
      //test ?action=getColumnValuesUniq&fileId=1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M&sheetName=endpoints&column=endpoint
    case "getrowslast":
      if(getPar(e, 'rowsCount') != '') return paramsErr; 
      var values = getRowsLast(config.fileId, config.sheetName, config.rowsCount);
      return respond(responseData(values));
      //test ?action=getRowsLast&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3
    case "select1":
      if(getPar(e, 'column') != '') return paramsErr; 
      if(getPar(e, 'operator') != '') return paramsErr; 
      if(getPar(e, 'value') != '') return paramsErr; 
      logi(config);
      var values = select1(config.fileId, config.sheetName, config.column,config.operator,config.value);
      return respond(responseData(values));
    default:
      return respond('{error: "Parameter endpoint has no expected value: " + '+endpoint+' }');
  }
}

function respond(response) {  
  //Logger.log(response);
  //listObj(config.getRows, 'resp');
  return ContentService
  .createTextOutput(response)
  .setMimeType(ContentService.MimeType.JSON)
}



function responseData(values){
  var columns = SQL.getColsLastUsed();

  var objectArray = [];

  if (values != undefined) {
    for (var i = 0; i < values.length; i++) {
      var object = {}
      for (var j = 0; j < values[i].length; j++) {
        object[columns[j]] = values[i][j]
      }

      objectArray.push(object);   
    }
  }
  var output = JSON.stringify({
    cols: columns,
    config: config,
    rows: objectArray,
  });
  return output;
}
