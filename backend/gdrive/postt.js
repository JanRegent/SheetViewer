

function doPost (e){
  if(!e) return err("No e");
  if(!e.parameters) return err("No params");
  if(!e.parameters.fileId) return err("No fileId");

  logi(e.parameters.name[0]);
  logi(e.parameters.fileId[0]);
  logi(e.parameters.sheetName[0]);
  logi(e.parameters.column[0]);
  logi(e.parameters.operator[0]);
  logi(e.parameters.value[0]);

  return respond(getSelect1(e.parameters.fileId[0],e.parameters.sheetName[0],e.parameters.column[0], e.parameters.operator[0], e.parameters.value[0]) );
}



function err(errMsg){
  var output = JSON.stringify({
    err: errMsg,

  });
  Logger.log(output);
  return respond(output);
}

function postTest() {
  var pars =  {
    "parameters": {
      "name": ["jsmith1"],
      "fileId": ["1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw"],
      'sheetName': ["DailyNotes"],
      'column': ["cesky"],
      'operator': ["contains"],
      'value': ["laska"]
    },

    "contentLength": -1
  }

  

  r = doPost(pars);
  Logger.log('-----');
  Logger.log(r);

}
