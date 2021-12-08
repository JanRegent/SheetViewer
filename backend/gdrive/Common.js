var testSSid = '1aVOXBHhXJJsHeXFC4kVXZ2CJcV6sHPcIi1cBqxJi8jU';
var contentId = '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis';

function logOn_() {
  logClear();
}

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

//console.log(containsEncodedComponents('%3Fx%3Dtest')); // ?x=test
// expected output: true

//console.log(containsEncodedComponents('%D1%88%D0%B5%D0%BB%D0%BB%D1%8B')); // шеллы
// expected output: false
