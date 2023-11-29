import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_apps/response_article.dart';

class Service {
  static Future<List<ResponseArticle>> fetchArticles() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=7558fd63ad6b4008a0aceeedb8f27002";
    final response = await http
        .get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final responseBody = jsonDecode(response.body);
      final result = responseBody["articles"] as List;
      List<ResponseArticle> listArticle = result.map((json) => ResponseArticle.fromJson(json)).toList();
      // print("asdas");
      return listArticle;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
