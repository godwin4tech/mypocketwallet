import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier {
  bool _balanceVisible = false;

  bool get balanceVisible => _balanceVisible;

  void toggleBalanceVisibility() {
    _balanceVisible = !_balanceVisible;
    notifyListeners();
  }

  void setBalanceVisibility(bool visible) {
    _balanceVisible = visible;
    notifyListeners();
  }

  String getMaskedBalance(String balance) {
    if (_balanceVisible) {
      return balance;
    } else {
      return '••••';
    }
  }
}