import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/Models/articles.model.dart';

class DetailsPage extends StatelessWidget {
  final Article article;

  DetailsPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    article.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        DateFormat("dd-MM-yyyy").format(article.publishedAt),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
                article.urlToImage == ''
                    ? Image(image: AssetImage('assets/no-image-available.jpg'))
                    : FadeInImage(
                        image: NetworkImage(article.urlToImage),
                        placeholder: AssetImage('assets/loading.gif')),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    article.author,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(article.description),
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
