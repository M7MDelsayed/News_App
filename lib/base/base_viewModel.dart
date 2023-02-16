import 'package:flutter/material.dart';

import 'base_navigator.dart';

class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier {
  NAV? navigator;
}
