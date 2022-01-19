//@return Base Url
function getUrl() {
  return ScriptApp.getService().getUrl()
}
//@return Html page raw content string
function getHtml(hash) {
  return HtmlService.createHtmlOutputFromFile(hash).getContent()
}

//@return provided page in the urlquery '?page=[PAGEID]' or main index page
function doGet(e) {
  var page = e.parameter.page
  return HtmlService.createHtmlOutputFromFile(page || 'index')
    .addMetaTag('viewport', 'width=device-width, initial-scale=1')
    .setTitle('App Demo')
}



/*
# CREATED BY: BPWEBS.COM
# URL: https://www.bpwebs.com
*/

var burl = 'https://script.google.com/macros/s/AKfycbyyMkRVy65wGEkX9pCMRe086WNUtj98PdCGYDFJCdinaIaOMWWz7j8sQJPGzCMkjpO-/exec';

var link = 'xx';

//GET DATA FROM GOOGLE SHEET AND RETURN AS AN ARRAY
function getData(rang, sheetName) {
  var spreadSheetId = "1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M"; //CHANGE

  var dataRange = sheetName + "!"+rang; 

  var ss = SpreadsheetApp.openById(spreadSheetId);
  var cols = ss.getSheetByName(sheetName).getRange(rang).getValues()[0];

  var range = Sheets.Spreadsheets.Values.get(spreadSheetId, dataRange);
  var values = range.values;

  for (let i = 1; i < values.length; i++) {
    link = burl + '?action='+values[i][1];
    for (let j = 2; j < cols.length; j++) {
      if (values[i][j] == undefined) continue;
      if (values[i][j].toString() == '') continue;
      link = link + '&' + cols[j] + '=' +values[i][j];
    }
    //values[i][0] = link;
  }

  return values;
}


//INCLUDE JAVASCRIPT AND CSS FILES
//REF: https://developers.google.com/apps-script/guides/html/best-practices#separate_html_css_and_javascript

function include(filename) {
  return HtmlService.createHtmlOutputFromFile(filename)
    .getContent();
}

//Ref: https://datatables.net/forums/discussion/comment/145428/#Comment_145428
//Ref: https://datatables.net/examples/styling/bootstrap4