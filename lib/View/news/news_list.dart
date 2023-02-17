import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/sources/Source.dart';
import 'package:news_app/View/news/news_item.dart';
import 'package:news_app/View/news/news_list_viewModel.dart';

class NewsList extends StatefulWidget {
  Source? source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.source!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsListViewModel>(
      create: (_) => viewModel,
      child: BlocBuilder<NewsListViewModel, NewsWidgetState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.loadNews(widget.source!.id!);
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          } else if (state is NewsLoadedState) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(state.news[index]);
              },
              itemCount: state.news.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
