


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

//------------------------------------------------------------------------------------------------

function getSelect1Config(values) {

  config.selects1 = [];

  var rowIxStart = indexOfSectionRow('__select1__', values);
  if (rowIxStart == -1) return;
  var cols = values[rowIxStart]; 

  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0] != 'select1') continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;

    var select1Obj = {};
    select1Obj['endpoint']   =  'select1' ;
    select1Obj['column']   =  values[rowIx][cols.indexOf('column')] ;
    select1Obj['operator']   =  values[rowIx][cols.indexOf('operator')] ;
    select1Obj['value']   =  values[rowIx][cols.indexOf('value')] ;
    config.selects1.push(select1Obj);
  }

}



function getHeadersTest_ElonX() {
  logClear();
  getSelect1Config(getValuesConfig('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX__config__')  );
  Logger.log(config.selects1);
  // ?action=getSheetConfig&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=elonX
}
