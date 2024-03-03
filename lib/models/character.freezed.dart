// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return _CharacterModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_hp')
  int get maxHp => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_mp')
  int get maxMp => throw _privateConstructorUsedError;
  @JsonKey(name: 'attack')
  int get attack => throw _privateConstructorUsedError;
  @JsonKey(name: 'defense')
  int get defense => throw _privateConstructorUsedError;
  @JsonKey(name: 'speed')
  int get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
          CharacterModel value, $Res Function(CharacterModel) then) =
      _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'max_hp') int maxHp,
      @JsonKey(name: 'max_mp') int maxMp,
      @JsonKey(name: 'attack') int attack,
      @JsonKey(name: 'defense') int defense,
      @JsonKey(name: 'speed') int speed});
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? level = null,
    Object? maxHp = null,
    Object? maxMp = null,
    Object? attack = null,
    Object? defense = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      maxHp: null == maxHp
          ? _value.maxHp
          : maxHp // ignore: cast_nullable_to_non_nullable
              as int,
      maxMp: null == maxMp
          ? _value.maxMp
          : maxMp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterModelImplCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$CharacterModelImplCopyWith(_$CharacterModelImpl value,
          $Res Function(_$CharacterModelImpl) then) =
      __$$CharacterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'max_hp') int maxHp,
      @JsonKey(name: 'max_mp') int maxMp,
      @JsonKey(name: 'attack') int attack,
      @JsonKey(name: 'defense') int defense,
      @JsonKey(name: 'speed') int speed});
}

/// @nodoc
class __$$CharacterModelImplCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$CharacterModelImpl>
    implements _$$CharacterModelImplCopyWith<$Res> {
  __$$CharacterModelImplCopyWithImpl(
      _$CharacterModelImpl _value, $Res Function(_$CharacterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? level = null,
    Object? maxHp = null,
    Object? maxMp = null,
    Object? attack = null,
    Object? defense = null,
    Object? speed = null,
  }) {
    return _then(_$CharacterModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      maxHp: null == maxHp
          ? _value.maxHp
          : maxHp // ignore: cast_nullable_to_non_nullable
              as int,
      maxMp: null == maxMp
          ? _value.maxMp
          : maxMp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterModelImpl implements _CharacterModel {
  const _$CharacterModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'level') required this.level,
      @JsonKey(name: 'max_hp') required this.maxHp,
      @JsonKey(name: 'max_mp') required this.maxMp,
      @JsonKey(name: 'attack') required this.attack,
      @JsonKey(name: 'defense') required this.defense,
      @JsonKey(name: 'speed') required this.speed});

  factory _$CharacterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'level')
  final int level;
  @override
  @JsonKey(name: 'max_hp')
  final int maxHp;
  @override
  @JsonKey(name: 'max_mp')
  final int maxMp;
  @override
  @JsonKey(name: 'attack')
  final int attack;
  @override
  @JsonKey(name: 'defense')
  final int defense;
  @override
  @JsonKey(name: 'speed')
  final int speed;

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, level: $level, maxHp: $maxHp, maxMp: $maxMp, attack: $attack, defense: $defense, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.maxHp, maxHp) || other.maxHp == maxHp) &&
            (identical(other.maxMp, maxMp) || other.maxMp == maxMp) &&
            (identical(other.attack, attack) || other.attack == attack) &&
            (identical(other.defense, defense) || other.defense == defense) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, level, maxHp, maxMp, attack, defense, speed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      __$$CharacterModelImplCopyWithImpl<_$CharacterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterModelImplToJson(
      this,
    );
  }
}

abstract class _CharacterModel implements CharacterModel {
  const factory _CharacterModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'level') required final int level,
      @JsonKey(name: 'max_hp') required final int maxHp,
      @JsonKey(name: 'max_mp') required final int maxMp,
      @JsonKey(name: 'attack') required final int attack,
      @JsonKey(name: 'defense') required final int defense,
      @JsonKey(name: 'speed') required final int speed}) = _$CharacterModelImpl;

  factory _CharacterModel.fromJson(Map<String, dynamic> json) =
      _$CharacterModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'level')
  int get level;
  @override
  @JsonKey(name: 'max_hp')
  int get maxHp;
  @override
  @JsonKey(name: 'max_mp')
  int get maxMp;
  @override
  @JsonKey(name: 'attack')
  int get attack;
  @override
  @JsonKey(name: 'defense')
  int get defense;
  @override
  @JsonKey(name: 'speed')
  int get speed;
  @override
  @JsonKey(ignore: true)
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
