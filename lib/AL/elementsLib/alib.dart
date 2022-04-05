import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';
//import 'package:sheetviewer/uti/viewers/json_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

AL al = AL();

class AL {
  Widget linkIconSheetOnGCloud(String fileid) {
    if (fileid.startsWith('http')) fileid = bl.blUti.url2fileid(fileid);
    // ignore: unnecessary_null_comparison
    if (fileid.trim() == null) return const Text(' ');
    if (fileid.trim().isEmpty) return const Text(' ');
    return ElevatedButton.icon(
      icon: const Icon(Icons.link),
      label: const Text(''),
      // color: Colors.black,
      // tooltip: 'Open sheet in browser',
      onPressed: () async {
        if (fileid.trim().isEmpty) return;
        String url = 'https://docs.google.com/spreadsheets/d/' + fileid;
        await canLaunch(url)
            ? await launch(url)
            : throw 'Could not launch $url';
      },
    );
  }

  ElevatedButton iconBack(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.arrow_back),
      onPressed: () async {
        Navigator.pop(context);
      },
      onLongPress: () async {
        iconBackDialog(context);
      },
    );
  }

  Widget jsonViewer() {
    return ChuckerFlutter.chuckerButton;
  }

  iconBackDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context, "Cancel");
      },
    );
    Widget filesetsMenuButton = TextButton(
      child: const Text("Filesets menu"),
      onPressed: () async {
        Navigator.pop(context, "menu");
      },
    );
    Widget thisFilesetButton = TextButton(
      child: const Text("Home of "),
      onPressed: () async {
        Navigator.pop(context, "home");
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        title: const Text("Skip to.."),
        content: Column(
          children: [
            cancelButton,
            const Text(' '),
            const Text(' '),
            filesetsMenuButton,
            const Text(' '),
            thisFilesetButton,
          ],
        ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((exit) async {
      switch (exit) {
        case 'Cancel':
          return;
        case 'menu':
          // await Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => FilesetsMenuPage()),
          // );
          break;
        case 'home':
          // await Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => FilesetPage()),
          // );
          break;
        default:
          return;
      }
    });
  }
}
