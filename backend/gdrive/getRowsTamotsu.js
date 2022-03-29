

function getRowsLastTam(fileId, sheetName, rowsCount) {
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  var fromNo =  Math.max( rowMax - rowsCount, 1) ;
  return getRowsFromTo(fromNo, rowMax, Agent);
  // ?action=getRowsLast&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw&sheetName=dailyNotes&rowsCount=3
}

function getRowsFirstTam(fileId, sheetName, rowsCount) {
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  
  var fromNo = row1;
  var toNo =   Math.min(rowMax, rowsCount) + 1; 

  logi('fromNo ' + fromNo );
  logi('toNo ' + toNo );
  return getRowsFromTo(fromNo, toNo, Agent);
  // ?action=getRowsFirst&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3
}


function getSheetTam(fileId, sheetName) {
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  
  var fromNo = row1;
  var toNo =   rowMax; 

  logi('fromNo ' + fromNo );
  logi('toNo ' + toNo );
  return getRowsFromTo(fromNo, toNo, Agent);
  // ?action=getRowsFirst&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3
}

function getRowsFromTo(fromNo, toNo, Agent){
  
  logi('from-to ' + fromNo + ' -- '+  toNo);

  var arr = [];
  for (var i = fromNo; i <= toNo; i++) {
    try{
      //var row = Agent.find(i);
      var row = Agent.all()[i];
      if (row == undefined) {continue;} 

      if (colsLastUsed.indexOf('dateinsert') > - 1) {
        var yyyyMMdd = row['dateinsert'].getFullYear() + '-'+row['dateinsert'].getMonth()+ '-'+row['dateinsert'].getDate();
        row['dateinsert'] = yyyyMMdd;
      }
      arr.push(row);
    }catch(e){
      logi('row i: ' + i + ' ' + e);
    }
  }
  return arr;
}
var row1 = 0; 
var rowMax;


function getAgent(fileId, sheetName) {
  Tamotsu.initialize(SpreadsheetApp.openById(fileId));
  var Agent = Tamotsu.Table.define({ sheetName: sheetName  });
  rowMax = Agent.all().length;
  return Agent;
}


//----------------------------------------------------------------------------------------test
function getTablistTest(){
    logClear();
    config.fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
    config.sheetName = 'tabsList';
    Logger.log(getSheetTam('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'tabsList'));
}


function getListSheetTest(){
    logClear();
    config.fileId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';
    config.sheetName = 'tabsList';
    Logger.log(getSheetTam('1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'hledaniList'));
}

function getRows_test() {
  config.fileId = '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw';
  config.sheetName = 'dailyNotes';
  config.rowsCount = 3;
  var values = getRowsLastTam(config.fileId, config.sheetName, config.rowsCount);
  //var values = getRowsFirstTam(config.fileId, config.sheetName, config.rowsCount);
  Logger.log(values);
  Logger.log( respond(responseDataTamotsu(values )));
  
}