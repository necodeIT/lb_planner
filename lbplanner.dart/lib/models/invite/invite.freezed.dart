// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanInvite _$PlanInviteFromJson(Map<String, dynamic> json) {
  return _PlanInvite.fromJson(json);
}

/// @nodoc
class _$PlanInviteTearOff {
  const _$PlanInviteTearOff();

  _PlanInvite call(
      {required DateTime timeStamp,
      required int planId,
      required int invitee,
      required int inviter,
      required PlanInviteStatus status}) {
    return _PlanInvite(
      timeStamp: timeStamp,
      planId: planId,
      invitee: invitee,
      inviter: inviter,
      status: status,
    );
  }

  PlanInvite fromJson(Map<String, Object?> json) {
    return PlanInvite.fromJson(json);
  }
}

/// @nodoc
const $PlanInvite = _$PlanInviteTearOff();

/// @nodoc
mixin _$PlanInvite {
  /// ID of the plan
  DateTime get timeStamp => throw _privateConstructorUsedError;

  /// The name of the plan
  int get planId => throw _privateConstructorUsedError;

  /// The id of the user invited to join the plan
  int get invitee => throw _privateConstructorUsedError;

  /// The id of the user who invited the [invitee]
  int get inviter => throw _privateConstructorUsedError;

  /// The status of the invite
  PlanInviteStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanInviteCopyWith<PlanInvite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanInviteCopyWith<$Res> {
  factory $PlanInviteCopyWith(
          PlanInvite value, $Res Function(PlanInvite) then) =
      _$PlanInviteCopyWithImpl<$Res>;
  $Res call(
      {DateTime timeStamp,
      int planId,
      int invitee,
      int inviter,
      PlanInviteStatus status});
}

/// @nodoc
class _$PlanInviteCopyWithImpl<$Res> implements $PlanInviteCopyWith<$Res> {
  _$PlanInviteCopyWithImpl(this._value, this._then);

  final PlanInvite _value;
  // ignore: unused_field
  final $Res Function(PlanInvite) _then;

  @override
  $Res call({
    Object? timeStamp = freezed,
    Object? planId = freezed,
    Object? invitee = freezed,
    Object? inviter = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planId: planId == freezed
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      invitee: invitee == freezed
          ? _value.invitee
          : invitee // ignore: cast_nullable_to_non_nullable
              as int,
      inviter: inviter == freezed
          ? _value.inviter
          : inviter // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlanInviteStatus,
    ));
  }
}

/// @nodoc
abstract class _$PlanInviteCopyWith<$Res> implements $PlanInviteCopyWith<$Res> {
  factory _$PlanInviteCopyWith(
          _PlanInvite value, $Res Function(_PlanInvite) then) =
      __$PlanInviteCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime timeStamp,
      int planId,
      int invitee,
      int inviter,
      PlanInviteStatus status});
}

/// @nodoc
class __$PlanInviteCopyWithImpl<$Res> extends _$PlanInviteCopyWithImpl<$Res>
    implements _$PlanInviteCopyWith<$Res> {
  __$PlanInviteCopyWithImpl(
      _PlanInvite _value, $Res Function(_PlanInvite) _then)
      : super(_value, (v) => _then(v as _PlanInvite));

  @override
  _PlanInvite get _value => super._value as _PlanInvite;

  @override
  $Res call({
    Object? timeStamp = freezed,
    Object? planId = freezed,
    Object? invitee = freezed,
    Object? inviter = freezed,
    Object? status = freezed,
  }) {
    return _then(_PlanInvite(
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      planId: planId == freezed
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      invitee: invitee == freezed
          ? _value.invitee
          : invitee // ignore: cast_nullable_to_non_nullable
              as int,
      inviter: inviter == freezed
          ? _value.inviter
          : inviter // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlanInviteStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlanInvite extends _PlanInvite {
  const _$_PlanInvite(
      {required this.timeStamp,
      required this.planId,
      required this.invitee,
      required this.inviter,
      required this.status})
      : super._();

  factory _$_PlanInvite.fromJson(Map<String, dynamic> json) =>
      _$$_PlanInviteFromJson(json);

  @override

  /// ID of the plan
  final DateTime timeStamp;
  @override

  /// The name of the plan
  final int planId;
  @override

  /// The id of the user invited to join the plan
  final int invitee;
  @override

  /// The id of the user who invited the [invitee]
  final int inviter;
  @override

  /// The status of the invite
  final PlanInviteStatus status;

  @override
  String toString() {
    return 'PlanInvite(timeStamp: $timeStamp, planId: $planId, invitee: $invitee, inviter: $inviter, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanInvite &&
            const DeepCollectionEquality().equals(other.timeStamp, timeStamp) &&
            const DeepCollectionEquality().equals(other.planId, planId) &&
            const DeepCollectionEquality().equals(other.invitee, invitee) &&
            const DeepCollectionEquality().equals(other.inviter, inviter) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timeStamp),
      const DeepCollectionEquality().hash(planId),
      const DeepCollectionEquality().hash(invitee),
      const DeepCollectionEquality().hash(inviter),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$PlanInviteCopyWith<_PlanInvite> get copyWith =>
      __$PlanInviteCopyWithImpl<_PlanInvite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanInviteToJson(this);
  }
}

abstract class _PlanInvite extends PlanInvite {
  const factory _PlanInvite(
      {required DateTime timeStamp,
      required int planId,
      required int invitee,
      required int inviter,
      required PlanInviteStatus status}) = _$_PlanInvite;
  const _PlanInvite._() : super._();

  factory _PlanInvite.fromJson(Map<String, dynamic> json) =
      _$_PlanInvite.fromJson;

  @override

  /// ID of the plan
  DateTime get timeStamp;
  @override

  /// The name of the plan
  int get planId;
  @override

  /// The id of the user invited to join the plan
  int get invitee;
  @override

  /// The id of the user who invited the [invitee]
  int get inviter;
  @override

  /// The status of the invite
  PlanInviteStatus get status;
  @override
  @JsonKey(ignore: true)
  _$PlanInviteCopyWith<_PlanInvite> get copyWith =>
      throw _privateConstructorUsedError;
}
