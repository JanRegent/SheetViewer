import 'package:intl/intl.dart';

class BLuti {
  String url2fileid(String url) {
    if (!url.startsWith('https://docs.')) return url;
    String fileid =
        url.replaceFirst('https://docs.google.com/spreadsheets/d/', '');
    fileid = fileid.substring(0, fileid.indexOf('/'));
    return fileid;
  }

  String transl(String key) {
    if (key == 'Loading') return 'Načítání';
    if (key == 'Last5 rows') return 'Posledních 5 řádků';

    return key;
  }

  String removeNonASCII(String str) {
    return str.replaceAll(RegExp(r'[^\x20-\x7E]'), '');
  }

  String todayStr() {
    DateTime day = DateTime.now();
    String today = day.year.toString() +
        '-' +
        day.month.toString() +
        '-' +
        day.day.toString();

    return today;
  }

  void isIrl(String url) {
    var urlPattern =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
    var match =
        RegExp(urlPattern, caseSensitive: false).hasMatch(url).toString();
    // ignore: avoid_print
    print(match); // .allMatches || firstMatch || hasMatch || stringMatch
  }

  List<String> toListString(List<dynamic> items) {
    List<String> list = [];
    for (var item in items) {
      list.add(item.toString());
    }
    return list;
  }

  List<Map> toListMap(List<dynamic> items) {
    List<Map> list = [];
    for (var item in items) {
      list.add(item);
    }
    return list;
  }

  Map<String, dynamic> toMapStringDynamic(Map<dynamic, dynamic> resp) {
    Map<String, dynamic> map = {};
    for (String key in resp.keys) {
      map[key] = resp[key];
    }
    return map;
  }

  // date fomatter function
  String getFormattedDateFromFormattedString(
      {required String currentFormat,
      required String desiredFormat,
      required String value}) {
    String formattedDate = "";
    // ignore: unnecessary_null_comparison
    if (value != null || value.isNotEmpty) {
      try {
        DateTime dateTime =
            DateFormat(currentFormat).parse(value, true).toLocal();
        formattedDate = DateFormat(desiredFormat).format(dateTime);
      } catch (e) {
        return '';
      }
    }
    // rint("Formatted date time:  $formattedDate");
    return formattedDate.toString();
  }
}
