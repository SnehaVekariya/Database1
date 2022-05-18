import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? database;

  Future<Database> checkDB() async {
    if (database != null) {
      return database!; 
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "rnw.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE std (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,mobile TEXT)";
      db.execute(query);
    });
  }

  void insertData(String n1, String m1) async {
    database = await checkDB();
    var res = await database!.insert("std", {"name": n1, "mobile": m1});
    print("$res");
  }

  void updateData(String n1, String m1, String id) async {
    database = await checkDB();
    var res = database!.update("std", {"name": n1, "mobile": m1},
        where: "id = ?", whereArgs: [id]);
    print("$res");
  }

  void deleteData(String id) async {
    database = await checkDB();

    database!.delete("std", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> retrive() async {
    database = await checkDB();

    String query ="SELECT * FROM std";

    List<Map<String,dynamic>>  list  = await database!.rawQuery(query);

    return list;
  }
}









