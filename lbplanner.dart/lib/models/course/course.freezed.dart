// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
class _$CourseTearOff {
  const _$CourseTearOff();

  _Course call(
      {required int id,
      required String name,
      required String shortname,
      required String colorCode,
      required bool enabled}) {
    return _Course(
      id: id,
      name: name,
      shortname: shortname,
      colorCode: colorCode,
      enabled: enabled,
    );
  }

  Course fromJson(Map<String, Object?> json) {
    return Course.fromJson(json);
  }
}

/// @nodoc
const $Course = _$CourseTearOff();

/// @nodoc
mixin _$Course {
  /// The id of the course.
  int get id => throw _privateConstructorUsedError;

  /// The name of the course.
  String get name => throw _privateConstructorUsedError;

  /// The short name of the course.
  String get shortname => throw _privateConstructorUsedError;

  /// The color of the course.
  String get colorCode => throw _privateConstructorUsedError;

  /// If the course is enabled or not.
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res>;
  $Res call(
      {int id, String name, String shortname, String colorCode, bool enabled});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res> implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  final Course _value;
  // ignore: unused_field
  final $Res Function(Course) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? shortname = freezed,
    Object? colorCode = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortname: shortname == freezed
          ? _value.shortname
          : shortname // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$CourseCopyWith(_Course value, $Res Function(_Course) then) =
      __$CourseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String name, String shortname, String colorCode, bool enabled});
}

/// @nodoc
class __$CourseCopyWithImpl<$Res> extends _$CourseCopyWithImpl<$Res>
    implements _$CourseCopyWith<$Res> {
  __$CourseCopyWithImpl(_Course _value, $Res Function(_Course) _then)
      : super(_value, (v) => _then(v as _Course));

  @override
  _Course get _value => super._value as _Course;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? shortname = freezed,
    Object? colorCode = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_Course(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortname: shortname == freezed
          ? _value.shortname
          : shortname // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course extends _Course {
  const _$_Course(
      {required this.id,
      required this.name,
      required this.shortname,
      required this.colorCode,
      required this.enabled})
      : super._();

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

  @override

  /// The id of the course.
  final int id;
  @override

  /// The name of the course.
  final String name;
  @override

  /// The short name of the course.
  final String shortname;
  @override

  /// The color of the course.
  final String colorCode;
  @override

  /// If the course is enabled or not.
  final bool enabled;

  @override
  String toString() {
    return 'Course(id: $id, name: $name, shortname: $shortname, colorCode: $colorCode, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Course &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.shortname, shortname) &&
            const DeepCollectionEquality().equals(other.colorCode, colorCode) &&
            const DeepCollectionEquality().equals(other.enabled, enabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(shortname),
      const DeepCollectionEquality().hash(colorCode),
      const DeepCollectionEquality().hash(enabled));

  @JsonKey(ignore: true)
  @override
  _$CourseCopyWith<_Course> get copyWith =>
      __$CourseCopyWithImpl<_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(this);
  }
}

abstract class _Course extends Course {
  const factory _Course(
      {required int id,
      required String name,
      required String shortname,
      required String colorCode,
      required bool enabled}) = _$_Course;
  const _Course._() : super._();

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

  @override

  /// The id of the course.
  int get id;
  @override

  /// The name of the course.
  String get name;
  @override

  /// The short name of the course.
  String get shortname;
  @override

  /// The color of the course.
  String get colorCode;
  @override

  /// If the course is enabled or not.
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$CourseCopyWith<_Course> get copyWith => throw _privateConstructorUsedError;
}
