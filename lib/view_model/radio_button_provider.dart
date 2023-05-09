import 'package:flutter/material.dart';

import '../model/constant/search_subject.dart';

class RadioButtonProvider with ChangeNotifier {
  SearchSubject _subject = SearchSubject.title;
  bool _reading = true;

  SearchSubject get subject => _subject;
  bool get reading => _reading;

  set subject(SearchSubject subject) {
    _subject = subject;
    notifyListeners();
  }

  set reading(bool status) {
    _reading = status;
    notifyListeners();
  }
}
