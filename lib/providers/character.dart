import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:character_creater/repositories/character.dart';
import 'package:character_creater/models/character.dart';

part 'character.g.dart';

@riverpod
class Character extends _$Character {
  @override
  List<CharacterModel> build() => [];

  Future<void> add(CharacterModel character) async {
    final repository = CharacterRepository();
    final id = await repository.insert(character);
    _addState(id, character);
  }

  Future<void> update(CharacterModel character) async {
    final repository = CharacterRepository();
    await repository.update(character);
    _updateState(character);
  }

  Future<void> delete(int id) async {
    final repository = CharacterRepository();
    await repository.delete(id);
    _deleteState(id);
  }

  Future<void> getAll() async {
    final repository = CharacterRepository();
    state = await repository.getAll();
  }

  void _addState(int id, CharacterModel character) {
    state = [
      ...state,
      CharacterModel(
          id: id,
          name: character.name,
          level: character.level,
          maxHp: character.maxHp,
          maxMp: character.maxMp,
          attack: character.attack,
          defense: character.defense,
          speed: character.speed)
    ];
  }

  void _updateState(CharacterModel character) {
    state = state.map((e) => e.id == character.id ? character : e).toList();
  }

  void _deleteState(int id) {
    state = state.where((character) => character.id != id).toList();
  }
}
