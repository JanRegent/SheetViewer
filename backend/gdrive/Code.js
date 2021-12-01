function respond(response) {  
  //Logger.log(response);
  return ContentService
  .createTextOutput(response)
  .setMimeType(ContentService.MimeType.JSON)
}

function doGet(e) {
 var v = PropertiesService.getScriptProperties().getProperties();
  logi('----------------------------------------------');
  if(typeof e.parameter.action === "undefined") {
    return respond('{error: "Parameter Action is not defined"}');
  }
  var action = e.parameter.action.toString().toLowerCase();
  logi('action: ' + action);

  switch(action) {
    case "gettabslist": //?action=gettabslist
      return respond(getTabsList(e.parameters)); 
    case "getfilelist":
      return respond(getFileList(e.parameters)); 
    case "getdatasheet":
      return respond(getdatasheet(e.parameters));        
    case "selectcontains":
      return respond(selectcontains()); 
    case "post":
      return respond(getTemp() );
    default:
      return respond('{error: "Parameter Action has no expected value"}');
  }
 
 
}
