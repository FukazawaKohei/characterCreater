// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterModelImpl _$$CharacterModelImplFromJson(Map<String, dynamic> json) =>
    _$CharacterModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      level: json['level'] as int,
      maxHp: json['max_hp'] as int,
      maxMp: json['max_mp'] as int,
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      speed: json['speed'] as int,
    );

Map<String, dynamic> _$$CharacterModelImplToJson(
        _$CharacterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'max_hp': instance.maxHp,
      'max_mp': instance.maxMp,
      'attack': instance.attack,
      'defense': instance.defense,
      'speed': instance.speed,
    };
