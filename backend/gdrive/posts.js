function doPost(e) {
  logClear();
 logi("I was called")
  if(typeof e !== 'undefined')
 logi(e.parameter);
  // var ss= SpreadsheetApp.openById("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw")
  // var sheet = ss.getSheetByName()
  //sheet.getRange(1, 1).setValue(JSON.stringify(e))
  var values = getSheetTam("1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw", "booksNo" );
  return ContentService.createTextOutput(JSON.stringify(values))
}

function postTest() {
  Logger.log(doPost());
}
