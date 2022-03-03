
function getSheetIdent(values) {

  config.sheetIdent = {};

  var rowIxStart = indexOfSectionRow('__sheetIdent__', values);
  Logger.log(rowIxStart);
  if (rowIxStart == -1) return;

  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;
    
    config.sheetIdent[values[rowIx][0]]   =  values[rowIx][1] ;
  }


}



function getSheetParamsTest_DailyNotes() {
  logClear();
  getSheetIdent(getValuesConfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__')  );
  Logger.log(config.sheetIdent);
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
