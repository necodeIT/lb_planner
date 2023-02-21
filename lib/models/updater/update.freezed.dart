// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateTearOff {
  const _$UpdateTearOff();

  _Update call(
      {bool updateAvailable = false,
      String remoteVersion = "",
      String remoteVersionName = "",
      String patchNotes = "",
      Map<String, String> assets = const <String, String>{}}) {
    return _Update(
      updateAvailable: updateAvailable,
      remoteVersion: remoteVersion,
      remoteVersionName: remoteVersionName,
      patchNotes: patchNotes,
      assets: assets,
    );
  }
}

/// @nodoc
const $Update = _$UpdateTearOff();

/// @nodoc
mixin _$Update {
  bool get updateAvailable => throw _privateConstructorUsedError;
  String get remoteVersion => throw _privateConstructorUsedError;
  String get remoteVersionName => throw _privateConstructorUsedError;
  String get patchNotes => throw _privateConstructorUsedError;
  Map<String, String> get assets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateCopyWith<Update> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCopyWith<$Res> {
  factory $UpdateCopyWith(Update value, $Res Function(Update) then) =
      _$UpdateCopyWithImpl<$Res>;
  $Res call(
      {bool updateAvailable,
      String remoteVersion,
      String remoteVersionName,
      String patchNotes,
      Map<String, String> assets});
}

/// @nodoc
class _$UpdateCopyWithImpl<$Res> implements $UpdateCopyWith<$Res> {
  _$UpdateCopyWithImpl(this._value, this._then);

  final Update _value;
  // ignore: unused_field
  final $Res Function(Update) _then;

  @override
  $Res call({
    Object? updateAvailable = freezed,
    Object? remoteVersion = freezed,
    Object? remoteVersionName = freezed,
    Object? patchNotes = freezed,
    Object? assets = freezed,
  }) {
    return _then(_value.copyWith(
      updateAvailable: updateAvailable == freezed
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteVersion: remoteVersion == freezed
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersionName: remoteVersionName == freezed
          ? _value.remoteVersionName
          : remoteVersionName // ignore: cast_nullable_to_non_nullable
              as String,
      patchNotes: patchNotes == freezed
          ? _value.patchNotes
          : patchNotes // ignore: cast_nullable_to_non_nullable
              as String,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$UpdateCopyWith<$Res> implements $UpdateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool updateAvailable,
      String remoteVersion,
      String remoteVersionName,
      String patchNotes,
      Map<String, String> assets});
}

/// @nodoc
class __$UpdateCopyWithImpl<$Res> extends _$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object? updateAvailable = freezed,
    Object? remoteVersion = freezed,
    Object? remoteVersionName = freezed,
    Object? patchNotes = freezed,
    Object? assets = freezed,
  }) {
    return _then(_Update(
      updateAvailable: updateAvailable == freezed
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteVersion: remoteVersion == freezed
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersionName: remoteVersionName == freezed
          ? _value.remoteVersionName
          : remoteVersionName // ignore: cast_nullable_to_non_nullable
              as String,
      patchNotes: patchNotes == freezed
          ? _value.patchNotes
          : patchNotes // ignore: cast_nullable_to_non_nullable
              as String,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$_Update extends _Update {
  const _$_Update(
      {this.updateAvailable = false,
      this.remoteVersion = "",
      this.remoteVersionName = "",
      this.patchNotes = "",
      this.assets = const <String, String>{}})
      : super._();

  @JsonKey()
  @override
  final bool updateAvailable;
  @JsonKey()
  @override
  final String remoteVersion;
  @JsonKey()
  @override
  final String remoteVersionName;
  @JsonKey()
  @override
  final String patchNotes;
  @JsonKey()
  @override
  final Map<String, String> assets;

  @override
  String toString() {
    return 'Update(updateAvailable: $updateAvailable, remoteVersion: $remoteVersion, remoteVersionName: $remoteVersionName, patchNotes: $patchNotes, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Update &&
            const DeepCollectionEquality()
                .equals(other.updateAvailable, updateAvailable) &&
            const DeepCollectionEquality()
                .equals(other.remoteVersion, remoteVersion) &&
            const DeepCollectionEquality()
                .equals(other.remoteVersionName, remoteVersionName) &&
            const DeepCollectionEquality()
                .equals(other.patchNotes, patchNotes) &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updateAvailable),
      const DeepCollectionEquality().hash(remoteVersion),
      const DeepCollectionEquality().hash(remoteVersionName),
      const DeepCollectionEquality().hash(patchNotes),
      const DeepCollectionEquality().hash(assets));

  @JsonKey(ignore: true)
  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);
}

abstract class _Update extends Update {
  const factory _Update(
      {bool updateAvailable,
      String remoteVersion,
      String remoteVersionName,
      String patchNotes,
      Map<String, String> assets}) = _$_Update;
  const _Update._() : super._();

  @override
  bool get updateAvailable;
  @override
  String get remoteVersion;
  @override
  String get remoteVersionName;
  @override
  String get patchNotes;
  @override
  Map<String, String> get assets;
  @override
  @JsonKey(ignore: true)
  _$UpdateCopyWith<_Update> get copyWith => throw _privateConstructorUsedError;
}
