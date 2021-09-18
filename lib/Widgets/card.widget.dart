import 'package:flutter/material.dart';
import 'package:semana3noticias/Models/articles.model.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/pages/details.page.dart';

class CardWidget extends StatelessWidget {
  final Article article;

  CardWidget({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(article: article),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  article.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
