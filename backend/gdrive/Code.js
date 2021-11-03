function respond(response) {  
  return ContentService
  .createTextOutput(response)
  .setMimeType(ContentService.MimeType.JSON)
}

function doGet(e) {
 var v = PropertiesService.getScriptProperties().getProperties();
  
  if(typeof e.parameter.action === "undefined") {
    return respond('{error: "Parameter Action is not defined"}');
  }
  var action = e.parameter.action.toString().toLowerCase();
  //?action=getdatasheet

  switch(action) {
    case "getdatasheet":
      return respond(getDataSheet(e.parameters));     
   case "getfilelist":
      return respond(getFileList(e.parameters)); 
      break;
    default:
      return respond('{error: "Parameter Action has no expected value"}');
  }
 
 
}
