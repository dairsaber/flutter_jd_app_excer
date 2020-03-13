import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储操作对象
class StorageUtils {
  /// 像本地存储中添加值
  static Future<bool> setValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;
    if (T is int) {
      result = await prefs.setInt(key, value as int);
    } else if (T is bool) {
      result = await prefs.setBool(key, value as bool);
    } else if (T is double) {
      result = await prefs.setDouble(key, value as double);
    } else if (T is String) {
      result = await prefs.setString(key, value as String);
    } else {
      try {
        result = await prefs.setString(key, json.encode(value));
      } catch (e) {
        throw ("不支持的数据类型!");
      }
    }
    return result;
  }

  ///从本地存储中拿值
  static Future<T> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    T result;
    if (T is int) {
      result = prefs.getInt(key) ?? 0 as T;
    } else if (T is bool) {
      result = prefs.getBool(key) ?? false as T;
    } else if (T is double) {
      result = prefs.getDouble(key) ?? 0 as T;
    } else if (T is String) {
      result = prefs.getString(key) ?? "" as T;
    } else {
      try {
        result = json.decode(prefs.getString(key)) as T;
      } catch (e) {
        print(e);
      }
    }
    return result;
  }

  ///清除本地存储中所有值
  static Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  ///移除某项值
  static Future<bool> remove(key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
