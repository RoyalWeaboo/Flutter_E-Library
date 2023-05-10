import 'package:flutter/material.dart';

import '../model/constant/search_subject.dart';

class SearchProvider with ChangeNotifier {
  String _searchSubject = "";
  String _searchQuery = "";

  String get searchSubject => _searchSubject;
  String get searchQuery => _searchQuery;

  void subject(SearchSubject s) {
    if (s == SearchSubject.title) {
      _searchSubject = 'intitle';
      notifyListeners();
    }
    if (s == SearchSubject.author) {
      _searchSubject = 'inauthor';
      notifyListeners();
    }
    if (s == SearchSubject.subject) {
      _searchSubject = 'subject';
      notifyListeners();
    }
  }

  void query(String q) {
    _searchQuery = q;
    notifyListeners();
  }
}
