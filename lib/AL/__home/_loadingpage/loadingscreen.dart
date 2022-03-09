import 'package:flutter/material.dart';
import 'package:screen_loader/screen_loader.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Loader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingPage(),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

/// A Stateful screen
class _LoadingPageState extends State<LoadingPage> with ScreenLoader {
  @override
  loader() {
    return const AlertDialog(
      title: Text('Wait.. Loading data..'),
    );
  }

  @override
  loadingBgBlur() => 10.0;

  Widget _buildBody() {
    return Center(
      child: Icon(
        Icons.home,
        size: MediaQuery.of(context).size.width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loadableWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ScreenLoader Example'),
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await performFuture(NetworkService.getData);
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

/// A Stateless screen
// ignore: must_be_immutable
class BasicScreen extends StatelessWidget with ScreenLoader {
  BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadableWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Basic ScreenLoader Example'),
        ),
        body: Center(
          child: Icon(
            Icons.home,
            size: MediaQuery.of(context).size.width,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await performFuture(NetworkService.getData);
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

class NetworkService {
  static Future getData() async {
    return await Future.delayed(const Duration(seconds: 2));
  }
}
