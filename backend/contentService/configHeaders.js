
function getHeaders(fileId, sheetName) {
  var sheetConfig = SpreadsheetApp.openById(fileId).getSheetByName(sheetName+'__config__' );  
   var values = sheetConfig.getDataRange().getValues();

  var headersArr = [];

  for (var rowIx = 0; rowIx < values.length; rowIx++) {
    var headersObj ={};
    if (values[rowIx][0] == 'headers') {
      var arr =values[rowIx].slice(2, values[rowIx].length);  
      var arr2  = arr.filter(element => { //only valid cells
          return element !== null && element !== undefined && element !== '';
        });
      headersObj['"' + values[rowIx][1]+ '"']   =  '"' + arr2.join('__|__') + '"';
      config.headers.push(headersObj);
    }      
  }

}

function listMap(maparr) {

  logi('*************keys=values');
  for (const [key, value] of maparr) {
    logi(key + ' = ' + value)
  }
}

function listObj(maparr) {

  logi('*************obj');
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
