

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
  if (fileId == null) return undefined;
  var ss; 
  if (fileId.substring(0,4) === 'http' )  
    ss = SpreadsheetApp.openByUrl(fileId);
  else
    ss = SpreadsheetApp.openById(fileId);

  Tamotsu.initialize(ss);
  var Agent = Tamotsu.Table.define({ sheetName: sheetName  });
  rowMax = Agent.all().length;
  return Agent;
}

function url2fileid( url) {
  if (url.substring(0, 'https://docs.'.length)  == 'https://docs.') return url;
  var fileid = url.replaceAll('https://docs.google.com/spreadsheets/d/', '');
  fileid = fileid.substring(0, fileid.indexOf('/'));
  return fileid;
}

//----------------------------------------------------------------------------------------
function getRowsLast1quote(fileId, sheetName) {
  var rows = getSheetTam(fileId, sheetName);
  var arr = []
  for (var i = 0; i < rows.length; i++) {
    var row = {}
    var Agent = getAgent(rows[i]['fileUrl'], rows[i]['sheetName'] );
    if (Agent == undefined) continue;
    var lastRow = Agent.last()
    var quoteColumn = rows[i]['quoteColumn'];
    if (quoteColumn == '') continue;
    row['quote'] = lastRow[quoteColumn];
    row['fileUrl'] = rows[i]['fileUrl'];
    row['sheetName'] = rows[i]['sheetName'];
    arr.push(row);
  }
  return arr;
  // ?action=getRowsLast&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw&sheetName=dailyNotes&rowsCount=3
}

//----------------------------------------------------------------------------------------test
function getRowsLast1byList_test() {
  Logger.log(getRowsLast1byList('https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=179495500', 'hledaniList'));
}

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