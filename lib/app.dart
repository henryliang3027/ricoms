import 'package:flutter/material.dart';
import 'package:ricoms/history/view/history.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String _title = 'Ricoms';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const HistoryPage(),
      ),
    );
  }
}
