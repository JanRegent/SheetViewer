import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:sheetviewer/AL/elementsLib/dropdown/customdropdown.dart';
import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

CustomDropdownMenu interestsDropdown(List<String> intererests,
    List<dynamic> interestList, BuildContext context) {
  void interestChanged(value) async {
    String selectedInterest = '';
    try {
      selectedInterest = value;
      bl.blGlobal.interestRowCurrent = interestList[0];
      await localDb.update(
          'interestRowCurrent', bl.blGlobal.interestRowCurrent);
      for (var i = 0; i < interestList.length; i++) {
        if (interestList[i]['interestName'] == selectedInterest) {
          bl.blGlobal.interestRowCurrent = interestList[i];
          await localDb.update(
              'interestRowCurrent', bl.blGlobal.interestRowCurrent);
          break;
        }
      }
    } catch (_) {
      infoSnack(context, 'interest is NOT ready: ' + selectedInterest,
          AnimatedSnackBarType.error);
    }
  }

  return CustomDropdownMenu(
      defaultValue: intererests[0],
      values: intererests,
      onItemSelected: interestChanged);
}
