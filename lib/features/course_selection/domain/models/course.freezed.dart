// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  /// The id of the course.
  @JsonKey(name: 'courseid')
  int get id => throw _privateConstructorUsedError;

  /// The HEX color code of the course.
  ///
  /// Internal only. Use [color] instead.
  @JsonKey(name: 'color')
  String get colorCode => throw _privateConstructorUsedError;

  /// The short name of the course.
  @JsonKey(name: 'shortname')
  String get shortName => throw _privateConstructorUsedError;

  /// `true` if the course is enabled. `false` otherwise.
  @JsonKey(name: 'enabled')
  bool get isEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {@JsonKey(name: 'courseid') int id,
      @JsonKey(name: 'color') String colorCode,
      @JsonKey(name: 'shortname') String shortName,
      @JsonKey(name: 'enabled') bool isEnabled});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? colorCode = null,
    Object? shortName = null,
    Object? isEnabled = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'courseid') int id,
      @JsonKey(name: 'color') String colorCode,
      @JsonKey(name: 'shortname') String shortName,
      @JsonKey(name: 'enabled') bool isEnabled});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$_Course>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? colorCode = null,
    Object? shortName = null,
    Object? isEnabled = null,
  }) {
    return _then(_$_Course(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course extends _Course {
  _$_Course(
      {@JsonKey(name: 'courseid') required this.id,
      @JsonKey(name: 'color') required this.colorCode,
      @JsonKey(name: 'shortname') required this.shortName,
      @JsonKey(name: 'enabled') required this.isEnabled})
      : super._();

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

  /// The id of the course.
  @override
  @JsonKey(name: 'courseid')
  final int id;

  /// The HEX color code of the course.
  ///
  /// Internal only. Use [color] instead.
  @override
  @JsonKey(name: 'color')
  final String colorCode;

  /// The short name of the course.
  @override
  @JsonKey(name: 'shortname')
  final String shortName;

  /// `true` if the course is enabled. `false` otherwise.
  @override
  @JsonKey(name: 'enabled')
  final bool isEnabled;

  @override
  String toString() {
    return 'Course(id: $id, colorCode: $colorCode, shortName: $shortName, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, colorCode, shortName, isEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(
      this,
    );
  }
}

abstract class _Course extends Course {
  factory _Course(
      {@JsonKey(name: 'courseid') required final int id,
      @JsonKey(name: 'color') required final String colorCode,
      @JsonKey(name: 'shortname') required final String shortName,
      @JsonKey(name: 'enabled') required final bool isEnabled}) = _$_Course;
  _Course._() : super._();

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

  @override

  /// The id of the course.
  @JsonKey(name: 'courseid')
  int get id;
  @override

  /// The HEX color code of the course.
  ///
  /// Internal only. Use [color] instead.
  @JsonKey(name: 'color')
  String get colorCode;
  @override

  /// The short name of the course.
  @JsonKey(name: 'shortname')
  String get shortName;
  @override

  /// `true` if the course is enabled. `false` otherwise.
  @JsonKey(name: 'enabled')
  bool get isEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}
