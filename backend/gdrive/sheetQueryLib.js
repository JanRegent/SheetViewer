function myFunction() {
  const query = sheetQuery()
  .from('DemoSheet')
  .where((row) => row.cc === 33);

  //Logger.log(query.getRows());

  sheetQuery()
  .from('DemoSheet')
  .insertRows([
    {
      aa: 'aa1',
      bb: 'bb1',
    },
    {
      aa: 'aa2',
      bb: 'bb3',
    },
  ]);

    const query2 = sheetQuery()
  .from('DemoSheet')
  .where((row) => row.bb === 'bb1');

  Logger.log(query2.getRows());
}
