import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage
{
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({
    required String key,
  })  {
    return sharedPreferences?.get(key);
  }

  static Future<bool> saveData({
    required String key ,
    required dynamic value ,
  }) async
  {
    if(value is String ) return await sharedPreferences?.setString(key, value) ?? false;
    if(value is int) return await sharedPreferences?.setInt(key, value) ?? false;
    if(value is bool) return await sharedPreferences?.setBool(key, value) ?? false;

    return await sharedPreferences?.setDouble(key, value) ?? false;
  }

  static Future<bool> saveDataIfNull({
    required String key ,
    required dynamic value ,
  }) async
  {
    if(value is String && LocalStorage.getData(key: key)==null ) return await sharedPreferences?.setString(key, value) ?? false;
    if(value is int&& LocalStorage.getData(key: key)==null ) return await sharedPreferences?.setInt(key, value) ?? false;
    if(value is bool&& LocalStorage.getData(key: key)==null ) return await sharedPreferences?.setBool(key, value) ?? false;

    return false;
  }

  static Future<bool> removeData({
    required String key,
  })async
  {
    return await sharedPreferences!.remove(key);
  }
}