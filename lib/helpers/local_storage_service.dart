
import 'package:shared_preferences/shared_preferences.dart';

  save(String key, String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // If Empty Return Empty String
  get(key) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(key)??'';
    return data;
  }

  remove(key) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
