import 'package:flutter/material.dart';
import 'package:newsapp/customs/customitem.dart';
import 'package:newsapp/providers/articleprovider.dart';
import 'package:newsapp/screens/details.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ArticleProvider>(
        builder: (context, value, child) {
          final data = value.dataModel?.articles;
          if (data == null) {
            value.getNews();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => NewsItem(article: data[index]),
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
