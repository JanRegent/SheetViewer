var testSSid = '1aVOXBHhXJJsHeXFC4kVXZ2CJcV6sHPcIi1cBqxJi8jU';

function logi(mess){
  SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
        .appendRow([new Date(), mess]);
}

function logE(err, voidName){
  SpreadsheetApp.getActiveSpreadsheet().getSheetByName('log')
        .appendRow([new Date(), voidName, err.stack, err.message]);
}

