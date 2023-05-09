import 'package:flutter/material.dart';

class PasswordButtonProvider with ChangeNotifier {
  bool _isHidden = true;
  bool _isConfirmHidden = true;

  bool get isHidden => _isHidden;
  bool get isConfirmHidden => _isConfirmHidden;

  void changeVisibility() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  void changeConfirmVisibility() {
    _isConfirmHidden = !_isConfirmHidden;
    notifyListeners();
  }
}
