// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

  _Notification call(
      {required int id,
      int? payload,
      required NotificationTypes type,
      required NotificationStatus status,
      required DateTime timestamp,
      DateTime? readTimestamp}) {
    return _Notification(
      id: id,
      payload: payload,
      type: type,
      status: status,
      timestamp: timestamp,
      readTimestamp: readTimestamp,
    );
  }

  Notification fromJson(Map<String, Object?> json) {
    return Notification.fromJson(json);
  }
}

/// @nodoc
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  /// ID of the notification
  int get id => throw _privateConstructorUsedError;

  /// The payload of the notification
  int? get payload => throw _privateConstructorUsedError;

  /// The type of the notification
  NotificationTypes get type => throw _privateConstructorUsedError;

  /// The status of the notification
  NotificationStatus get status => throw _privateConstructorUsedError;

  /// The date the notification was received
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// The date the notification was read
  DateTime? get readTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int? payload,
      NotificationTypes type,
      NotificationStatus status,
      DateTime timestamp,
      DateTime? readTimestamp});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? payload = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? timestamp = freezed,
    Object? readTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationTypes,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readTimestamp: readTimestamp == freezed
          ? _value.readTimestamp
          : readTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) then) =
      __$NotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int? payload,
      NotificationTypes type,
      NotificationStatus status,
      DateTime timestamp,
      DateTime? readTimestamp});
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(
      _Notification _value, $Res Function(_Notification) _then)
      : super(_value, (v) => _then(v as _Notification));

  @override
  _Notification get _value => super._value as _Notification;

  @override
  $Res call({
    Object? id = freezed,
    Object? payload = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? timestamp = freezed,
    Object? readTimestamp = freezed,
  }) {
    return _then(_Notification(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationTypes,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readTimestamp: readTimestamp == freezed
          ? _value.readTimestamp
          : readTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification with DiagnosticableTreeMixin implements _Notification {
  const _$_Notification(
      {required this.id,
      this.payload,
      required this.type,
      required this.status,
      required this.timestamp,
      this.readTimestamp});

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @override

  /// ID of the notification
  final int id;
  @override

  /// The payload of the notification
  final int? payload;
  @override

  /// The type of the notification
  final NotificationTypes type;
  @override

  /// The status of the notification
  final NotificationStatus status;
  @override

  /// The date the notification was received
  final DateTime timestamp;
  @override

  /// The date the notification was read
  final DateTime? readTimestamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notification(id: $id, payload: $payload, type: $type, status: $status, timestamp: $timestamp, readTimestamp: $readTimestamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notification'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('payload', payload))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('readTimestamp', readTimestamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notification &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality()
                .equals(other.readTimestamp, readTimestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(payload),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(readTimestamp));

  @JsonKey(ignore: true)
  @override
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(this);
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required int id,
      int? payload,
      required NotificationTypes type,
      required NotificationStatus status,
      required DateTime timestamp,
      DateTime? readTimestamp}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override

  /// ID of the notification
  int get id;
  @override

  /// The payload of the notification
  int? get payload;
  @override

  /// The type of the notification
  NotificationTypes get type;
  @override

  /// The status of the notification
  NotificationStatus get status;
  @override

  /// The date the notification was received
  DateTime get timestamp;
  @override

  /// The date the notification was read
  DateTime? get readTimestamp;
  @override
  @JsonKey(ignore: true)
  _$NotificationCopyWith<_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
