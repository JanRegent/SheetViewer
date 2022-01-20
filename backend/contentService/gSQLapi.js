var SQL = new gSQL();
var fileidDemo = '1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA';


//-------------------------------------------------------------------selectAnd
function selectAnd(fileId, sheetName, column,operator,value, column2,operator2,value2){
    return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).AND(column2, operator2, value2).getVal();
}
function selectAndTest(){
  Logger.log(selectAnd(fileidDemo, 'elonX', 'Rampa', '=', 'Florida', 'Orbita / cíl', '=', 'GTO'));
}


//-------------------------------------------------------------------selectOr
function selectOr(fileId, sheetName, column,operator,value, column2,operator2,value2){
  return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).OR(column2, operator2, value2).getVal();
}
function selectOrTest(){
  Logger.log(selectOr(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa'], 'Rampa', '=', 'Florida', 'Orbita / cíl', '=', 'GTO'));
}

//-------------------------------------------------------------------getRowsAll

function getRowsAll(fileId, sheetName){
  return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').getVal();
}
function getRowsAllTestALL(){
  Logger.log(getRowsAll(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa']));
}


//-------------------------------------------------------------------getRowsLast
function getRowsLast(fileId, sheetName, rowsCount){
  var allrows = SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').getVal();
  var lastRows = allrows.slice(Math.max(allrows.length - rowsCount, 1));
  logi(lastRows.length);
  return lastRows;

}

function getRowsLastTest(){
  var values = getRowsLast(fileidDemo, 'elonX', 2);
  Logger.log(responseData(values)); 
}


//-------------------------------------------------------------------columns
function getColumnValuesUniq(fileId, sheetName, columnName) {
  var allCol = SQL.DB(fileId).TABLE(sheetName).SELECT(columnName).getVal();  
  var uniqValues = new Set();

   for (var rowIx = 0; rowIx < allCol.length; rowIx++) {
     if (allCol[rowIx].toString() === '') break;
     uniqValues.add(allCol[rowIx]);
     logi(allCol[rowIx]);
   }
   config['columnValuesUniq'] = Array.from(uniqValues);
  
  
 
}
// ?action=getColumnValuesUniq&fileId=1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M&sheetName=endpoints&column=endpoint

function getColumnValuesTest(){
  Logger.log(getColumnValuesUniq(fileidDemo, 'elonX', 'Rampa'));
}


