import 'package:flutter/material.dart';
import './pages/dashboard.dart';
import './constaints.dart';

void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Dashboard',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: primary,
          textTheme: const TextTheme().apply(bodyColor: textColor),
          backgroundColor: Colors.yellow),
      home: const Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
