import 'dart:ui';

abstract class BaseNavigator {
  void hideDialog();

  void showMessage(
    String message,
    String posButton,
    VoidCallback posAction, {
    String? negButton,
    VoidCallback? negAction,
    bool isDismissible = false,
  });

  void showLoading(String message);
}
