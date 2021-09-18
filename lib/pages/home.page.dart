import 'package:flutter/material.dart';
import 'package:semana3noticias/Provider/article.provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticleProvider articleProvider = ArticleProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _body(),
    );
  }

  _body() {
    var list = articleProvider.getArticles();
    return Text('Home');
  }
}
