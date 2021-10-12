
function doGet(e) {

  //-----------------------------------------------------------------------filelist
  var filelistId = '';  
  try {
    filelistId = e.parameters.filelistid[0];

  } catch (err) {
    filelistId = '';
  }

  if ( filelistId != '') {

    var filelistSheetname = '';    
    try {
      sheetName = e.parameters.filelistSheetname[0];
    } catch(e) {
      filelistSheetname = 'fileListProHledace';
      SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
        .appendRow([new Date(), 'filelistSheetname', filelistSheetname]);
    }


    try {
      var filelistSS = SpreadsheetApp.openById(filelistId);
      var filelistSheet = filelistSS.getSheetByName(filelistSheetname);


      return ContentService.createTextOutput(getFileList(filelistSheet));

    } catch (err) {
      SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
        .appendRow([new Date(), err.stack, err.message])
    }

  }

    

 

  //------------------------------------------------------------------------file
  var fileId = '';    
  try {
    fileId = e.parameters.fileid[0];
  } catch(e) {
    fileId = '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw';
    SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
      .appendRow([new Date(), 'fileId', fileId]);
  }

  var sheetName = '';    
  try {
    sheetName = e.parameters.sheetname[0];
  } catch(e) {
    sheetName = 'dailyNotes';
     SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
      .appendRow([new Date(), 'sheetName', sheetName]);
  }

 
  try {
    var ss = SpreadsheetApp.openById(fileId);
    var sheet = ss.getSheetByName(sheetName);
    var sheetConfig = ss.getSheetByName(sheetName +'__config__');


    return ContentService.createTextOutput(getDataSheet(sheet, sheetConfig));

  } catch (err) {
    SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
      .appendRow([new Date(), err.stack, err.message])
  }
 
}
