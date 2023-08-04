import 'package:flutter/cupertino.dart';

class switchprovider extends ChangeNotifier {
  bool isprofile = true;

  void changeprofile(bool n) {
    isprofile = !isprofile;
    notifyListeners();
  }
}
