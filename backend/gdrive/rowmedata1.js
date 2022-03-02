
function f1clasic() {
  var filterValues = ["camino"]; // Please set the filter values.
  var column = 1; // In this case, it's the column "C". Please set the column number.
  var sheetName = "files";  // Please set the sheet name.

  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName(sheetName);
  var values = sheet.getDataRange().getValues();
  var object = values.reduce(function(o, e, i) {
  
    for (var i = 0; i < filterValues.length; i++) {
      if (e[column - 1].indexOf(filterValues[i]) > -1) {
        o.filteredRows.push(e);
      }
    }
    return o;
  }, {filteredRows: []});
  Logger.log(object)
}


function f2(){

  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("files");
  var newCriteria = SpreadsheetApp.newFilterCriteria()
      .whenNumberGreaterThan(99)
      .build();  
      

  if(sheet.getFilter() != null) {
      sheet.getFilter().remove();
  }
  sheet.getDataRange().createFilter().setColumnFilterCriteria(2, newCriteria);
  
  var values = sheet.getDataRange().getValues();
  Logger.log("VALUES "+values.length);
}

function totalRecordsInCalifornia() {

    var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("files");
    // var values = sheet.getDataRange().getValues();
    // Logger.log(values)
    // return;
    if(sheet.getFilter() != null) {
      sheet.getFilter().remove();
    }
    
    var filterCriteria = SpreadsheetApp.newFilterCriteria();
    filterCriteria.whenTextEndsWith(".pdf").build();
    var filter = sheet.getDataRange().createFilter();
    filter.setColumnFilterCriteria(1, filterCriteria);

    var values = filter.getRange().getValues();

    Logger.log(values)

    // for (var i = 0; i < values.length; i++) {
    //   Logger.log(values[i]);
    // }

}

function getFilteredValues(){
  var activeSpreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var newSheet = activeSpreadsheet.getSheetByName("Temporary");
  //check if existing, delete if yes
  if (newSheet != null) {
    activeSpreadsheet.deleteSheet(newSheet);
  }
  //create new sheet with name Temporary
  newSheet = activeSpreadsheet.insertSheet();
  newSheet.setName("Temporary");

  var dataSheet = activeSpreadsheet.getSheetByName("files");
   if(dataSheet.getFilter() != null) {
      dataSheet.getFilter().remove();
    }
  var toFilter = dataSheet.getDataRange();
  var filter = toFilter.createFilter();

  //create criteria
  var criteria = SpreadsheetApp.newFilterCriteria();
  criteria.whenNumberGreaterThan(99);

  //filter first column using the criteria above
  filter.setColumnFilterCriteria(2, criteria.build());

  //copy filtered data to temporary sheet
  var sourceRange = dataSheet.getFilter().getRange();
  sourceRange.copyTo(
    newSheet.getRange('A1'),
    SpreadsheetApp.CopyPasteType.PASTE_NORMAL,
    false); 

  Logger.log(newSheet.getDataRange().getValues());
  activeSpreadsheet.deleteSheet(newSheet);   
}
