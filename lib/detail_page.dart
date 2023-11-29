import 'package:flutter/material.dart';
import 'package:news_apps/response_article.dart';

class DetailPage extends StatelessWidget {
  final ResponseArticle article;
  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [Image.network(article.urlToImage), Text(article.title)],
      ),
    );
  }
}
