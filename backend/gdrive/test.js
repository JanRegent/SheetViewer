var turl = 'https://script.google.com/macros/s/AKfycbzs4ilsvyqo48XHZGqOVrU3tA9ZOZuTKy6-JgweRSuNflJVp6Ai84DNh0x8GWNOlV5t/exec';

function testMethod() {


  
  var response = UrlFetchApp.fetch(turl + "?action=getDataSheet");
  Logger.log(response.getContentText());
  var response = UrlFetchApp.fetch(turl + "?action=getFileList");
  Logger.log(response.getContentText());


    var response = UrlFetchApp.fetch(turl + "?action=getDataSheet&fileid="+testSSid+'&sheetname=testSheet');
  Logger.log(response.getContentText());
  var response = UrlFetchApp.fetch(turl + "?action=getFileList&fileid="+testSSid+'&sheetname=testList');
  Logger.log(response.getContentText());
}


//--------------------------------------testLib
  if ((typeof GasTap)==='undefined') { // GasT Initialization. (only if not initialized yet.)
    eval(UrlFetchApp.fetch('https://raw.githubusercontent.com/huan/gast/master/src/gas-tap-lib.js').getContentText())
  } // Class GasTap is ready for use now!

  var test = new GasTap()

  function gastTestRunner() {


      test('[action=getFileList]', function (t) {    
        var response = UrlFetchApp.fetch(turl + "?action=getFileList&fileid="+testSSid+'&sheetname=testList');
        var data = JSON.parse(response.getContentText());
        //Logger.log(data);
        t.equal(data.rows.length, 3, 'rows.length');
        t.equal(data.rows[1].sheetName, 'bible21', 'sheetname');
        t.end;
      })

    test('Spreadsheet exist', function (t) {
      var url = 'https://docs.google.com/spreadsheets/d/1_KRAtoDz2Pdcj9IPZI007I_gMzRyfmXf7gicgxVwYJc/edit#gid=0'
      var ss = SpreadsheetApp.openByUrl(url)
      t.ok(ss, 'open spreadsheet successful')
    })

    test.finish()
  }