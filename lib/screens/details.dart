import 'package:flutter/material.dart';
import 'package:newsapp/customs/customitem.dart';
import 'package:newsapp/models/article.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleModel article;
  const DetailsScreen({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewsItem(article: article));
  }
}
