// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'module.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return _Module.fromJson(json);
}

/// @nodoc
class _$ModuleTearOff {
  const _$ModuleTearOff();

  _Module call(
      {required int id,
      required String name,
      required String url,
      required DateTime startDate,
      required DateTime endDate,
      required DateTime deadline,
      required bool hidden,
      required ModuleGrades grade,
      required ModuleTypes type,
      required ModuleStatus status}) {
    return _Module(
      id: id,
      name: name,
      url: url,
      startDate: startDate,
      endDate: endDate,
      deadline: deadline,
      hidden: hidden,
      grade: grade,
      type: type,
      status: status,
    );
  }

  Module fromJson(Map<String, Object?> json) {
    return Module.fromJson(json);
  }
}

/// @nodoc
const $Module = _$ModuleTearOff();

/// @nodoc
mixin _$Module {
  /// The id of the module.
  int get id => throw _privateConstructorUsedError;

  /// The name of the module.
  String get name => throw _privateConstructorUsedError;

  /// The url of the module.
  String get url => throw _privateConstructorUsedError;

  /// The start date of the module.
  DateTime get startDate => throw _privateConstructorUsedError;

  /// The end date of the module.
  DateTime get endDate => throw _privateConstructorUsedError;

  /// The deadline of the module.
  DateTime get deadline => throw _privateConstructorUsedError;

  /// If the module is hidden or not.
  bool get hidden => throw _privateConstructorUsedError;

  /// The grade of the module.
  ModuleGrades get grade => throw _privateConstructorUsedError;

  /// The type of the module.
  ModuleTypes get type => throw _privateConstructorUsedError;

  /// The status of the module.
  ModuleStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModuleCopyWith<Module> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleCopyWith<$Res> {
  factory $ModuleCopyWith(Module value, $Res Function(Module) then) =
      _$ModuleCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String url,
      DateTime startDate,
      DateTime endDate,
      DateTime deadline,
      bool hidden,
      ModuleGrades grade,
      ModuleTypes type,
      ModuleStatus status});
}

/// @nodoc
class _$ModuleCopyWithImpl<$Res> implements $ModuleCopyWith<$Res> {
  _$ModuleCopyWithImpl(this._value, this._then);

  final Module _value;
  // ignore: unused_field
  final $Res Function(Module) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deadline = freezed,
    Object? hidden = freezed,
    Object? grade = freezed,
    Object? type = freezed,
    Object? status = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hidden: hidden == freezed
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as ModuleGrades,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ModuleTypes,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ModuleStatus,
    ));
  }
}

/// @nodoc
abstract class _$ModuleCopyWith<$Res> implements $ModuleCopyWith<$Res> {
  factory _$ModuleCopyWith(_Module value, $Res Function(_Module) then) =
      __$ModuleCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String url,
      DateTime startDate,
      DateTime endDate,
      DateTime deadline,
      bool hidden,
      ModuleGrades grade,
      ModuleTypes type,
      ModuleStatus status});
}

/// @nodoc
class __$ModuleCopyWithImpl<$Res> extends _$ModuleCopyWithImpl<$Res>
    implements _$ModuleCopyWith<$Res> {
  __$ModuleCopyWithImpl(_Module _value, $Res Function(_Module) _then)
      : super(_value, (v) => _then(v as _Module));

  @override
  _Module get _value => super._value as _Module;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? deadline = freezed,
    Object? hidden = freezed,
    Object? grade = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_Module(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hidden: hidden == freezed
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as ModuleGrades,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ModuleTypes,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ModuleStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Module extends _Module {
  const _$_Module(
      {required this.id,
      required this.name,
      required this.url,
      required this.startDate,
      required this.endDate,
      required this.deadline,
      required this.hidden,
      required this.grade,
      required this.type,
      required this.status})
      : super._();

  factory _$_Module.fromJson(Map<String, dynamic> json) =>
      _$$_ModuleFromJson(json);

  @override

  /// The id of the module.
  final int id;
  @override

  /// The name of the module.
  final String name;
  @override

  /// The url of the module.
  final String url;
  @override

  /// The start date of the module.
  final DateTime startDate;
  @override

  /// The end date of the module.
  final DateTime endDate;
  @override

  /// The deadline of the module.
  final DateTime deadline;
  @override

  /// If the module is hidden or not.
  final bool hidden;
  @override

  /// The grade of the module.
  final ModuleGrades grade;
  @override

  /// The type of the module.
  final ModuleTypes type;
  @override

  /// The status of the module.
  final ModuleStatus status;

  @override
  String toString() {
    return 'Module(id: $id, name: $name, url: $url, startDate: $startDate, endDate: $endDate, deadline: $deadline, hidden: $hidden, grade: $grade, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Module &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other.hidden, hidden) &&
            const DeepCollectionEquality().equals(other.grade, grade) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(hidden),
      const DeepCollectionEquality().hash(grade),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$ModuleCopyWith<_Module> get copyWith =>
      __$ModuleCopyWithImpl<_Module>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModuleToJson(this);
  }
}

abstract class _Module extends Module {
  const factory _Module(
      {required int id,
      required String name,
      required String url,
      required DateTime startDate,
      required DateTime endDate,
      required DateTime deadline,
      required bool hidden,
      required ModuleGrades grade,
      required ModuleTypes type,
      required ModuleStatus status}) = _$_Module;
  const _Module._() : super._();

  factory _Module.fromJson(Map<String, dynamic> json) = _$_Module.fromJson;

  @override

  /// The id of the module.
  int get id;
  @override

  /// The name of the module.
  String get name;
  @override

  /// The url of the module.
  String get url;
  @override

  /// The start date of the module.
  DateTime get startDate;
  @override

  /// The end date of the module.
  DateTime get endDate;
  @override

  /// The deadline of the module.
  DateTime get deadline;
  @override

  /// If the module is hidden or not.
  bool get hidden;
  @override

  /// The grade of the module.
  ModuleGrades get grade;
  @override

  /// The type of the module.
  ModuleTypes get type;
  @override

  /// The status of the module.
  ModuleStatus get status;
  @override
  @JsonKey(ignore: true)
  _$ModuleCopyWith<_Module> get copyWith => throw _privateConstructorUsedError;
}
