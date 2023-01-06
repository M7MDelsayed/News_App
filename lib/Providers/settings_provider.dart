import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  Locale currentLang = const Locale("ar");

  void changeLanguage(Locale newLang) {
    currentLang = newLang;
    notifyListeners();
  }

  bool isArabic() {
    return currentLang == const Locale('ar');
  }
}
