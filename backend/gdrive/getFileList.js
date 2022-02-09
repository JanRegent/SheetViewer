var getFileListPars = {
  filelistSheet: null,
  filelistTitle: 'File list'
}

function getFileList(eParameters ){
  logi('----------------getFileList');
  try {
    epar2getFileList(eParameters['fileId'], eParameters['sheetName']);
  }catch{
    epar2getFileList(testSSid, 'testList');
  }

  var objectArray = [];
  

  var values = getFileListPars.filelistSheet.getDataRange().getValues();
  //Logger.log(JSON.stringify(values));

  var columns = values[0];
 

  var keyStartAt = 0;
  for (var i = 1; i < values.length; i++) {
    if (values[i][0] == '__key__') {
      keyStartAt = i;
      break;
    } 
    if (values[i][0] == '') continue;
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
      object[columns[j]] = values[i][j]
    }
    objectArray.push(object);
    
  }
 
  var keyval = getKeyValParams(values, keyStartAt);
  getFileListPars.filelistTitle = keyval['filelistTitle'];

  var output = JSON.stringify({
    filelistTitle: getFileListPars.filelistTitle,
    cols: columns,
    rows: objectArray,
  });
  Logger.log(output);
  return output;
}

function getKeyValParams(values, keyStartAt ){
  
  if (keyStartAt == 0)
    return {}

  var params = {} 

  for (var i = keyStartAt; i < values.length; i++) {
    
    var rowCells = [];
    for (var j = 1; j < values[i].length; j++) {
      if (values[i][j] != '')
        rowCells.push(values[i][j]);

    }
    params[values[i][0]] = rowCells;
          
  }
 
  return params;
}

function epar2getFileList(fileId, sheetName) {
  try {
    var spreadsheet = SpreadsheetApp.openById(fileId);
    getFileListPars.filelistSheet  = spreadsheet.getSheetByName(sheetName );
  }catch{
    var spreadsheet = SpreadsheetApp.openById('1aVOXBHhXJJsHeXFC4kVXZ2CJcV6sHPcIi1cBqxJi8jU');
    sheetName = 'testList';
    getFileListPars.filelistSheet  = spreadsheet.getSheetByName(sheetName);

  }

}


//----------------------------------------------------------------------------------------test
function getFileListTest(){

    //?fileid=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetname=bible21
    //?action=getfilelist&fileId=1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis&sheetName=spaceList
    getFileList();
}


