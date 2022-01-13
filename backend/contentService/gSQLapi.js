var SQL = new gSQL();
var fileidDemo = '1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA';


//-------------------------------------------------------------------select
function select1(fileId, sheetName, column,operator,value){
    return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).getVal();
}
function select1Test(){
  Logger.log(select1(fileidDemo, 'elonX',  'Rampa', '=', 'Boca Chica'));
}

function select1Test_NotBocaCicaIsFlorida(){
  Logger.log(select1(fileidDemo, 'elonX', 'Rampa', '!=', 'Boca Chica'));
}

function select1Test_Contains(){
  Logger.log(select1(fileidDemo, 'elonX',  'Orbita / cíl', 'contains', 'ISS'));
}

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
  var allrows = SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').getVal()
  return allrows.slice(Math.max(allrows.length - rowsCount, 1));

}

function getRowsLastTest(){
  var values = getRowsLast(fileidDemo, 'elonX', 2);
  Logger.log(responseData(values)); 
}


//-------------------------------------------------------------------columns
function getColumnValuesUniq(fileId, sheetName, columnName) {
  var allCol = SQL.DB(fileId).TABLE(sheetName).SELECT(columnName).getVal();  
  var uniqValues = new Set();

   for (var rowIx = 1; rowIx < allCol.length; rowIx++) {
     if (allCol[rowIx].toString() === '') break;
     uniqValues.add(allCol[rowIx]);
   }
  
  
  return   Array.from(uniqValues);
 
}

function getColumnValuesTest(){
  Logger.log(getColumnValuesUniq(fileidDemo, 'elonX', 'Rampa'));
}


