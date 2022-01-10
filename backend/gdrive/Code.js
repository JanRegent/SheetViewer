  function respond(response) {  
  //Logger.log(response);
  return ContentService
  .createTextOutput(response)
  .setMimeType(ContentService.MimeType.JSON)
}

function doGet(e) {
 var v = PropertiesService.getScriptProperties().getProperties();
  logi('----------------------------------------------');
  if(getPar(e, 'action') != '') return paramsErr;
  var action = e.parameter.action.toString().toLowerCase();
  logi('action: ' + action);

  if(getPar(e, 'fileId') != '')    return paramsErr; 
  if(getPar(e, 'sheetName') != '') return paramsErr; 


  switch(action) {
    case "logon": //?action=gettabslist
      logOn_();
      return respond('{action:logOn}');
    case "gettabslist": //?action=gettabslist
      return respond(getTabsList(e.parameters)); 
    case "getfilelist":
      return respond(getFileList(e.parameters)); 
    case "getdatasheet":
      return respond(getdatasheet(e.parameters));    
    case "getLast":
      return respond(getdatasheet(e.parameters, 'getLast')); 
    case "getAll":
      return respond(getdatasheet(e.parameters, 'getAll'));                 
    case "getsheetconfig":
      return respond(getsheetconfig(e.parameters));            
    case "selectcontains":
      return respond(selectcontains()); 
    case "post":
      return respond(getTemp() );
    //--------------------------------------------------------
    case "getrowslast":
      if(getPar(e, 'rowsCount') != '') return paramsErr; 
      var values = getRowsLast(oParams.fileId, oParams.sheetName, oParams.rowsCount);
      return respond(responseData(values));
      //test ?action=getRowsLast&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3

    default:
      return respond('{error: "Parameter Action has no expected value: " + '+action+' }');
  }
  
}
