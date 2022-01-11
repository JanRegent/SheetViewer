


function responseData(values){
  var columns = SQL.getColsLastUsed();
  Logger.log(columns);
  var objectArray = [];
  for (var i = 0; i < values.length; i++) {
    var object = {}
    for (var j = 0; j < values[i].length; j++) {
      object[columns[j]] = values[i][j]
    }
    Logger.log(object);
    objectArray.push(object);   
  }
 
  var output = JSON.stringify({
    cols: columns,
    config: config,
    rows: objectArray,
  });
  return output;
}
