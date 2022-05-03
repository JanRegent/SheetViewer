import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  // Read From Shared Pref
  read(String key, Type type) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();

    // Read Data
    switch (type) {
      case int:
        // Read an [integer] value from given [key].
        return sharedPref.getInt(key);

      case bool:
        // Read a [Boolean] value from given [key].
        return sharedPref.getBool(key);

      case double:
        // Read a [Double] value from given [key].
        return sharedPref.getDouble(key);

      case String:
        // Read a [String] value from given [key].
        return sharedPref.getString(key);

      case List:
        // Read a [List of Strings] value from given [key].
        return sharedPref.getStringList(key);
    }
  }

  // Update in Shared Pref
  update(String key, var value) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();

    switch (value.runtimeType) {
      case int:
        // Update an [integer] value to given [key].
        await sharedPref.setInt(key, value);
        break;
      case bool:
        // Update a [Boolean] value to given [key].
        await sharedPref.setBool(key, value);
        break;
      case double:
        // Update a [Double] value to given [key].
        await sharedPref.setDouble(key, value);
        break;
      case String:
        // Update a [String] value to given [key].
        await sharedPref.setString(key, value);
        break;
      case List:
        // Update a [List of Strings] value to given [key].
        await sharedPref.setStringList(key, value);
        break;
    }
  }

  // Delete From Shared Pref
  deleteFromSharedPref(String key) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove(key);
  }
}
