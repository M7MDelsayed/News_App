import 'package:flutter/material.dart';

import '../components.dart';
import 'base_navigator.dart';
import 'base_viewModel.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  VM? viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel?.navigator = this;
  }

  @override
  void hideDialog() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showLoading(String message) {
    DialogUtils.showLoading(context, message);
  }

  @override
  void showMessage(String message, String posButton, VoidCallback posAction,
      {String? negButton, VoidCallback? negAction, bool isDismissible = true}) {
    DialogUtils.showMessage(context, message, posButton, posAction,
        negAction: negAction,
        negButton: negButton,
        isDismissible: isDismissible);
  }
}
