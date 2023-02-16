import 'package:flutter/material.dart';
import 'package:news_app/View/category/category_tabs_widget.dart';
import 'package:news_app/View/category/category_widget_navigator.dart';
import 'package:news_app/View/category/category_widget_viewModel.dart';
import 'package:news_app/base/base_state.dart';
import 'package:provider/provider.dart';

import '../home/category_grid_view.dart';

class CategoryWidget extends StatefulWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState
    extends BaseState<CategoryWidget, CategoryWidgetViewModel>
    implements CategoryWidgetNavigator {
  @override
  void initState() {
    super.initState();
    viewModel?.loadNewsSource(widget.category.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryWidgetViewModel>(
          builder: (_, viewModel, __) {
            if (viewModel.sources == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.errorMessage!),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.loadNewsSource(widget.category.categoryID);
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else {
              return CategoryTabsWidget(viewModel.sources!);
            }
          },
        ));
  }

  @override
  CategoryWidgetViewModel initViewModel() {
    return CategoryWidgetViewModel();
  }
}
