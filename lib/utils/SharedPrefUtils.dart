import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static void resetSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDBTableCreated", false);
  }

  static Future<bool> isDBTableCreated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isDBTableCreated");
  }

  static void setDBTableCreated(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDBTableCreated", val);
  }
}
