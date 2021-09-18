import 'package:flutter/material.dart';
import 'package:semana3noticias/Models/articles.model.dart';
import 'package:semana3noticias/Provider/article.provider.dart';
import 'package:semana3noticias/Widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticleProvider articleProvider = ArticleProvider();
  late Future<List<Article>> _futureArticles;

  @override
  void initState() {
    _futureArticles = articleProvider.getArticles();
    super.initState();
  }

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
    return FutureBuilder(
      future: _futureArticles,
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          List<CardWidget> list = [];

          for (var article in articles!) {
            list.add(CardWidget(article: article));
          }
          return ListView(children: list);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
