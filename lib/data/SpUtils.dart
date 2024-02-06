import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }
}
