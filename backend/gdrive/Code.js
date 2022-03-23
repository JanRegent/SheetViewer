

//?sheetName=elonX&action=getRowsLast&rowsCount=2&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA
//?action=logOn
function doGet(e) {
  
  config.queryString = e.queryString;

  if(getPar(e, 'action') != '') return paramsErr;
  var action = e.parameter.action.toString().toLowerCase();
  logOn_();
  if (action == 'logon') {
    logi(e.queryString);
    
    return respond('{action:logOn}');
  }  
  if (action == 'appendcsv') {
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
    case "getsheet": 
      //?sheetName=tabsList&action=getsheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
      //?sheetName=hledaniList&action=getsheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
      return respond(getSheet(config.fileId, config.sheetName)); 
    case "getsheetconfig":
      return respond(getsheetconfig(e.parameters['fileId'][0], e.parameters['sheetName'][0]));            
    case "getrowslast":
      if(getPar(e, 'rowsCount') != '') return paramsErr; 
      var values = getRowsLast(config.fileId, config.sheetName, config.rowsCount);
      return respond(responseData(values));
      //test ?action=getRowsLast&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3
    case "getrowsfirst":
      if(getPar(e, 'rowsCount') != '') return paramsErr; 
      var values = getRowsFirst(config.fileId, config.sheetName, config.rowsCount);
      return respond(responseData(values));
      //test ?action=getRowsFirst&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3

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


var colsLastUsed;

function responseData(values){
  var columns = colsLastUsed;

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
