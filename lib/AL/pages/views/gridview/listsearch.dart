import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({Key? key}) : super(key: key);

  @override
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  final TextEditingController _textController = TextEditingController();

  static List<String> wordsList = ['qq', 'ship'];

  // Copy Main List into New List.
  List<String> newWordsList = List.from(wordsList);

  onItemChanged(String value) {
    setState(() {
      newWordsList = wordsList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select or add search word'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    newWordsList = List.from(wordsList);
                    setState(() {
                      _textController.clear();
                    });
                  },
                ),
              ),
              onChanged: onItemChanged,
            ),
          ),
          ListTile(
            leading: _textController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context, _textController.text);
                    },
                    icon: const Icon(Icons.search))
                : const Text(' '),
            title: _textController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      wordsList.add(_textController.text);
                    },
                    icon: const Icon(Icons.save))
                : const Text(' '),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: newWordsList.map((data) {
                return ListTile(
                  title: Text(data),
                  onTap: () => Navigator.pop(context, data),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

// Search bar in app bar flutter
class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = const Text("AppBar Title");
  Icon actionIcon = const Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon = const Icon(Icons.close);
                appBarTitle = const TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white)),
                );
              } else {
                actionIcon = const Icon(Icons.search);
                appBarTitle = const Text("AppBar Title");
              }
            });
          },
        ),
      ]),
    );
  }
}
