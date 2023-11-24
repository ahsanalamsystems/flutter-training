import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider with ChangeNotifier {
  late SharedPreferences _prefs;

  late String _userName = 'ahsan.alam';
  String get userName => _userName;

  late bool _isDarkModeEnabled = false;
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  SharedPreferencesProvider() {
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _userName = _prefs.getString('userName') ?? '';
    _isDarkModeEnabled = _prefs.getBool('isDarkModeEnabled') ?? false;
    notifyListeners();
  }

  Future<void> saveUserData(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
    _userName = userName;
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkModeEnabled = !_isDarkModeEnabled;
    await prefs.setBool('isDarkModeEnabled', _isDarkModeEnabled);
    notifyListeners();
  }
}
