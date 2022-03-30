function doPost(e) {
  logClear();
  if(typeof e !== 'undefined')
  logi(e.parameter);
  var values = getSheetTam(e.parameter.fileId, e.parameter.fileId.sheetName );
  return ContentService.createTextOutput(JSON.stringify(values))
}

function postTest() {
  Logger.log(doPost());
}
