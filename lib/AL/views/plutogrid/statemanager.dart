import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'drawergrid.dart';

RxInt rowsCount = 0.obs;

PlutogridController plutogridContr = PlutogridController();

class PlutogridController extends GetxController {
  var multilineDetailLayuout = ''.obs;
}

FocusNode gridFocusNode = FocusNode();
// LinkedScrollControllerGroup verticalScroll = LinkedScrollControllerGroup();

// LinkedScrollControllerGroup horizontalScroll = LinkedScrollControllerGroup();

void initStateManager(
    List<PlutoColumn> plutoCols, final List<PlutoRow> gridrows) {
  viewHelper.gridAStateManager = PlutoGridStateManager(
    columns: plutoCols,
    rows: gridrows,
    gridFocusNode: gridFocusNode,
    scroll: PlutoGridScrollController(
        // vertical: verticalScroll,
        // horizontal: horizontalScroll,
        ),
  );
}
