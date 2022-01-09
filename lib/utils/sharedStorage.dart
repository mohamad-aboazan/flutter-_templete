import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  SharedPreferences sharedPref;
  static saveUser({String token}) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("USER_TOKEN", token);
  }

  static Future<String> loadUser() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("USER_TOKEN");
  }
}
