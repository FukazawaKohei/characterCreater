import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class BaseRepository {
  final int _version = 1;

  late Database _database;

  final Map<String, List<String>> _scripts = {
    '1': [
      'CREATE TABLE user_characters(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, level INTEGER, max_hp INTEGER, max_mp INTEGER, attack INTEGER, defense INTEGER, speed INTEGER);'
    ],
  };

  Future<Database> get instance async {
    print(await getDatabasesPath());
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'game.db');

    return await openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        _executeScript(db, 0, version);
        await db.close();
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        _executeScript(db, oldVersion, newVersion);
        await db.close();
      },
    );
  }

  void _executeScript(Database db, int previousVersion, int oldVersion) async {
    for (int i = previousVersion + 1; i <= oldVersion; i++) {
      List<String>? queries = _scripts[i.toString()];
      if (queries != null) {
        for (String query in queries) {
          await db.execute(query);
        }
      }
    }
  }
}
