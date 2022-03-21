
function getHeaders(values) {

  config.headers = [];

  var rowIxStart = indexOfSectionRow('__headers__', values);
  if (rowIxStart == -1) return;
  var cols = values[rowIxStart].slice(1, values[rowIxStart].length); 
  const keys = new Set();

  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0] != 'headers') continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;

    
    var arr =values[rowIx].slice(1, values[rowIx].length);  

    if (arr.length == 0)  conrinue;

    config.headers.push('headerName:'+arr.join('__|__'));
  }


}



function getHeadersTest_dailyNotesConfig() {
  logClear();
  var headers = getHeaders(getValuesConfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__')  );
  logi(JSON.stringify(headers));
    Logger.log(config.headers);
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
