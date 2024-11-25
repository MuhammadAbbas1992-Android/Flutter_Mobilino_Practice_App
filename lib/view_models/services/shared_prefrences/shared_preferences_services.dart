import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  // Store the username in SharedPreferences
  static Future<void> saveToSharedPref(String key, String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, user);
  }

  // Retrieve the username from SharedPreferences
  static Future<String?> getFromSharedPref(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString(key);
    return userName;
  }

  // Clear the username from SharedPreferences
  static Future<void> clearFromSharedPref(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
