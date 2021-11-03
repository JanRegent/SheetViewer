function myFunction() {
  var ss = SpreadsheetApp.openById('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw');
  var sheet = ss.getSheetByName('dailyNotes');
  //var data = sheet.getDataRange().getValues();
  const query = SheetQuery.sheetQuery(ss)
  .from('dailyNotes')
  //.where((row) => row.cesky.startsWith('Ego'))
  .where((row) => row.cesky.endsWith('ego.'))
  //.where((row) => row.cesky.includes('Ego'))
  const data = query.getRows();
  //Logger.log(data);


  for (var i = 1; i < data.length; i++) {
      Logger.log(data[i]);
  }
}


