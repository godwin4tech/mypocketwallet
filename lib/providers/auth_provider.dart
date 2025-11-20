import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  String? _userEmail;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get userEmail => _userEmail;

  // Mock login function (replace with real Firebase auth later)
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;

    if (email.isNotEmpty && password.isNotEmpty) {
      _userEmail = email;
      notifyListeners();
      return true;
    } else {
      // Use helper so it is no longer unused
      _errorMessage = _getErrorMessage('invalid-email');
      notifyListeners();
      return false;
    }
  }

  // Mock register function
  Future<bool> register(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;

    if (email.isNotEmpty && password.isNotEmpty && password.length >= 6) {
      _userEmail = email;
      notifyListeners();
      return true;
    } else {
      // Use helper so it is no longer unused
      _errorMessage = _getErrorMessage('weak-password');
      notifyListeners();
      return false;
    }
  }

  // Mock logout function
  Future<void> logout() async {
    _userEmail = null;
    notifyListeners();
  }

  // Check if user is logged in
  bool get isLoggedIn {
    return _userEmail != null;
  }

  // Error message helper
  String _getErrorMessage(String error) {
    if (error.contains('invalid-email')) {
      return 'Invalid email address';
    } else if (error.contains('user-not-found')) {
      return 'No user found with this email';
    } else if (error.contains('wrong-password')) {
      return 'Wrong password';
    } else if (error.contains('email-already-in-use')) {
      return 'Email already in use';
    } else if (error.contains('weak-password')) {
      return 'Password is too weak';
    } else if (error.contains('network-request-failed')) {
      return 'Network error. Please check your connection';
    } else {
      return 'An error occurred. Please try again';
    }
  }
}
