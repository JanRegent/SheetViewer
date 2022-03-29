  
function getSheetIdent(values) {

  config.headers = [];

  var rowIxStart = indexOfSectionRow('__sheetIdent__', values);
  if (rowIxStart == -1) return;
  var cols = values[rowIxStart].slice(1, values[rowIxStart].length); 
  const keys = new Set();

  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;

    var varName = values[rowIx][0].trim().toLowerCase();
    switch (varName)  {
        case "sheetname":
            config.sheetName = values[rowIx][1];
            break;
        case "fileid":
            config.fileId = values[rowIx][1];
            break;
        case "fileurl":
            config.fileUrl = values[rowIx][1];
            break;
        case "copyrighturl":
            config.copyrightUrl = values[rowIx][1];
            break;
    }
    
  }


}



function getIdentTest_dailyNotesConfig() {
  logClear();
  getSheetIdent(getValuesConfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__')  );
  logi(JSON.stringify(config));
    Logger.log(config);
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
