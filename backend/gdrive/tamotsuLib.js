

var colsLastUsed;

paramsErr = '';

var config = { 
  sheetName: '',
  fileId: '',
  err: ''
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

//-----------------------------------------------------------------output
function responseDataTamotsu(values){
  logi('len: ' + values.length);
  var output = JSON.stringify({
    sheetSows: values,
  });

  return ContentService
    .createTextOutput(output)
    .setMimeType(ContentService.MimeType.JSON)
  
}


function respond(response) {  
  //Logger.log(response);
  //listObj(config.getRows, 'resp');
  return ContentService
  .createTextOutput(response)
  .setMimeType(ContentService.MimeType.JSON)
}

//------------------------------------------------------------------log
function logClear(){
  SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log').clear();
}

function logi(mess){
  SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
        .appendRow([new Date(), mess]);
}

function logE(err, voidName){
  SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
        .appendRow([new Date(), voidName, err.stack, err.message]);
}

