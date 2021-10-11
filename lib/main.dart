import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'AL/views/grid_view/_grid_view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getContentServiceUrl();
  await getFilelist();
  runApp(const GridViewApp());
}
