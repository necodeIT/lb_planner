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
      required String shortName,
      required String colorCode,
      required bool enabled,
      List<Module> modules = const []}) {
    return _Course(
      id: id,
      name: name,
      shortName: shortName,
      colorCode: colorCode,
      enabled: enabled,
      modules: modules,
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
  String get shortName => throw _privateConstructorUsedError;

  /// The color of the course.
  String get colorCode => throw _privateConstructorUsedError;

  /// If the course is enabled or not.
  bool get enabled => throw _privateConstructorUsedError;

  /// The modules of the course.
  List<Module> get modules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String shortName,
      String colorCode,
      bool enabled,
      List<Module> modules});
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
    Object? shortName = freezed,
    Object? colorCode = freezed,
    Object? enabled = freezed,
    Object? modules = freezed,
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
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      modules: modules == freezed
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>,
    ));
  }
}

/// @nodoc
abstract class _$CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$CourseCopyWith(_Course value, $Res Function(_Course) then) =
      __$CourseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String shortName,
      String colorCode,
      bool enabled,
      List<Module> modules});
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
    Object? shortName = freezed,
    Object? colorCode = freezed,
    Object? enabled = freezed,
    Object? modules = freezed,
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
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: colorCode == freezed
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      modules: modules == freezed
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course extends _Course {
  const _$_Course(
      {required this.id,
      required this.name,
      required this.shortName,
      required this.colorCode,
      required this.enabled,
      this.modules = const []})
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
  final String shortName;
  @override

  /// The color of the course.
  final String colorCode;
  @override

  /// If the course is enabled or not.
  final bool enabled;
  @JsonKey()
  @override

  /// The modules of the course.
  final List<Module> modules;

  @override
  String toString() {
    return 'Course(id: $id, name: $name, shortName: $shortName, colorCode: $colorCode, enabled: $enabled, modules: $modules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Course &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.shortName, shortName) &&
            const DeepCollectionEquality().equals(other.colorCode, colorCode) &&
            const DeepCollectionEquality().equals(other.enabled, enabled) &&
            const DeepCollectionEquality().equals(other.modules, modules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(shortName),
      const DeepCollectionEquality().hash(colorCode),
      const DeepCollectionEquality().hash(enabled),
      const DeepCollectionEquality().hash(modules));

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
      required String shortName,
      required String colorCode,
      required bool enabled,
      List<Module> modules}) = _$_Course;
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
  String get shortName;
  @override

  /// The color of the course.
  String get colorCode;
  @override

  /// If the course is enabled or not.
  bool get enabled;
  @override

  /// The modules of the course.
  List<Module> get modules;
  @override
  @JsonKey(ignore: true)
  _$CourseCopyWith<_Course> get copyWith => throw _privateConstructorUsedError;
}
