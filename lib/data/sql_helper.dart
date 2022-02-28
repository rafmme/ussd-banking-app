import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        """CREATE TABLE transactions( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, bankName TEXT, bankImage TEXT, receipient TEXT, amount TEXT, ussdAction TEXT, ussdCode TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'ussdApp.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> addUSSDTransaction({
    required String bankName,
    required String bankImage,
    required String receipient,
    required String amount,
    required String ussdAction,
    required String ussdCode,
  }) async {
    final db = await SQLHelper.db();
    final data = {
      'bankName': bankImage,
      'bankImage': bankImage,
      'receipient': receipient,
      'amount': amount,
      'ussdAction': ussdAction,
      'ussdCode': ussdCode,
    };
    final id = await db.insert('transactions', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUSSDTransactions() async {
    final db = await SQLHelper.db();
    return db.query('transactions', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getUSSDTransaction(int id) async {
    final db = await SQLHelper.db();
    return db.query('transactions', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<void> deleteUSSDTransaction(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("transactions", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
