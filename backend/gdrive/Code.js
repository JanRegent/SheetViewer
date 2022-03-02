

//?sheetName=elonX&action=getRowsLast&rowsCount=2&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA
//?action=logOn
function doGet(e) {
  if(getPar(e, 'action') != '') return paramsErr;
  var action = e.parameter.action.toString().toLowerCase();
  if (action == 'logon') {
    logOn_();
    logi(e.queryString);
    return respond('{action:logOn}');
  }  
  if (action == 'appendcsv') {
    logOn_();
    logi(e.queryString);
    logi( e.parameter.csv);
    appendCSV( e.parameter.csv);
    return respond('{action:appendCSV}');
    //?action=appendCSV&csv=;xxx;Tomášová Míla;Svoboda ducha;31;Jana Bravencová;
  }
  
  logi(e.queryString);
  if(getPar(e, 'fileId') != '')    return paramsErr; 
  if(getPar(e, 'sheetName') != '') return paramsErr; 

  try{
    return switchEndpoint(e);
  }catch(err){
    logi(err);
    respond('{error: \n " + '+err+' }');
  }
  
}

function switchEndpoint(e){
 
  var action = e.parameter.action.toString().toLowerCase();
  switch(action) {
    case "getlistsheet": //?sheetName=tabsList&action=getListSheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
      return respond(getListSheet()); 
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
      var values = getRowsLast(config.sheetIds.fileId, config.sheetIds.sheetName, config.rowsCount);
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
      return respond('{error: "Parameter Action has no expected value: " + '+action+' }');
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
    //config: config,
    rows: objectArray,
  });
  return output;
}
