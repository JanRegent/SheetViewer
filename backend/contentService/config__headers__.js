
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

    var headersObj ={};
    var arr =values[rowIx].slice(2, values[rowIx].length);  
    var arr2  = arr.filter(element => { //only valid cells
        return element !== null && element !== undefined && element !== '';
      });
    if (arr.length == 0)  conrinue;

    var headerName =   values[rowIx][cols.indexOf('headerName')+1];
    headersObj[headerName]   =   arr2.join('__|__') ;
    if (! keys.has(headerName) ) 
      config.headers.push(headersObj);
    keys[headerName] = headerName;  
  }


}



function getHeadersTest_ElonX() {
  logClear();
  var headers = getHeaders(getValuesConfig('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX__config__')  );
  logi(JSON.stringify(headers));
    Logger.log(config.getRows);
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
