paramsErr = '';

var config = { 
  sheetName: '',
  fileId: '',

  getRows:  [],
  getRows:  [],
  selects1: [],

  copyrightUrl: '',
  sheetUrl: '',

  columnsSelected: [],
  __ver__: '0',
  action: '',
  rowsCount: 10
}

function indexOfSectionRow(sectionName, values) {
  for (var rowIx = 0; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == sectionName) return rowIx;
  }  
  return -1;  
}


function indexOfSectionRow_test(){
  var values =  getValuesConfig('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA','elonX__config__');  
  Logger.log(['__headers__',passTestEQint(3,indexOfSectionRow('__headers__', values))]);
  Logger.log(['__getRows__', passTestEQint(7, indexOfSectionRow('__getRows__', values))]);
  Logger.log(['__select1__', passTestEQint(12, indexOfSectionRow('__select1__', values))]);
  
}

function getValuesConfig(fileId, sheetName){
  var sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName);  
  var values = sheetConfig.getDataRange().getValues();
  if (values == undefined) return [];
  return values;
}

function passTestEQint(expectedInt, func) {

  if (expectedInt == func) return 'pass';
  return fail;

}

//-----------------------------------------------------------------------------------------------doGet(e) check params

function getPar(e, parName) {

  switch(parName) {
    case "action": //?action=gettabslist
      if(typeof e.parameter.action === "undefined") { paramsErr = respond('{error: "Parameter [Action] is not defined"}');  return paramsErr}
      config.action = e.parameter.action;
      return '';
    case "fileId": 
      if(typeof e.parameter.fileId === "undefined") { paramsErr = respond('{error: "Parameter fileId is not defined"}');  return paramsErr}
      config.fileId = e.parameter.fileId;
      logi('fileId: ' + config.fileId);
      return '';
    case "sheetName":
      if(typeof e.parameter.sheetName === "undefined") { paramsErr = respond('{error: "Parameter sheetName is not defined"}');  return paramsErr}
      config.sheetName = e.parameter.sheetName;
      logi('sheetName: ' + config.sheetName);
      return '';
    case "rowsCount":
      if(typeof e.parameter.rowsCount === "undefined") { paramsErr = respond('{error: "Parameter rowsCount is not defined"}');  return paramsErr}
      config.rowsCount = e.parameter.rowsCount;
      logi('rowsCount: ' + config.rowsCount);
      return '';   
    case "column":
      if(typeof e.parameter.column === "undefined") { paramsErr = respond('{error: "Parameter column is not defined"}');  return paramsErr}
      config.column = e.parameter.column;
      logi('column: ' + config.column);
      return '';  
    case "operator":
      if(typeof e.parameter.operator === "undefined") { paramsErr = respond('{error: "Parameter operator is not defined"}');  return paramsErr}
      config.operator = e.parameter.operator;
      logi('operator: ' + config.operator);
      return '';  
    case "value":
      if(typeof e.parameter.value === "undefined") { paramsErr = respond('{error: "Parameter value is not defined"}');  return paramsErr}
      config.value = e.parameter.value;
      logi('value: ' + config.value);
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
      return respond('{error: "Parameter not defined in getPar: " + '+parName+' }');
  }

}