

function getRowsLastTam(fileId, sheetName, rowsCount) {
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  var toNo = Agent.last()['#'] ;
  var fromNo = toNo - rowsCount + 1;
  var arr = [];

  logi('from-to' + fromNo + ' -- '+  toNo);
  for (var i = fromNo; i <= toNo; i++) {
    try{
      var row = Agent.find(i);
      var yyyyMMdd = row['dateinsert'].getFullYear() + '-'+row['dateinsert'].getMonth()+ '-'+row['dateinsert'].getDate();
      row['dateinsert'] = yyyyMMdd;
      arr.push(row);
    }catch(e){
      Logger.log(e);
    }
  }
 
  return arr;
}
function getRowsLast_test() {
  config.fileId = '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw';
  config.sheetName = 'dailyNotes';
  config.rowsCount = 3;
  var values = getRowsLastTam(config.fileId, config.sheetName, config.rowsCount);
  
  Logger.log( respond(responseDataTam(values )));
  
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


