

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
        try {
          var yyyyMMdd = row['dateinsert'].getFullYear() + '-'+row['dateinsert'].getMonth()+ '-'+row['dateinsert'].getDate();
          row['dateinsert'] = yyyyMMdd;
        }catch{
          row['dateinsert'] = '1900-01-01';
        }
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

function getSheetPlan(fileId, sheetName) {
  logi('getSheetPlan start ');
  var Agent = getAgent(fileId, sheetName );
  try {
   logi(Agent.all().length);
  }catch(e) {
    config.err = 'getSheetPlan( Agent open: \n fileId:' + fileId + '\n sheetName:' + sheetName + '\n' + e;
    return [];
  }

  var toNo =   0;
  rowMax = Agent.all().length;
  logi('rowMax ' + rowMax);
  var plan = [];
  var parts = rowMax/100;
  logi('getSheetPlan parts ' + parts);
   for (var i = 0; i <= parts; i++) {
    var fromNo = i * 100;
    var toNo =   (i+1) * 100 -1; 
    if (toNo > rowMax) toNo = rowMax;

  
    plan.push([fromNo,toNo]);

  }  
  return plan;

}

function getSheetPlan_TEST(){
   logClear();
  var plan = getSheetPlan('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes');
    logi(plan );
}

// ?action=getSheetPlan&sheetName=dailyNotes&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw
// ?sheetName=elonX&action=getSheetPlan&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA


function getAgent(fileId, sheetName) {
  try {
    if (fileId == null) {
      config.err = 'fileId is wrong;';
      return undefined;
    }
    if (sheetName == null) {
      config.err = 'sheetName is wrong;';
      return undefined;
    }

    var ss; 
    if (fileId.substring(0,4) === 'http' )  
      ss = SpreadsheetApp.openByUrl(fileId);
    else
      ss = SpreadsheetApp.openById(fileId);

    Tamotsu.initialize(ss);
    var Agent = Tamotsu.Table.define({ sheetName: sheetName  });
    rowMax = Agent.all().length;
    return Agent;

  }catch(e){

    config.err = 'Open Agent/sheet: ' + e.toString();
    return undefined;
  }

}

function url2fileid( url) {
  if (url.substring(0, 'https://docs.'.length)  == 'https://docs.') return url;
  var fileid = url.replaceAll('https://docs.google.com/spreadsheets/d/', '');
  fileid = fileid.substring(0, fileid.indexOf('/'));
  return fileid;
}

//----------------------------------------------------------------------------------------
function getRowsLast1quote(fileId, sheetName) {
  var listRows = getSheetTam(fileId, sheetName);
 
  // if (colsLastUsed.indexOf('quoteColumn')) {
  //   config['state'] = 'err: getRowsLast1quote(fileId, sheetName) - quoteColumn is not defined in filelist';
  //   return;
  // }
  // Logger.log(listRows);
  var arr = []
  for (var i = 0; i < listRows.length; i++) {
    var row = listRows[i];
    var Agent = getAgent(row['fileUrl'], row['sheetName'] );
    if (Agent == undefined) continue;
    var lastRow = Agent.last()
    if (row['quoteColumn'].toString().trim() == '') {
      logi(row['row_'] + ' -- quoteColumn is empty, ignored: ' + row['quoteColumn'].toString().trim());
      continue;
    }

    var fileId = SpreadsheetApp.openByUrl(row['fileUrl']).getId();
    var lastUpdated = DriveApp.getFileById (fileId).getLastUpdated();  
    row['lastUpdated'] = lastUpdated;

    row['quote'] = lastRow[row['quoteColumn']];
    
    arr.push(row);
  }
  colsLastUsed.push('quote');
  return arr;
  // ?action=getRowsLast1quote&fileId=1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo&sheetName=hledaniList
}

//----------------------------------------------------------------------------------------test
function getRowsLast1byList_test() {
  Logger.log(getRowsLast1quote('1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo', 'hledaniList'));
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