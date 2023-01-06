import 'package:flutter/material.dart';
import 'package:news_app/Model/api/api_manager.dart';
import 'package:news_app/Model/news/NewsResponse.dart';
import 'package:news_app/Model/sources/Source.dart';
import 'package:news_app/View/news/news_item.dart';

class NewsList extends StatelessWidget {
  Source? source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(sourceId: source?.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error Loading Data ${snapshot.error.toString()}'),
          );
        }
        if (snapshot.data?.status == 'error') {
          return Center(child: Text('Server Error ${snapshot.data?.message}'));
        }
        var newsList = snapshot.data?.newsList;
        return ListView.builder(
          itemBuilder: (_, index) {
            return NewsItem(newsList?[index]);
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }
}
