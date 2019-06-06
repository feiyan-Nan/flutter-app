// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 主函数(入口函数)
void main() => runApp(MyApp());

// StatelessWidget 不可变状态窗口部件
// StatefulWidget 可变
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Text widget',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter', textAlign: TextAlign.center),
            centerTitle: true,
          ),
          body: Center(
            child: RandomWords(),
          ),
        ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Text(wordPair.asPascalCase);
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0), itemBuilder: (context, i) {
      if(i.isOdd) return new Divider();
    });
  }
}
//class MyStatelessWidget extends StatelessWidget {
//  MyStatelessWidget({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Hello World'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.shopping_cart),
//            tooltip: 'Open shopping cart',
//            onPressed: () {
//              // ...
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}
