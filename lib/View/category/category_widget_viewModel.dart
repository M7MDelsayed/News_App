import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/api/api_manager.dart';

import '../../Model/sources/Source.dart';

class CategoryWidgetViewModel extends Cubit<CategoryWidgetState> {
  CategoryWidgetViewModel() : super(LoadingState());

  void loadSources(String categoryId) async {
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(
          ErrorState('Error Loading Data ${response.message}'),
        );
      } else {
        emit(
          SourceLoadedState(response.sources!),
        );
      }
    } catch (e) {
      emit(
        ErrorState('Something Went Wrong $e'),
      );
    }
  }
}

abstract class CategoryWidgetState {}

class LoadingState extends CategoryWidgetState {}

class ErrorState extends CategoryWidgetState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SourceLoadedState extends CategoryWidgetState {
  List<Source> sources;

  SourceLoadedState(this.sources);
}
