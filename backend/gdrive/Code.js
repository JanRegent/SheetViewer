

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

  const dateiInsertIndex = columns.indexOf('dateinsert');
  var objectArray = [];

  if (values != undefined) {
    for (var i = 0; i < values.length; i++) {
      // var object = {}
      // for (var j = 0; j < values[i].length; j++) {
      //   if (i != dateiInsertIndex){
      //     object['"'+columns[j]+'"'] = '"'+values[i][j] + '"';
      //   }
      //   else {
      //     object['"'+columns[j]+'"'] = '"'+ vanillaToDateOnlyIso8601(values[i][j]) + '"';
      //   }
      // }

      //objectArray.push(object);   
      Logger.log(values[i][dateiInsertIndex]);

    }
  }
  var output = JSON.stringify({
    cols: columns,
    config: config,
    rows: objectArray,
  });
  
}

function vanillaToDateOnlyIso8601(date) {
  // month May has zero-based index 4
  //const date = new Date(2014, 4, 11);

  const yyyy = date.getFullYear();
  const mm = String(date.getMonth() + 1).padStart(2, "0"); // month is zero-based
  const dd = String(date.getDate()).padStart(2, "0");

  if (yyyy < 1583) {
    // TODO: decide how to support dates before 1583
    //throw new Error(`dates before year 1583 are not supported`);
    return '';
  }

  const formatted = `${yyyy}-${mm}-${dd}`;
  return formatted;
}

