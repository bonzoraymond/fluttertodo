import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  // int a=5;



   Future<void> writeValue(key,value) async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

  sharedPreferences.setString(key, value);
 
  }
  Future<String> getValue(key) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString(key)??'';

  }

}
