import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void infoSnack(BuildContext context, String mess) {
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message: mess,
    ),
  );
}
