import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:url_launcher/url_launcher.dart';

AL al = AL();

class AL {
  Widget linkIconSheetOnGCloud(String fileid) {
    if (fileid.startsWith('http')) fileid = bl.bLuti.url2fileid(fileid);
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
}
