

function getRowsLastTam(fileId, sheetName, rowsCount) {
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  var toNo = Agent.last()['#'] ;
  var fromNo =  Math.max( toNo - rowsCount + 1, 1) ;
  return getRowsFromTo(fromNo, toNo, Agent);
  // ?action=getRowsLast&fileId=1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw&sheetName=dailyNotes&rowsCount=3
}

function getRowsFirstTam(fileId, sheetName, rowsCount) {
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  
  var fromNo = Agent.first()['#'] ;
  var toNo =   Math.min(Agent.last()['#'], rowsCount) + 1; 

  logi('fromNo ' + fromNo );
  logi('toNo ' + toNo );
  return getRowsFromTo(fromNo, toNo, Agent);
  // ?action=getRowsFirst&fileId=1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA&sheetName=ElonX&rowsCount=3
}

function getRows_test() {
  config.fileId = '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw';
  config.sheetName = 'dailyNotes';
  config.rowsCount = 3;
  //var values = getRowsLastTam(config.fileId, config.sheetName, config.rowsCount);
  var values = getRowsFirstTam(config.fileId, config.sheetName, config.rowsCount);
  Logger.log(values);
  Logger.log( respond(responseDataTamotsu(values )));
  
}

function getRowsFromTo(fromNo, toNo, Agent){
  
  logi('from-to ' + fromNo + ' -- '+  toNo);

  var arr = [];
  for (var i = fromNo; i <= toNo; i++) {
    try{
      var row = Agent.find(i);
      if (colsLastUsed.indexOf('dateinsert')) {
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

function getAgent(fileId, sheetName) {
  Tamotsu.initialize(SpreadsheetApp.openById(fileId));
  return Tamotsu.Table.define({ sheetName: sheetName  });
}

function myFunction() {
  var ss = SpreadsheetApp.openById('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw');
  Logger.log(ss.getName());
  Tamotsu.initialize(ss);
  var Agent = Tamotsu.Table.define({ sheetName: 'dailyNotes'  });

  var row = Agent.find(3);
  
  var yyyyMMdd = row['dateinsert'].getFullYear() + '-'+row['dateinsert'].getMonth()+ '-'+row['dateinsert'].getDate();
  row['dateinsert'] = yyyyMMdd;
  Logger.log(row['dateinsert']); //=>  {#=1.0, First Name=Charles, Last Name=Bartowski, Gender=Male, Salary=100.0, ...}
  
  Logger.log(yyyyMMdd);
}


