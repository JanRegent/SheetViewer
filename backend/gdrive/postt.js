function postTest() {
  var pars =  {
  "queryString": "username=jsmith&age=21",
  "parameters": {
    "name": "jsmith",
    "age": "21",
    'pets': ['fido', 'fluffy']
  },

  "contentLength": -1
}

  // var url = "https://script.google.com/macros/s/AKfycbz6DHpu8cDxYbGVdqfWknkl3z0EVpoYrBxpEPSvuK0BZTGM-YkShnbPZV14favw5pqR/exec" ;

  // // Make a POST request with a JSON payload.
  // var data = {
  //   'name': 'Bob Smith',
  //   'age': 35,
  //   'pets': ['fido', 'fluffy']
  // };
  // var options = {
  //   'method' : 'post',
  //   'contentType': 'application/json',
  //   // Convert the JavaScript object to a JSON string.
  //   'payload' : JSON.stringify(data)
  // };
  // var response = UrlFetchApp.fetch(url, options);  

  r = doPost(pars);
  Logger.log('-----');
  Logger.log(r);

}


function doPost (e){
  var e =  {
  "queryString": "username=jsmith&age=21",
  "parameters": {
    "name": "jsmith",
    "age": "21",
    'pets': ['fido', 'fluffy']
  },

  "contentLength": -1
}
  if(!e) return err("No e");
  if(!e.parameters) return err("No params");
  if(!e.parameters.age) return err("No age");
  if(!e.parameters.name) return err("No name");
  if(!e.parameters.pets) return err("No pets");

  return respond(getTemp() );
}


function err(errMsg){
  var output = JSON.stringify({
    err: errMsg,

  });
  Logger.log(output);
  return respond(output);
}
