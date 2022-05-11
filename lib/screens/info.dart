import '../models/book.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  final Book books;

  const Info({Key? key, required this.books}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.55,
                        color: Colors.indigo,
                      ),
                      Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    height: Image(
                                            image:
                                                AssetImage(widget.books.image))
                                        .height,
                                    image: AssetImage(widget.books.image),
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.books.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    widget.books.publisher,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.indigo,
                      ),
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            widget.books.like = !widget.books.like;
                          });
                        }),
                        child: Icon(
                          widget.books.like ? Icons.favorite : Icons.favorite,
                          size: 32,
                          color: widget.books.like ? Colors.pink : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.indigo,
                      ),
                      child: const Center(
                        child: Text(
                          "Get Book",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
