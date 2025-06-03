import 'package:olx_app/resources/exports.dart';

class MySharedPrefs {
  static const String _userKey = 'user_data';
  static const String _loginStatusKey = 'is_logged_in';

  /// Stores user data (e.g., user JSON)
  Future<void> setUserData(String userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userData);
    await prefs.setBool(_loginStatusKey, true);
  }

  /// Retrieves stored user data
  Future<String?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  /// Checks if user is logged in
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginStatusKey) ?? false;
  }

  /// Logs out the user (Clears session data)
  Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setBool(_loginStatusKey, false);
  }
}
