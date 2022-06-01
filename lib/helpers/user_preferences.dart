import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  void savePreferences(String email, String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("email", email);
    _preferences.setString("password", password);
  }

  void clearPreferences() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }
}
