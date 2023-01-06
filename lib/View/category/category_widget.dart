import 'package:flutter/material.dart';
import 'package:news_app/Model/api/api_manager.dart';
import 'package:news_app/Model/sources/SourceResponse.dart';
import 'package:news_app/View/category/category_tabs_widget.dart';

import '../home/category_grid_view.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(category.categoryID),
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
        var sources = snapshot.data?.sources;
        return CategoryTabsWidget(sources!);
      },
    );
  }
}
