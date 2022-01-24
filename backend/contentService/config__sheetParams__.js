
function getSheetParams(values) {

  config.sheetParams = {};

  var rowIxStart = indexOfSectionRow('__sheetParams__', values);
  if (rowIxStart == -1) return;

  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;
    
    config.sheetParams[values[rowIx][0]]   =  values[rowIx][1] ;
  }


}



function getSheetParamsTest_ElonX() {
  logClear();
  getSheetParams(getValuesConfig('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX__config__')  );
  Logger.log(config.headers);
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
