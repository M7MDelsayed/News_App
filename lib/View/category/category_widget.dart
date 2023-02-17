import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/View/category/category_tabs_widget.dart';
import 'package:news_app/View/category/category_widget_viewModel.dart';

import '../home/category_grid_view.dart';

class CategoryWidget extends StatefulWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  CategoryWidgetViewModel viewModel = CategoryWidgetViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryWidgetViewModel>(
      create: (_) => viewModel,
      child: BlocBuilder<CategoryWidgetViewModel, CategoryWidgetState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Column(
                children: [
                  Text('Error Loading Data ${state.errorMessage}'),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.loadSources(widget.category.categoryID);
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          } else if (state is SourceLoadedState) {
            return CategoryTabsWidget(state.sources);
          }
          return Container();
        },
      ),
    );
  }
}
