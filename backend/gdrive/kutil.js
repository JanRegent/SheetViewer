function myFunction() {
  
}

/*
  Get filtered rows from Google Sheets
  @author Ivan Kutil
  Preparation: add Advanced service "Sheets" into Google Apps Script project
*/
function getFilteredRows() {
  console.time("filtered-rows")
  let spreadsheetId = SpreadsheetApp.getActive().getId();
  let sheetName = "files"

  // let response = Sheets.Spreadsheets.get(spreadsheetId, {
  //   ranges: [sheetName],
  //   fields: "sheets",
  // });
  // let data = response.sheets[0].data[0];
  let data = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('files');

  let filteredRows = data.rowMetadata.reduce((agg, row, index) => {
      if (!row.hiddenByFilter) {
        let values = data.rowData[index].values.map( col => col.formattedValue)
        agg.push(values)
      } 
      return agg;
    }, [])
  console.log(filteredRows);
  console.timeEnd("filtered-rows");
  return filteredRows
}