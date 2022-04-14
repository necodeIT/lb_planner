// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deadline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Deadline _$DeadlineFromJson(Map<String, dynamic> json) {
  return _Deadline.fromJson(json);
}

/// @nodoc
class _$DeadlineTearOff {
  const _$DeadlineTearOff();

  _Deadline call(
      {required int moduleId, required DateTime start, required DateTime end}) {
    return _Deadline(
      moduleId: moduleId,
      start: start,
      end: end,
    );
  }

  Deadline fromJson(Map<String, Object?> json) {
    return Deadline.fromJson(json);
  }
}

/// @nodoc
const $Deadline = _$DeadlineTearOff();

/// @nodoc
mixin _$Deadline {
  /// The id of the module the deadline is for.
  int get moduleId => throw _privateConstructorUsedError;

  /// The start date of the deadline.
  DateTime get start => throw _privateConstructorUsedError;

  /// The end date of the deadline.
  DateTime get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeadlineCopyWith<Deadline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeadlineCopyWith<$Res> {
  factory $DeadlineCopyWith(Deadline value, $Res Function(Deadline) then) =
      _$DeadlineCopyWithImpl<$Res>;
  $Res call({int moduleId, DateTime start, DateTime end});
}

/// @nodoc
class _$DeadlineCopyWithImpl<$Res> implements $DeadlineCopyWith<$Res> {
  _$DeadlineCopyWithImpl(this._value, this._then);

  final Deadline _value;
  // ignore: unused_field
  final $Res Function(Deadline) _then;

  @override
  $Res call({
    Object? moduleId = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      moduleId: moduleId == freezed
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DeadlineCopyWith<$Res> implements $DeadlineCopyWith<$Res> {
  factory _$DeadlineCopyWith(_Deadline value, $Res Function(_Deadline) then) =
      __$DeadlineCopyWithImpl<$Res>;
  @override
  $Res call({int moduleId, DateTime start, DateTime end});
}

/// @nodoc
class __$DeadlineCopyWithImpl<$Res> extends _$DeadlineCopyWithImpl<$Res>
    implements _$DeadlineCopyWith<$Res> {
  __$DeadlineCopyWithImpl(_Deadline _value, $Res Function(_Deadline) _then)
      : super(_value, (v) => _then(v as _Deadline));

  @override
  _Deadline get _value => super._value as _Deadline;

  @override
  $Res call({
    Object? moduleId = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_Deadline(
      moduleId: moduleId == freezed
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Deadline extends _Deadline {
  _$_Deadline({required this.moduleId, required this.start, required this.end})
      : super._();

  factory _$_Deadline.fromJson(Map<String, dynamic> json) =>
      _$$_DeadlineFromJson(json);

  @override

  /// The id of the module the deadline is for.
  final int moduleId;
  @override

  /// The start date of the deadline.
  final DateTime start;
  @override

  /// The end date of the deadline.
  final DateTime end;

  @override
  String toString() {
    return 'Deadline(moduleId: $moduleId, start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Deadline &&
            const DeepCollectionEquality().equals(other.moduleId, moduleId) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(moduleId),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$DeadlineCopyWith<_Deadline> get copyWith =>
      __$DeadlineCopyWithImpl<_Deadline>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeadlineToJson(this);
  }
}

abstract class _Deadline extends Deadline {
  factory _Deadline(
      {required int moduleId,
      required DateTime start,
      required DateTime end}) = _$_Deadline;
  _Deadline._() : super._();

  factory _Deadline.fromJson(Map<String, dynamic> json) = _$_Deadline.fromJson;

  @override

  /// The id of the module the deadline is for.
  int get moduleId;
  @override

  /// The start date of the deadline.
  DateTime get start;
  @override

  /// The end date of the deadline.
  DateTime get end;
  @override
  @JsonKey(ignore: true)
  _$DeadlineCopyWith<_Deadline> get copyWith =>
      throw _privateConstructorUsedError;
}
