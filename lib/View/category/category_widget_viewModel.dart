import 'package:news_app/Model/api/api_manager.dart';
import 'package:news_app/View/category/category_widget_navigator.dart';
import 'package:news_app/base/base_viewModel.dart';

import '../../Model/sources/Source.dart';

class CategoryWidgetViewModel extends BaseViewModel<CategoryWidgetNavigator> {
  List<Source>? sources;
  String? errorMessage;

  void loadNewsSource(String categoryId) async {
    sources = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sources = response.sources;
      }
    } catch (e) {
      errorMessage = 'Error Getting News Sources $e';
    }
    notifyListeners();
  }
}
