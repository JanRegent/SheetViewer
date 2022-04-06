

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
  logi('callback: ' + e.parameter.callback);
  config.callback = e.parameter.callback;
  var action = e.parameter.action.toString().toLowerCase();
  switch(action) {
    case "getsheet": 
      //?sheetName=tabsList&action=getsheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
      //?sheetName=hledaniList&action=getsheet&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
      return responseDataTamotsu(getSheetTam(config.fileId, config.sheetName)); 
    case "getsheetconfig":
      return respond(getsheetconfig(e.parameters['fileId'][0], e.parameters['sheetName'][0]));            
    case "getrowslast":
      if(getPar(e, 'rowsCount') != '') return paramsErr; 
      var values = getRowsLastTam(config.fileId, config.sheetName, config.rowsCount);
      return responseDataTamotsu(values);
      //test ?action=getRowsLast&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw&sheetName=dailyNotes&rowsCount=10
    case "getrowsfirst":
      if(getPar(e, 'rowsCount') != '') return paramsErr; 
            logi(config);
      var values = getRowsFirstTam(config.fileId, config.sheetName, config.rowsCount);
      return responseDataTamotsu(values);
      //test ?action=getRowsFirst&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw&sheetName=dailyNotes&rowsCount=3

    case "getrowslast1quote":
      var values = getRowsLast1quote(config.fileId, config.sheetName, config.rowsCount);
      return responseDataTamotsu(values);
      //test ?action=getRowsLast1quote&fileId=1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo&sheetName=hledaniList

    default:
      return respond('{error: "Parameter Action has no expected value: " + '+action+' }');
  }
}


var colsLastUsed;

function responseDataTamotsu(values){
  var output = JSON.stringify({
    cols: colsLastUsed,
    config: config,
    rows: values,
  });

  if (config.callback == undefined) {
    return ContentService
      .createTextOutput(output)
      .setMimeType(ContentService.MimeType.JSON)
 
  }
  return ContentService
    .createTextOutput(config.callback + "(" + output+ ")")
    .setMimeType(ContentService.MimeType.JAVASCRIPT);
    //?sheetName=hledaniList&action=getsheet&callback=getSheetData&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis
  
}




//---------------------------------------------2del

function responseData(values){
  var output = JSON.stringify({
    cols: columns,
    config: config,
    rows: values,
  });
  
}


function respond(response) {  
  //Logger.log(response);
  //listObj(config.getRows, 'resp');
  return ContentService
  .createTextOutput(response)
  .setMimeType(ContentService.MimeType.JSON)
}

