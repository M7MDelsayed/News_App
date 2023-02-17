import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/api/api_manager.dart';

import '../../Model/news/News.dart';

class NewsListViewModel extends Cubit<NewsWidgetState> {
  NewsListViewModel() : super(LoadingState());

  void loadNews(String sourceId) async {
    try {
      var response = await ApiManager.getNews(sourceId: sourceId);
      if (response.status == 'error') {
        emit(
          ErrorState('Error Loading Data ${response.message}'),
        );
      } else {
        emit(
          NewsLoadedState(response.newsList!),
        );
      }
    } catch (e) {
      emit(
        ErrorState('Something Went Wrong $e'),
      );
    }
  }
}

abstract class NewsWidgetState {}

class LoadingState extends NewsWidgetState {}

class ErrorState extends NewsWidgetState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class NewsLoadedState extends NewsWidgetState {
  List<News> news;

  NewsLoadedState(this.news);
}
