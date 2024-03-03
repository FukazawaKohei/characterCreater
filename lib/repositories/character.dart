import 'package:character_creater/repositories/base.dart';
import 'package:character_creater/models/character.dart';
import 'package:sqflite/sqflite.dart';

class CharacterRepository extends BaseRepository {
  final String _tableName = 'user_characters';

  Future<List<CharacterModel>> getAll() async {
    Database database = await instance;
    final List<Map<String, dynamic>> charas = await database.query(_tableName);
    return List.generate(charas.length, (i) {
      return CharacterModel(
        id: charas[i]['id'],
        name: charas[i]['name'],
        level: charas[i]['level'],
        maxHp: charas[i]['max_hp'],
        maxMp: charas[i]['max_mp'],
        attack: charas[i]['attack'],
        defense: charas[i]['defense'],
        speed: charas[i]['speed'],
      );
    });
  }

  Future<int> insert(CharacterModel chara) async {
    Database database = await instance;
    final id = await database.insert(
      _tableName,
      chara.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await database.close();
    return id;
  }

  Future<void> update(CharacterModel chara) async {
    Database database = await instance;
    await database.update(
      _tableName,
      chara.toJson(),
      where: "id = ?",
      whereArgs: [chara.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<void> delete(int id) async {
    Database database = await instance;
    await database.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
