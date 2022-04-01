import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';

void infoSnack(BuildContext context, String mess, AnimatedSnackBarType type) {
  //https://flutterawesome.com/a-flutter-package-to-show-beautiful-animated-snackbars-directly-using-overlay/
  AnimatedSnackBar.material(
    mess,
    type: AnimatedSnackBarType.info,
  ).show(context);
}
