import 'package:news_app/Model/api/api_manager.dart';
import 'package:news_app/Model/news/News.dart';
import 'package:news_app/View/news/news_list_navigator.dart';
import 'package:news_app/base/base_viewModel.dart';

class NewsListViewModel extends BaseViewModel<NewsListNavigator> {
  List<News>? news;
  String? errorMessage;

  void loadNews(String sourceId) async {
    news = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApiManager.getNews(sourceId: sourceId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        news = response.newsList;
      }
    } catch (e) {
      errorMessage = 'Error Getting News $e';
    }
    notifyListeners();
  }
}
