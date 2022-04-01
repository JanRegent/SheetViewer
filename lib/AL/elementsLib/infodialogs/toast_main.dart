//import 'package:fluttertoast/fluttertoast.dart';
import 'toast_context.dart';

import 'package:flutter/material.dart';

GlobalKey globalKey = GlobalKey();

void toastMain() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Toast"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ToastContext(),
              ));
            },
            child: const Text("Flutter Toast Context"),
          ),
        ],
      ),
    );
  }
}
