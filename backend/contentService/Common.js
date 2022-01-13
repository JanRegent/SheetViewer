/*docs

functions table
https://support.google.com/docs/table/25273?visit_id=637749230699014120-3574910415&rd=3

*/

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
