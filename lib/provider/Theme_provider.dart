import 'package:flutter/material.dart';

import '../model/Theme_modal.dart';

class themeprovider extends ChangeNotifier {
  Thememodel theme = Thememodel(isdark: true);
  void changetheme(void n) {
    theme.isdark = !theme.isdark;
    notifyListeners();
  }
}
