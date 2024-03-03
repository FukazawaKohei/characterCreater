import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'level') required int level,
    @JsonKey(name: 'max_hp') required int maxHp,
    @JsonKey(name: 'max_mp') required int maxMp,
    @JsonKey(name: 'attack') required int attack,
    @JsonKey(name: 'defense') required int defense,
    @JsonKey(name: 'speed') required int speed,
  }) = _CharacterModel;

  // JSONからUserを生成するファクトリコンストラクタ
  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}
