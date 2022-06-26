// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return _Statistics.fromJson(json);
}

/// @nodoc
class _$StatisticsTearOff {
  const _$StatisticsTearOff();

  _Statistics call(
      {int totalModules = 0,
      int lateModules = 0,
      int pendingModules = 0,
      int completedModules = 0,
      int uploadedModules = 0,
      Map<int, Statistics> courseStats = const {}}) {
    return _Statistics(
      totalModules: totalModules,
      lateModules: lateModules,
      pendingModules: pendingModules,
      completedModules: completedModules,
      uploadedModules: uploadedModules,
      courseStats: courseStats,
    );
  }

  Statistics fromJson(Map<String, Object?> json) {
    return Statistics.fromJson(json);
  }
}

/// @nodoc
const $Statistics = _$StatisticsTearOff();

/// @nodoc
mixin _$Statistics {
  /// The number of total modules the user has.
  int get totalModules => throw _privateConstructorUsedError;

  /// The number of modules that are late.
  int get lateModules => throw _privateConstructorUsedError;

  /// The number of modules that are pending.
  int get pendingModules => throw _privateConstructorUsedError;

  /// The number of modules the user has completed.
  int get completedModules => throw _privateConstructorUsedError;

  /// The number of modules the user has uploaded.
  int get uploadedModules => throw _privateConstructorUsedError;

  /// Statistics for courses.
  /// Key: course id
  /// Value: statistics for the course
  Map<int, Statistics> get courseStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsCopyWith<Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsCopyWith<$Res> {
  factory $StatisticsCopyWith(
          Statistics value, $Res Function(Statistics) then) =
      _$StatisticsCopyWithImpl<$Res>;
  $Res call(
      {int totalModules,
      int lateModules,
      int pendingModules,
      int completedModules,
      int uploadedModules,
      Map<int, Statistics> courseStats});
}

/// @nodoc
class _$StatisticsCopyWithImpl<$Res> implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._value, this._then);

  final Statistics _value;
  // ignore: unused_field
  final $Res Function(Statistics) _then;

  @override
  $Res call({
    Object? totalModules = freezed,
    Object? lateModules = freezed,
    Object? pendingModules = freezed,
    Object? completedModules = freezed,
    Object? uploadedModules = freezed,
    Object? courseStats = freezed,
  }) {
    return _then(_value.copyWith(
      totalModules: totalModules == freezed
          ? _value.totalModules
          : totalModules // ignore: cast_nullable_to_non_nullable
              as int,
      lateModules: lateModules == freezed
          ? _value.lateModules
          : lateModules // ignore: cast_nullable_to_non_nullable
              as int,
      pendingModules: pendingModules == freezed
          ? _value.pendingModules
          : pendingModules // ignore: cast_nullable_to_non_nullable
              as int,
      completedModules: completedModules == freezed
          ? _value.completedModules
          : completedModules // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedModules: uploadedModules == freezed
          ? _value.uploadedModules
          : uploadedModules // ignore: cast_nullable_to_non_nullable
              as int,
      courseStats: courseStats == freezed
          ? _value.courseStats
          : courseStats // ignore: cast_nullable_to_non_nullable
              as Map<int, Statistics>,
    ));
  }
}

/// @nodoc
abstract class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(
          _Statistics value, $Res Function(_Statistics) then) =
      __$StatisticsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalModules,
      int lateModules,
      int pendingModules,
      int completedModules,
      int uploadedModules,
      Map<int, Statistics> courseStats});
}

/// @nodoc
class __$StatisticsCopyWithImpl<$Res> extends _$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(
      _Statistics _value, $Res Function(_Statistics) _then)
      : super(_value, (v) => _then(v as _Statistics));

  @override
  _Statistics get _value => super._value as _Statistics;

  @override
  $Res call({
    Object? totalModules = freezed,
    Object? lateModules = freezed,
    Object? pendingModules = freezed,
    Object? completedModules = freezed,
    Object? uploadedModules = freezed,
    Object? courseStats = freezed,
  }) {
    return _then(_Statistics(
      totalModules: totalModules == freezed
          ? _value.totalModules
          : totalModules // ignore: cast_nullable_to_non_nullable
              as int,
      lateModules: lateModules == freezed
          ? _value.lateModules
          : lateModules // ignore: cast_nullable_to_non_nullable
              as int,
      pendingModules: pendingModules == freezed
          ? _value.pendingModules
          : pendingModules // ignore: cast_nullable_to_non_nullable
              as int,
      completedModules: completedModules == freezed
          ? _value.completedModules
          : completedModules // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedModules: uploadedModules == freezed
          ? _value.uploadedModules
          : uploadedModules // ignore: cast_nullable_to_non_nullable
              as int,
      courseStats: courseStats == freezed
          ? _value.courseStats
          : courseStats // ignore: cast_nullable_to_non_nullable
              as Map<int, Statistics>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Statistics extends _Statistics {
  const _$_Statistics(
      {this.totalModules = 0,
      this.lateModules = 0,
      this.pendingModules = 0,
      this.completedModules = 0,
      this.uploadedModules = 0,
      this.courseStats = const {}})
      : super._();

  factory _$_Statistics.fromJson(Map<String, dynamic> json) =>
      _$$_StatisticsFromJson(json);

  @JsonKey()
  @override

  /// The number of total modules the user has.
  final int totalModules;
  @JsonKey()
  @override

  /// The number of modules that are late.
  final int lateModules;
  @JsonKey()
  @override

  /// The number of modules that are pending.
  final int pendingModules;
  @JsonKey()
  @override

  /// The number of modules the user has completed.
  final int completedModules;
  @JsonKey()
  @override

  /// The number of modules the user has uploaded.
  final int uploadedModules;
  @JsonKey()
  @override

  /// Statistics for courses.
  /// Key: course id
  /// Value: statistics for the course
  final Map<int, Statistics> courseStats;

  @override
  String toString() {
    return 'Statistics(totalModules: $totalModules, lateModules: $lateModules, pendingModules: $pendingModules, completedModules: $completedModules, uploadedModules: $uploadedModules, courseStats: $courseStats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Statistics &&
            const DeepCollectionEquality()
                .equals(other.totalModules, totalModules) &&
            const DeepCollectionEquality()
                .equals(other.lateModules, lateModules) &&
            const DeepCollectionEquality()
                .equals(other.pendingModules, pendingModules) &&
            const DeepCollectionEquality()
                .equals(other.completedModules, completedModules) &&
            const DeepCollectionEquality()
                .equals(other.uploadedModules, uploadedModules) &&
            const DeepCollectionEquality()
                .equals(other.courseStats, courseStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalModules),
      const DeepCollectionEquality().hash(lateModules),
      const DeepCollectionEquality().hash(pendingModules),
      const DeepCollectionEquality().hash(completedModules),
      const DeepCollectionEquality().hash(uploadedModules),
      const DeepCollectionEquality().hash(courseStats));

  @JsonKey(ignore: true)
  @override
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatisticsToJson(this);
  }
}

abstract class _Statistics extends Statistics {
  const factory _Statistics(
      {int totalModules,
      int lateModules,
      int pendingModules,
      int completedModules,
      int uploadedModules,
      Map<int, Statistics> courseStats}) = _$_Statistics;
  const _Statistics._() : super._();

  factory _Statistics.fromJson(Map<String, dynamic> json) =
      _$_Statistics.fromJson;

  @override

  /// The number of total modules the user has.
  int get totalModules;
  @override

  /// The number of modules that are late.
  int get lateModules;
  @override

  /// The number of modules that are pending.
  int get pendingModules;
  @override

  /// The number of modules the user has completed.
  int get completedModules;
  @override

  /// The number of modules the user has uploaded.
  int get uploadedModules;
  @override

  /// Statistics for courses.
  /// Key: course id
  /// Value: statistics for the course
  Map<int, Statistics> get courseStats;
  @override
  @JsonKey(ignore: true)
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}
