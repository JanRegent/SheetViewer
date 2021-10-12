

function getFileList(filelistSheet ){
  var objectArray = [];
  

  var values = filelistSheet.getDataRange().getValues();
  //Logger.log(JSON.stringify(values));

  var columns = values[0];
  //Logger.log(columns);

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
  

  var output = JSON.stringify({
    filelistTitle: keyval['filelistTitle'],
    cols: columns,
    rows: objectArray,
  });
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


