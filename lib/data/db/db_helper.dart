import 'package:sqflite/sqflite.dart';

import '../models/order_model.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "orders";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = '${await getDatabasesPath()}orders.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute("CREATE TABLE $_tableName("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "customerName STRING, "
              "customerEmail STRING, "
              "creatingOrderTime STRING, "
              "creatingOrderDate STRING)");
        },
      );
    } catch (error) {
      print(error);
    }
  }

  static Future<int> insert(Order? order) async {
    print("insert function called");
    return await _db?.insert(_tableName, order!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static Future<int> delete(Order order) async {
    return await _db!.delete(_tableName, where: "id=?", whereArgs: [order.id]);
  }
}
