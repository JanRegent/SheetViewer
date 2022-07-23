import 'helper.dart';
import 'package:flutter/material.dart';

class CoolSearchBar extends StatefulWidget {
  const CoolSearchBar({Key? key}) : super(key: key);

  @override
  State<CoolSearchBar> createState() => _CoolSearchBarState();
}

class _CoolSearchBarState extends State<CoolSearchBar> {
  bool _onTap = true;
  int index = 0;
  List<String> thisItems = items;
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 65,
        actions: [searchCard(context)],
      ),
      body: (_controller.text.isEmpty || thisItems.isEmpty)
          ? Center(
              child: Image.asset('images/empty.png', height: 100, width: 100),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                height: 80 + ((thisItems.length) * 60),
                width: MediaQuery.of(context).size.width * .9,
                duration: const Duration(milliseconds: 250),
                color: Colors.greenAccent,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(7),
                child: SingleChildScrollView(child: itemList(context)),
              ),
            ),
    );
  }

  IconButton deleteButt(String word) {
    return IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          for (var index = 0; index < items.length; index++) {
            if (items[index] == word) {
              items.removeAt(index);
              onChanged(items[index]);
              return;
            }
          }
        });
  }

  IconButton searchAllSheets(String word) {
    return IconButton(
        icon: const Icon(Icons.search_off),
        onPressed: () {
          returnWord(word);
        });
  }

  void returnWord(String word) {
    Navigator.pop(context, word);
  }

  Widget itemList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (index = 0; index < thisItems.length; index++)
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width * .85,
            color: Colors.amber,
            margin: const EdgeInsets.only(bottom: 5),
            child: ListTile(
              leading: deleteButt(thisItems[index]),
              title: Text(thisItems[index]),
              trailing: searchAllSheets(thisItems[index]),
            ),
          ),
      ],
    );
  }

  Widget searchCard(BuildContext context) {
    return AnimatedContainer(
      height: 55,
      width: _onTap ? MediaQuery.of(context).size.width * .85 : 55,
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerRight,
      decoration: searchDecor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _onTap
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: TextField(
                      controller: _controller,
                      decoration: inputDecor(),
                      onChanged: onChanged,
                    ),
                  ),
                )
              : Container(),
          IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
    );
  }

  InputDecoration inputDecor() {
    return const InputDecoration(
      border: InputBorder.none,
      hintText:
          'Write down the first characters of the word you are looking for',
    );
  }

  BoxDecoration searchDecor() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(_onTap ? 20 : 60),
    );
  }

  void onTap() {
    setState(() => _onTap = !_onTap);
  }

  void onChanged(String value) {
    final result = items.where((element) => element.contains(value)).toList();
    setState(() => thisItems = result);
  }
}
