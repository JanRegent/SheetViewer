

function getSelect1(values) {

  config.select1 = [];

  var rowIxStart = indexOfSectionRow('__select1__', values);
  if (rowIxStart == -1) return;
  
  for (var rowIx = rowIxStart+1; rowIx < values.length; rowIx++) {
    if (values[rowIx][0] == '')        continue;
    if (values[rowIx][0] != 'select1') continue;
    if (values[rowIx][0].substring(0,2) == '//') continue;
    if (values[rowIx][0].substring(0,2) == '__') break;

    var row = values[rowIx];
    var selectRow =   'selectType--select1__|__column: '+row[1] + '__|__operator: ' +row[2] + '__|__value: ' +row[3] + '__|__headerName: ' +row[4];
    config.select1.push(selectRow);
  }

}


function getSelect1_test() {
  logClear();
  getSelect1(getValuesConfig('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__')  );
  Logger.log(config.select1);
}
