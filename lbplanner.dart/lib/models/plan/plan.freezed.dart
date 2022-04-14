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
      required String description,
      required Map<int, PlanAccessTypes> members,
      required Map<int, Deadline> deadlines,
      required bool enableEk,
      List<PlanInvite> invites = const []}) {
    return _Plan(
      id: id,
      name: name,
      description: description,
      members: members,
      deadlines: deadlines,
      enableEk: enableEk,
      invites: invites,
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

  /// The description of the plan
  String get description => throw _privateConstructorUsedError;

  /// Planmembers of the plan
  /// Key: user id
  /// Value: [PlanAccessTypes]
  Map<int, PlanAccessTypes> get members => throw _privateConstructorUsedError;

  /// The deadlines this plan has.
  /// Key: Module id
  /// Value: [Deadline]
  Map<int, Deadline> get deadlines => throw _privateConstructorUsedError;

  /// Wheter the plan has modules of type [ModuleTypes.ek] enabled
  bool get enableEk => throw _privateConstructorUsedError;

  /// The invites of the plan
  List<PlanInvite> get invites => throw _privateConstructorUsedError;

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
      String description,
      Map<int, PlanAccessTypes> members,
      Map<int, Deadline> deadlines,
      bool enableEk,
      List<PlanInvite> invites});
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
    Object? description = freezed,
    Object? members = freezed,
    Object? deadlines = freezed,
    Object? enableEk = freezed,
    Object? invites = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<int, PlanAccessTypes>,
      deadlines: deadlines == freezed
          ? _value.deadlines
          : deadlines // ignore: cast_nullable_to_non_nullable
              as Map<int, Deadline>,
      enableEk: enableEk == freezed
          ? _value.enableEk
          : enableEk // ignore: cast_nullable_to_non_nullable
              as bool,
      invites: invites == freezed
          ? _value.invites
          : invites // ignore: cast_nullable_to_non_nullable
              as List<PlanInvite>,
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
      String description,
      Map<int, PlanAccessTypes> members,
      Map<int, Deadline> deadlines,
      bool enableEk,
      List<PlanInvite> invites});
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
    Object? description = freezed,
    Object? members = freezed,
    Object? deadlines = freezed,
    Object? enableEk = freezed,
    Object? invites = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<int, PlanAccessTypes>,
      deadlines: deadlines == freezed
          ? _value.deadlines
          : deadlines // ignore: cast_nullable_to_non_nullable
              as Map<int, Deadline>,
      enableEk: enableEk == freezed
          ? _value.enableEk
          : enableEk // ignore: cast_nullable_to_non_nullable
              as bool,
      invites: invites == freezed
          ? _value.invites
          : invites // ignore: cast_nullable_to_non_nullable
              as List<PlanInvite>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Plan extends _Plan {
  const _$_Plan(
      {required this.id,
      required this.name,
      required this.description,
      required this.members,
      required this.deadlines,
      required this.enableEk,
      this.invites = const []})
      : super._();

  factory _$_Plan.fromJson(Map<String, dynamic> json) => _$$_PlanFromJson(json);

  @override

  /// ID of the plan
  final int id;
  @override

  /// The name of the plan
  final String name;
  @override

  /// The description of the plan
  final String description;
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
  final bool enableEk;
  @JsonKey()
  @override

  /// The invites of the plan
  final List<PlanInvite> invites;

  @override
  String toString() {
    return 'Plan(id: $id, name: $name, description: $description, members: $members, deadlines: $deadlines, enableEk: $enableEk, invites: $invites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Plan &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.deadlines, deadlines) &&
            const DeepCollectionEquality().equals(other.enableEk, enableEk) &&
            const DeepCollectionEquality().equals(other.invites, invites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(deadlines),
      const DeepCollectionEquality().hash(enableEk),
      const DeepCollectionEquality().hash(invites));

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
      required String description,
      required Map<int, PlanAccessTypes> members,
      required Map<int, Deadline> deadlines,
      required bool enableEk,
      List<PlanInvite> invites}) = _$_Plan;
  const _Plan._() : super._();

  factory _Plan.fromJson(Map<String, dynamic> json) = _$_Plan.fromJson;

  @override

  /// ID of the plan
  int get id;
  @override

  /// The name of the plan
  String get name;
  @override

  /// The description of the plan
  String get description;
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
  bool get enableEk;
  @override

  /// The invites of the plan
  List<PlanInvite> get invites;
  @override
  @JsonKey(ignore: true)
  _$PlanCopyWith<_Plan> get copyWith => throw _privateConstructorUsedError;
}
