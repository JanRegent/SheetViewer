var SQL = new gSQL();
var fileidDemo = '1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA';


//-------------------------------------------------------------------select
function select1(fileId, sheetName, columnsSet, column,operator,value){
  if (columnsSet.length == 0)
    return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).getVal();
  return SQL.DB(fileId).TABLE(sheetName).SELECT(columnsSet).WHERE(column, operator, value).getVal();
}
function select1Test(){
  Logger.log(select1(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa'], 'Rampa', '=', 'Boca Chica'));
}
function select1Test_AllColumns(){
  Logger.log(select1(fileidDemo, 'elonX', [], 'Rampa', '=', 'Boca Chica'));
}
function select1Test_AllColumnsNotBocaCicaIsFlorida(){
  Logger.log(select1(fileidDemo, 'elonX', [], 'Rampa', '!=', 'Boca Chica'));
}

function select1Test_Contains(){
  Logger.log(select1(fileidDemo, 'elonX', [], 'Orbita / cíl', 'contains', 'ISS'));
}

//-------------------------------------------------------------------selectAnd
function selectAnd(fileId, sheetName, columnsSet, column,operator,value, column2,operator2,value2){
  if (columnsSet.length == 0)
    return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).AND(column2, operator2, value2).getVal();
  return SQL.DB(fileId).TABLE(sheetName).SELECT(columnsSet).WHERE(column, operator, value).AND(column2, operator2, value2).getVal();
}
function selectAndTest(){
  Logger.log(selectAnd(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa'], 'Rampa', '=', 'Florida', 'Orbita / cíl', '=', 'GTO'));
}
function selectAndTest_AllColumns(){
  Logger.log(selectAnd(fileidDemo, 'elonX', [], 'Rampa', '=', 'Florida', 'Orbita / cíl', '=', 'GTO'));
}

//-------------------------------------------------------------------selectOr
function selectOr(fileId, sheetName, columnsSet, column,operator,value, column2,operator2,value2){
  if (columnsSet.length == 0)
    return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).OR(column2, operator2, value2).getVal();
  return SQL.DB(fileId).TABLE(sheetName).SELECT(columnsSet).WHERE(column, operator, value).OR(column2, operator2, value2).getVal();
}
function selectOrTest(){
  Logger.log(selectOr(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa'], 'Rampa', '=', 'Florida', 'Orbita / cíl', '=', 'GTO'));
}
function selectOrTest_AllColumns(){
  Logger.log(selectOr(fileidDemo, 'elonX', [], 'Rampa', '=', 'Florida', 'Orbita / cíl', '=', 'GTO'));
}

//-------------------------------------------------------------------getRowsAll
function getRowsAll(fileId, sheetName, columnsSet){
  return SQL.DB(fileId).TABLE(sheetName).SELECT(columnsSet).getVal();
}
function getRowsAllTest(){
  Logger.log(getRowsAll(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa']));
}

function getRowsAll(fileId, sheetName){
  return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').getVal();
}
function getRowsAllTestALL(){
  Logger.log(getRowsAll(fileidDemo, 'elonX', ['Mise', 'Orbita / cíl', 'Rampa']));
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


