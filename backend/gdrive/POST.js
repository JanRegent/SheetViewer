function doPost(e) {

  
  var json = e.postData.contents
  var data = JSON.parse(json)
  var updateList = data['updateList'];
  if (updateList !=  undefined ) {
    return responseDataTamotsu(updateList);  
  }


  responseDataTamotsu('error: nothing to return \n input data: \n ' + data.toString());

}

function updateList(updateList) {

  
  
 
}

var testList = {"updateList":{"1":{"fileId":"elonX.csv","sheetName":"elonX","rowsCount":79},"2":{"fileId":"Launch Database.csv","sheetName":"Launch Database","rowsCount":1},"3":{"fileId":"Sheet1.csv","sheetName":"Sheet1","rowsCount":21},"4":{"fileId":"Neptune.csv","sheetName":"Neptune","rowsCount":40}}};

function updateList___test() {
  var updateList = testList['updateList'];
  
  logi(updateList)
}