import 'package:hive/hive.dart';

class HiveService {
  static Future readList({required String key}) async {
    Box box = Hive.box(key);
    final data = box.get(key) ?? [];
    return data;
  }

  static Future<List> writeList({
    required String key,
    required var value,
  }) async {
    Box box = Hive.box(key);
    List data = box.get(key) ?? [];
    data.add(value);
    box.put(key, data);
    return data;
  }

  static Future<List> removeList({
    required String key,
    required var value,
  }) async {
    Box<List> box = Hive.box<List>(key);
    List data = box.get(key) ?? [];
    for (var i = 0; i < data.length; i++) {
      if (data[i].id == value.id) data.removeAt(i);
    }
    box.put(key, data);
    return data;
  }
}
