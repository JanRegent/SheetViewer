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