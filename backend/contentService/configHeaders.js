
function getHeaders(fileId, sheetName) {
  config.headers = [];
  var sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName+'__config__' );  
   var values = sheetConfig.getDataRange().getValues();

  const keys = new Set();

  for (var rowIx = 0; rowIx < values.length; rowIx++) {
    var headersObj ={};
    if (values[rowIx][0] == 'headers') {
      var arr =values[rowIx].slice(2, values[rowIx].length);  
      var arr2  = arr.filter(element => { //only valid cells
          return element !== null && element !== undefined && element !== '';
        });
      var key =   values[rowIx][1];
      headersObj[key]   =   arr2.join('__|__') ;
      if (! keys.has(key) ) 
        config.headers.push(headersObj);
      keys[key] = key;  
    }      
  }
  Logger.log(config.headers);

}

function listMap(maparr) {

  logi('*************keys=values');
  for (const [key, value] of maparr) {
    logi(key + ' = ' + value)
  }
}

function listObj(maparr, mess) {

  logi('*************obj ' + mess);
  for (const item of maparr) {
    logi(item);
  }
}

function getHeadersTest_ElonX() {
  logClear();
  var headers = getHeaders('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX'  );
  logi(JSON.stringify(headers));
   // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
