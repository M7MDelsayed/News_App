import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message,
      {bool isDismissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              width: 10,
            ),
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      String posButton, VoidCallback posAction,
      {String? negButton, VoidCallback? negAction, bool isDismissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        List<Widget> action = [
          TextButton(
            onPressed: posAction,
            child: Text(
              posButton,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ];
        if (negButton != null) {
          action.add(
            TextButton(
              onPressed: negAction,
              child: Text(
                negButton,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          );
        }
        return AlertDialog(
            title: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            actions: action);
      },
    );
  }
}
