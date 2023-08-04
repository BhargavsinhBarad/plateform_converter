import 'package:flutter/cupertino.dart';

class platfrom extends ChangeNotifier {
  bool isios = false;

  void changeolatfrom(bool n) {
    isios = !isios;
    notifyListeners();
  }
}
