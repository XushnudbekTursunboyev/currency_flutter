
import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static late final SharedPreferences _pref;

  static void init() async {
    _pref = await SharedPreferences.getInstance();
    _pref.setString("lang", "uz");
  }

  static void setString(String key, String value) {
    _pref.setString(key, value);
  }

  static String? getString(String key){
    return _pref.getString(key);
  }

}