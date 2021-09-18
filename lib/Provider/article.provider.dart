import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:semana3noticias/Models/articles.model.dart';

//Clase Tipo Provider que lee los datos via webapi de newsapi.org
class ArticleProvider {
  Future<List<Article>> getArticles() async {
    List<Article> list = [];
    var url = Uri.https(
      'newsapi.org',
      '/v2/everything',
      {
        'q': 'tesla',
        'from': '2021-09-15',
        'sortBy': 'publishedAt',
        'apiKey': 'acbf8bd01d784579adcc17d99c63437e'
      },
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      jsonResponse['articles']
          .forEach((element) => list.add(Article.fromJson(element)));
      print('Request finalized: ${list.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return list;
  }
}
