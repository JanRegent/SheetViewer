paramsErr = '';

var config = { 
  sheetName: '',
  fileId: '',
  fileUrl: '',
  copyrightUrl: '',

  headers:  '',
  getRows: "getRowsLast--rowsCount__|__10__EOL__getRowsFirst--rowsCount__|__10",
  
  selects1: '',

  columnsSelected: '',
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
  var err = '';
  switch(parName) {
    case "action": //?action=gettabslist
      if(typeof e.parameter.action === "undefined") {err = '{error: "Parameter [Action] is not defined"}'; logi(err); return respond(err); }
      config.action = e.parameter.action;
      return '';
    case "fileId": ``
      if(typeof e.parameter.fileId === "undefined") { err = ('{error: "Parameter fileId is not defined"}');  logi(err);  return respond(err);}
      config.fileId = e.parameter.fileId;
      config.fileId = e.parameter.fileId;
      logi('fileId: ' + config.fileId);
      return '';
    case "sheetName":
      if(typeof e.parameter.sheetName === "undefined") { err = ('{error: "Parameter sheetName is not defined"}'); logi(err);  return respond(err);}
      config.sheetName = e.parameter.sheetName;
      config.sheetName = e.parameter.sheetName;
      logi('sheetName: ' + config.sheetName);
      return '';
    case "rowsCount":
      if(typeof e.parameter.rowsCount === "undefined") { err = ('{error: "Parameter rowsCount is not defined"}');  logi(err);  return respond(err);}
      config.rowsCount = e.parameter.rowsCount;
      logi('rowsCount: ' + config.rowsCount);
      return '';   
    case "column":
      if(typeof e.parameter.column === "undefined") { err = ('{error: "Parameter column is not defined"}');  logi(err);  return respond(err);}
      config.column = e.parameter.column;
      logi('column: ' + config.column);
      return '';  
    case "operator":
      if(typeof e.parameter.operator === "undefined") { err = ('{error: "Parameter operator is not defined"}');  logi(err);  return respond(err);}
      config.operator = e.parameter.operator;
      logi('operator: ' + config.operator);
      return '';  
    case "value":
      if(typeof e.parameter.value === "undefined") { err = ('{error: "Parameter value is not defined"}');  logi(err);  return respond(err);}
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