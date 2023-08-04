import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  static List<Contacts> allContacts = [];

  void addContacts(Contacts add) {
    allContacts.add(add);
    notifyListeners();
  }
}
