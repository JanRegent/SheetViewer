import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/_home_filelist/_filelistviewhome.dart';
import 'package:sheetviewer/AL/__home/interests/drawer_home.dart';

import 'package:sheetviewer/BL/bl.dart';

class LoadingInterestPage extends StatefulWidget {
  const LoadingInterestPage({Key? key}) : super(key: key);

  @override
  _LoadingInterestPageState createState() => _LoadingInterestPageState();
}

class _LoadingInterestPageState extends State<LoadingInterestPage> {
  @override
  void initState() {
    super.initState();
  }

  void setStateFunc() {
    setState(() {});
  }

  @override
  void dispose() {
    Get.delete<Controller>();
    super.dispose();
  }

  late final Controller statusCont;
  @override
  Widget build(BuildContext context) {
    statusCont = Get.put(Controller());
    return Scaffold(
        drawer: interestsDrawer(context, setStateFunc),
        body: FutureBuilder<String>(
          future: interestContr.filelistLoad(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    const Text('Loading sheets of interest:'),
                    Obx(() => Text(interestContr.interestName.value)),
                    const Text(' '),
                    Obx(() => Text(interestContr.loadedSheetName.value)),
                    const Text(' '),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const FilelistviewHomePage();
                }
            }
          },
        )

        //listviewBody()

        //Center(child: filelistGrid()),
        );
  }
}

class Controller extends GetxController {
  var ls = List<String>.generate(100, (counter) => "waiting").obs;
  lsSet(int index) {
    ls[index] = '';
  }
}
