function searchFiles1() {
  // Log the name of every file in the user's Drive that modified after February 28,
  // 2013 whose name contains "untitled".
  var files = DriveApp.searchFiles(
      'modifiedDate > "2013-02-28" and title contains "untitled"');
  while (files.hasNext()) {
    var file = files.next();
    Logger.log(file.getName());
  }
}

function getFiles(){
  // Log the name of every file in the user's Drive.
  var files = DriveApp.getFiles();
  var count = 0;
  while (files.hasNext()) {
    count += 1;
    var file = files.next();
    Logger.log(file.getName());
    if (count > 10) break;
  }
}


function getFileUrl() {
  var searchParams = 'title contains "Mila"';
  var files = DriveApp.searchFiles(searchParams);
  while (files.hasNext()) {
     var file = files.next();
     var fileName = file.getName();
     var fileUrl = file.getUrl();
     Logger.log(fileName);
  }
  return fileUrl // or whatever
}


//https://developers.google.com/drive/api/v3/search-files
function fullText1() {
  var searchString = 'Mila';
  var files = DriveApp.searchFiles(
      "fullText contains 'Mila'"
  );
  while (files.hasNext()) {
     var file = files.next();
     var fileName = file.getName();
     var fileUrl = file.getUrl();
     Logger.log(fileName);
  }
  return fileUrl // or whatever
}

function searchFolders1() {
  // Log the name of every folder in the user's Drive that you own and is starred.
  var folders = DriveApp.searchFolders('starred = true and "me" in owners');
  while (folders.hasNext()) {
    var folder = folders.next();
    Logger.log(folder.getName());
  }
}

function getMyFilesFromDrive() {
  var myFiles = DriveApp.searchFiles('"me" in owners');
  var sheet = SpreadsheetApp.getActive().getSheetByName("filesTemp");
  sheet.clear();
  var rows = [];
  rows.push(["ID", "Name", "Url"]);
  while(myFiles.hasNext()) {
    var file = myFiles.next();
    if(file != null) {
      rows.push([file.getId(), file.getName(), file.getUrl()]);
    }
    if (rows.length > 100) break;
  }
  sheet.getRange(1,1,rows.length,3).setValues(rows);
}