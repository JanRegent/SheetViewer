

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

function getSheetRestRows(fileId, sheetName, fromNo) {

  if (fromNo > 0)  fromNo = fromNo - 1;
  var Agent = getAgent(fileId, sheetName );
  colsLastUsed = Agent.columns();
  
  return getSheetRestRows_(fromNo, Agent);
 
}

function getSheetRestRows_(fromNo, Agent){
  
  var toNo = Agent.all().length;

  if (toNo < fromNo) return undefined;

  var arr = [];
  for (var i = fromNo; i < toNo; i++) {
    try{
      //var row = Agent.find(i);
      var row = Agent.all()[i];

      if (row == undefined) {continue;} 

      if (colsLastUsed.indexOf('dateinsert') > - 1) {
        try {
          var yyyyMMdd = '__' + row['dateinsert'].getFullYear() + '-'+row['dateinsert'].getMonth()+ '-'+row['dateinsert'].getDate() + '__';
          row['dateinsert'] = yyyyMMdd;
        }catch{
          row['dateinsert'] = '__1900-01-01__';
        }
      }
      arr.push(row);
    }catch(e){
      logi('row i: ' + i + ' ' + e);
    }
  }
  return arr;
}

function getRowsFromTo(fromNo, toNo, Agent){
  
  logi('from-to ' + fromNo + ' -- '+  toNo);
  if (toNo < fromNo) return undefined;

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
      config.err = 'getAgent(fileId, sheetName) -- fileId is wrong;';
      logi( config.err);
      return undefined;
    }
    if (sheetName == null) {
      config.err = 'getAgent(fileId, sheetName) -- sheetName is wrong;';
      logi( config.err);
      return undefined;
    }

    var ss; 
    try {
      if (fileId.substring(0,4) === 'http' )  {
        //logi(' SpreadsheetApp.openByUrl ' + fileId.trim());
        ss = SpreadsheetApp.openByUrl(fileId.trim());
      
      }
      else {
        //logi('SpreadsheetApp.openById ' + fileId.trim());
        ss = SpreadsheetApp.openById(fileId.trim());
      }
    }catch(e) {
      logi('SpreadsheetApp.openBy\n' + e);
    }

    var Agent;
    try {
      Tamotsu.initialize(ss);
      Agent = Tamotsu.Table.define({ sheetName: sheetName.trim()  });
    }catch(e){
      logi('SpreadsheetApp.openBy\n' + e);
    }
    rowMax = Agent.all().length;
    //logi('rowMax ' + rowMax);
    return Agent;

  }catch(e){

    config.err = 'Open Agent/sheet: ' + e.toString();
    return undefined;
  }

}

//-----------------------------------------------------------------output
function responseDataTamotsu(values){
  //logi('responseDataTamotsu: len.output: ' + values.length);
  var output = JSON.stringify({
    sheetRows: values,
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


function containsEncodedComponents(x) {
  // ie ?,=,&,/ etc
  return (decodeURI(x) !== decodeURIComponent(x));
}

function listMap(maparr) {

  logi('*************keys=values');
  for (const [key, value] of maparr) {
    logi(key + ' = ' + value)
  }
}

function listObj(maparr, mess) {

  logi('*************obj ' + mess);
  for (const item of maparr) {
    logi(item);
  }
}

//console.log(containsEncodedComponents('%3Fx%3Dtest')); // ?x=test
// expected output: true

//console.log(containsEncodedComponents('%D1%88%D0%B5%D0%BB%D0%BB%D1%8B')); // шеллы
// expected output: false


 /**
 * return an object describing what was passed
 * @param {*} ob the thing to analyze
 * @return {object} object information
 */
function whatAmI (ob) {
 
  try {
    // test for an object
    if (ob !== Object(ob)) {
        return {
          type:typeof ob,
          value: ob,
          length:typeof ob === 'string' ? ob.length : null 
        } ;
    }
    else {
      try {
        var stringify = JSON.stringify(ob);
      }
      catch (err) {
        var stringify = '{"result":"unable to stringify"}';
      }
      return {
        type:typeof ob ,
        value : stringify,
        name:ob.constructor ? ob.constructor.name : null,
        nargs:ob.constructor ? ob.constructor.arity : null,
        length:Array.isArray(ob) ? ob.length:null
      };       
    }
  }
  catch (err) {
    return {
      type:'unable to figure out what I am'
    } ;
  }
  }


