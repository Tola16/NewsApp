import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/articleservice.dart';

class ArticleProvider extends ChangeNotifier {
  Articles? dataModel;

  Future<void> getNews() async {
    dataModel = await ArticlesService.fetchData();
    notifyListeners();
  }
}
