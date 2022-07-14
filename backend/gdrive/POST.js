function doPost(e) {

  
  var json = e.postData.contents
  var data = JSON.parse(json)
  var updateList = data['updateList'];
  if (updateList !=  undefined ) {
    return responseDataTamotsu(postUpdatedList(updateList));  
  }


  responseDataTamotsu('error: nothing to return \n input data: \n ' + data.toString());

}

function postUpdatedList(updateList) {

  var sheetRows = [];
  for (var i = 0; i < updateList.length; i++) {
    var rows = getRestRows(updateList[i]);
    if (rows.length == 0) continue;
    for (var j = 0; j < rows.length; j++) {
      sheetRows.push(rows[j]);
    }
  }
  return sheetRows;
 
}

function getRestRows(updateListRow) {
  if (updateListRow == undefined) return [];

  logi(updateListRow);
  var fileId = updateListRow['fileId'];
  var sheetName = updateListRow['sheetName'];
  var rowsCount = updateListRow['rowsCount'];
  
  var dataRows = getSheetRestRows(fileId, sheetName, rowsCount);

  if (dataRows == undefined)  return [];
  if (dataRows.length == 0) return [];

  var restRowsMap = [];
  for (var i = 0; i <= dataRows.length; i++) {
    if (dataRows[i] == undefined) continue;
    if (dataRows[i] == null) continue;
    var sheetRow = {};
    sheetRow['fileId'] = fileId;
    sheetRow['sheetName'] = sheetName;
    sheetRow['rowsCountFrom'] = rowsCount;
    sheetRow['row'] = dataRows[i];

    restRowsMap.push(sheetRow);

  }
  return restRowsMap;

}

var testList =  [{fileId: '1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', sheetName: 'elonX', rowsCount: 76},
{fileId: '1lELOq9fAHCGci4hqJSU8rLiEgPO5f57JPDlzn4nwtTk', sheetName: 'Launch Database',       
rowsCount: 128}, {fileId: '17enEpgqTms0R2Yw2tg8l1BgTmoQEVErHIlxbQWrKc3s', sheetName: 'Sheet1',      
rowsCount: 21}, {fileId: '1Gr-Qs8H-MJaVyEttN41kJxkqiLKayt9qxXSDzs6-qk8', sheetName: 'Neptune',     
rowsCount: 40}];

function updateList___test() {
  logClear();
  //logi(getUpdatedList(testList))
  Logger.log(postUpdatedList(testList));
}