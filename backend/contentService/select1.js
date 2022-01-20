


//-------------------------------------------------------------------select
function select1(fileId, sheetName, column,operator,value){
    return SQL.DB(fileId).TABLE(sheetName).SELECT('ALL').WHERE(column, operator, value).getVal();
}
function select1TestEQ(){
  Logger.log(select1(fileidDemo, 'elonX',  'Rampa', 'EQ', 'Florida'));
}

function select1Test_NotBocaCicaIsFlorida(){
  Logger.log(select1(fileidDemo, 'elonX', 'Rampa', '!=', 'Boca Chica'));
}

function select1Test_Contains(){
  Logger.log(select1(fileidDemo, 'elonX',  'Orbita / cíl', 'contains', 'ISS'));
}