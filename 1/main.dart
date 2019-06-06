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
          primarySwatch: Colors.blue,
        ),
        // 应用的主页面内容
        home: new RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  // 重写createState 返回State
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // 保存建议的单词对
  final _suggestions = <WordPair>[];
  // 已保存收藏的
  final _saved = new Set<WordPair>();
  // 改变字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
    return new Scaffold(
      // 标题栏
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (context, i) {
      // 给奇数行添加分割线
      if (i.isOdd) return new Divider();
      final index = i ~/ 2;
      // 如果是建议列表中的最后一个单词对
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
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
