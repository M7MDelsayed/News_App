import 'package:flutter/material.dart';
import 'package:news_app/Model/sources/Source.dart';
import 'package:news_app/View/news/news_item.dart';
import 'package:news_app/View/news/news_list_navigator.dart';
import 'package:news_app/View/news/news_list_viewModel.dart';
import 'package:news_app/base/base_state.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  Source? source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends BaseState<NewsList, NewsListViewModel>
    implements NewsListNavigator {
  @override
  void initState() {
    super.initState();
    viewModel?.loadNews(widget.source!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsListViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.news == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (viewModel.errorMessage != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                  onPressed: () {
                    viewModel.loadNews(widget.source!.id!);
                  },
                  child: const Text('Try Again'),
                ),
              ],
            );
          } else {
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(viewModel.news![index]);
              },
              itemCount: viewModel.news!.length,
            );
          }
        },
      ),
    );
  }

  @override
  NewsListViewModel initViewModel() {
    return NewsListViewModel();
  }
}
