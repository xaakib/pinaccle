import 'dart:io';
import 'package:hoichoi_clone_app/Db/Practice/practicemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DownloadDB {
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initdb();
    return _database;
  }

  Future<Database> initdb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "downloadsave.db");

    return await openDatabase(path, version: 1,
        onCreate: (database, version) async {
      await database.execute("""
       CREATE TABLE MYTable (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       videoid INTEGER,
       proccess TEXT,
       thumbnail TEXT,
       savepath TEXT
      )
      """);
    });
  }

  Future<bool> insertdata(DownloadSave downloadSave) async {
    final db = await initdb();
    db.insert("MYTable", downloadSave.toJson());
    return true;
  }

  Future<List<DownloadSave>> getdata() async {
    final db = await initdb();
    final List<Map<String, Object?>> datas = await db.query("MYTable");
    return datas.map((e) => DownloadSave.fromJson(e)).toList();
  }

  Future update({String? proccess, String? thumbnail, String? savepath, int? videoid}) async {
    final db = await initdb();
    Map<String, dynamic> row = {
      "proccess": proccess,
      "thumbnail":thumbnail,
      "savepath": savepath,
    };
    var result = await db.update("MYTable", row,
        where: "videoid = ?", whereArgs: [videoid]);
    return result;
  }

  // orderupdate(SaveCategory saveCategory) async {
  //   final db = await initdb();
  //   var result = await db.update("MYTable", saveCategory.toMap(),
  //       where: "id = ?", whereArgs: [saveCategory.orderno]);
  //   return result;
  // }

  Future<List<DownloadSave>> getsingledownload(int videoid) async {
    final db = await initdb();
    final List<Map<String, Object?>> datas =
        await db.query("MYTable", where: "videoid = ?", whereArgs: [videoid]);
    return datas.map((e) => DownloadSave.fromJson(e)).toList();
  }

  Future delete(int id) async {
    final db = await initdb();
    db.delete("MYTable", where: "questionid = ?", whereArgs: [id]);
  }

  Future deleteall() async {
    final db = await initdb();
    db.rawDelete("Delete from MYTable");
  }
}
