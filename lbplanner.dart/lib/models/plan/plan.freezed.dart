// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

/// @nodoc
class _$PlanTearOff {
  const _$PlanTearOff();

  _Plan call(
      {required int id,
      required String name,
      required Map<int, PlanAccessTypes> members,
      required Map<int, Deadline> deadlines,
      required bool ekEnabled,
      bool loading = false}) {
    return _Plan(
      id: id,
      name: name,
      members: members,
      deadlines: deadlines,
      ekEnabled: ekEnabled,
      loading: loading,
    );
  }

  Plan fromJson(Map<String, Object?> json) {
    return Plan.fromJson(json);
  }
}

/// @nodoc
const $Plan = _$PlanTearOff();

/// @nodoc
mixin _$Plan {
  /// ID of the plan
  int get id => throw _privateConstructorUsedError;

  /// The name of the plan
  String get name => throw _privateConstructorUsedError;

  /// Planmembers of the plan
  /// Key: user id
  /// Value: [PlanAccessTypes]
  Map<int, PlanAccessTypes> get members => throw _privateConstructorUsedError;

  /// The deadlines this plan has.
  /// Key: Module id
  /// Value: [Deadline]
  Map<int, Deadline> get deadlines => throw _privateConstructorUsedError;

  /// Wheter the plan has modules of type [ModuleTypes.ek] enabled
  bool get ekEnabled => throw _privateConstructorUsedError;

  /// Wether the plan is currently being fetched from the server or not.
  bool get loading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      Map<int, PlanAccessTypes> members,
      Map<int, Deadline> deadlines,
      bool ekEnabled,
      bool loading});
}

/// @nodoc
class _$PlanCopyWithImpl<$Res> implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  final Plan _value;
  // ignore: unused_field
  final $Res Function(Plan) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? members = freezed,
    Object? deadlines = freezed,
    Object? ekEnabled = freezed,
    Object? loading = freezed,
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
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<int, PlanAccessTypes>,
      deadlines: deadlines == freezed
          ? _value.deadlines
          : deadlines // ignore: cast_nullable_to_non_nullable
              as Map<int, Deadline>,
      ekEnabled: ekEnabled == freezed
          ? _value.ekEnabled
          : ekEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) then) =
      __$PlanCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      Map<int, PlanAccessTypes> members,
      Map<int, Deadline> deadlines,
      bool ekEnabled,
      bool loading});
}

/// @nodoc
class __$PlanCopyWithImpl<$Res> extends _$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(_Plan _value, $Res Function(_Plan) _then)
      : super(_value, (v) => _then(v as _Plan));

  @override
  _Plan get _value => super._value as _Plan;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? members = freezed,
    Object? deadlines = freezed,
    Object? ekEnabled = freezed,
    Object? loading = freezed,
  }) {
    return _then(_Plan(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<int, PlanAccessTypes>,
      deadlines: deadlines == freezed
          ? _value.deadlines
          : deadlines // ignore: cast_nullable_to_non_nullable
              as Map<int, Deadline>,
      ekEnabled: ekEnabled == freezed
          ? _value.ekEnabled
          : ekEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Plan extends _Plan {
  const _$_Plan(
      {required this.id,
      required this.name,
      required this.members,
      required this.deadlines,
      required this.ekEnabled,
      this.loading = false})
      : super._();

  factory _$_Plan.fromJson(Map<String, dynamic> json) => _$$_PlanFromJson(json);

  @override

  /// ID of the plan
  final int id;
  @override

  /// The name of the plan
  final String name;
  @override

  /// Planmembers of the plan
  /// Key: user id
  /// Value: [PlanAccessTypes]
  final Map<int, PlanAccessTypes> members;
  @override

  /// The deadlines this plan has.
  /// Key: Module id
  /// Value: [Deadline]
  final Map<int, Deadline> deadlines;
  @override

  /// Wheter the plan has modules of type [ModuleTypes.ek] enabled
  final bool ekEnabled;
  @JsonKey()
  @override

  /// Wether the plan is currently being fetched from the server or not.
  final bool loading;

  @override
  String toString() {
    return 'Plan(id: $id, name: $name, members: $members, deadlines: $deadlines, ekEnabled: $ekEnabled, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Plan &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.deadlines, deadlines) &&
            const DeepCollectionEquality().equals(other.ekEnabled, ekEnabled) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(deadlines),
      const DeepCollectionEquality().hash(ekEnabled),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$PlanCopyWith<_Plan> get copyWith =>
      __$PlanCopyWithImpl<_Plan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanToJson(this);
  }
}

abstract class _Plan extends Plan {
  const factory _Plan(
      {required int id,
      required String name,
      required Map<int, PlanAccessTypes> members,
      required Map<int, Deadline> deadlines,
      required bool ekEnabled,
      bool loading}) = _$_Plan;
  const _Plan._() : super._();

  factory _Plan.fromJson(Map<String, dynamic> json) = _$_Plan.fromJson;

  @override

  /// ID of the plan
  int get id;
  @override

  /// The name of the plan
  String get name;
  @override

  /// Planmembers of the plan
  /// Key: user id
  /// Value: [PlanAccessTypes]
  Map<int, PlanAccessTypes> get members;
  @override

  /// The deadlines this plan has.
  /// Key: Module id
  /// Value: [Deadline]
  Map<int, Deadline> get deadlines;
  @override

  /// Wheter the plan has modules of type [ModuleTypes.ek] enabled
  bool get ekEnabled;
  @override

  /// Wether the plan is currently being fetched from the server or not.
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$PlanCopyWith<_Plan> get copyWith => throw _privateConstructorUsedError;
}
