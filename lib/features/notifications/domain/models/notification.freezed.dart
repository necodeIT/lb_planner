// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  /// The id of the notification.
  @JsonKey(name: 'notificationid')
  int get id => throw _privateConstructorUsedError;

  /// The type of the notification.
  ///
  /// Based on this, the [context] will be interpreted differently (see [Notification] for more details).
  @JsonKey(name: 'type')
  NotificationType get type => throw _privateConstructorUsedError;

  /// The id of the user that the notification is for.
  ///
  /// This will always be the id of the currently logged in user.
  @JsonKey(name: 'userid')
  int get userId => throw _privateConstructorUsedError;

  /// Additional information for the notification.
  ///
  /// This is interpreted differently based on the [type] (see [NotificationType] for more details).
  @JsonKey(name: 'info')
  int? get context => throw _privateConstructorUsedError;

  /// The unix timestamp of when the notification was created.
  @JsonKey(name: 'timestamp')
  int get createdAtTimestamp => throw _privateConstructorUsedError;

  /// The unix timestamp of when the notification was read.
  @JsonKey(name: 'timestamp_read')
  int get readAtTimestamp => throw _privateConstructorUsedError;

  /// The read status of the notification as an integer.
  ///
  /// This is used internally by the API and should not be used by the client, use [read] instead.
  @JsonKey(name: 'status')
  int get readAsInt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationid') int id,
      @JsonKey(name: 'type') NotificationType type,
      @JsonKey(name: 'userid') int userId,
      @JsonKey(name: 'info') int? context,
      @JsonKey(name: 'timestamp') int createdAtTimestamp,
      @JsonKey(name: 'timestamp_read') int readAtTimestamp,
      @JsonKey(name: 'status') int readAsInt});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? userId = null,
    Object? context = freezed,
    Object? createdAtTimestamp = null,
    Object? readAtTimestamp = null,
    Object? readAsInt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAtTimestamp: null == createdAtTimestamp
          ? _value.createdAtTimestamp
          : createdAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      readAtTimestamp: null == readAtTimestamp
          ? _value.readAtTimestamp
          : readAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      readAsInt: null == readAsInt
          ? _value.readAsInt
          : readAsInt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationid') int id,
      @JsonKey(name: 'type') NotificationType type,
      @JsonKey(name: 'userid') int userId,
      @JsonKey(name: 'info') int? context,
      @JsonKey(name: 'timestamp') int createdAtTimestamp,
      @JsonKey(name: 'timestamp_read') int readAtTimestamp,
      @JsonKey(name: 'status') int readAsInt});
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$_Notification>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? userId = null,
    Object? context = freezed,
    Object? createdAtTimestamp = null,
    Object? readAtTimestamp = null,
    Object? readAsInt = null,
  }) {
    return _then(_$_Notification(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAtTimestamp: null == createdAtTimestamp
          ? _value.createdAtTimestamp
          : createdAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      readAtTimestamp: null == readAtTimestamp
          ? _value.readAtTimestamp
          : readAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      readAsInt: null == readAsInt
          ? _value.readAsInt
          : readAsInt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification extends _Notification {
  _$_Notification(
      {@JsonKey(name: 'notificationid') required this.id,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'userid') required this.userId,
      @JsonKey(name: 'info') this.context,
      @JsonKey(name: 'timestamp') required this.createdAtTimestamp,
      @JsonKey(name: 'timestamp_read') required this.readAtTimestamp,
      @JsonKey(name: 'status') required this.readAsInt})
      : super._();

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  /// The id of the notification.
  @override
  @JsonKey(name: 'notificationid')
  final int id;

  /// The type of the notification.
  ///
  /// Based on this, the [context] will be interpreted differently (see [Notification] for more details).
  @override
  @JsonKey(name: 'type')
  final NotificationType type;

  /// The id of the user that the notification is for.
  ///
  /// This will always be the id of the currently logged in user.
  @override
  @JsonKey(name: 'userid')
  final int userId;

  /// Additional information for the notification.
  ///
  /// This is interpreted differently based on the [type] (see [NotificationType] for more details).
  @override
  @JsonKey(name: 'info')
  final int? context;

  /// The unix timestamp of when the notification was created.
  @override
  @JsonKey(name: 'timestamp')
  final int createdAtTimestamp;

  /// The unix timestamp of when the notification was read.
  @override
  @JsonKey(name: 'timestamp_read')
  final int readAtTimestamp;

  /// The read status of the notification as an integer.
  ///
  /// This is used internally by the API and should not be used by the client, use [read] instead.
  @override
  @JsonKey(name: 'status')
  final int readAsInt;

  @override
  String toString() {
    return 'Notification(id: $id, type: $type, userId: $userId, context: $context, createdAtTimestamp: $createdAtTimestamp, readAtTimestamp: $readAtTimestamp, readAsInt: $readAsInt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAtTimestamp, createdAtTimestamp) ||
                other.createdAtTimestamp == createdAtTimestamp) &&
            (identical(other.readAtTimestamp, readAtTimestamp) ||
                other.readAtTimestamp == readAtTimestamp) &&
            (identical(other.readAsInt, readAsInt) ||
                other.readAsInt == readAsInt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, userId, context,
      createdAtTimestamp, readAtTimestamp, readAsInt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification extends Notification {
  factory _Notification(
      {@JsonKey(name: 'notificationid') required final int id,
      @JsonKey(name: 'type') required final NotificationType type,
      @JsonKey(name: 'userid') required final int userId,
      @JsonKey(name: 'info') final int? context,
      @JsonKey(name: 'timestamp') required final int createdAtTimestamp,
      @JsonKey(name: 'timestamp_read') required final int readAtTimestamp,
      @JsonKey(name: 'status') required final int readAsInt}) = _$_Notification;
  _Notification._() : super._();

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override

  /// The id of the notification.
  @JsonKey(name: 'notificationid')
  int get id;
  @override

  /// The type of the notification.
  ///
  /// Based on this, the [context] will be interpreted differently (see [Notification] for more details).
  @JsonKey(name: 'type')
  NotificationType get type;
  @override

  /// The id of the user that the notification is for.
  ///
  /// This will always be the id of the currently logged in user.
  @JsonKey(name: 'userid')
  int get userId;
  @override

  /// Additional information for the notification.
  ///
  /// This is interpreted differently based on the [type] (see [NotificationType] for more details).
  @JsonKey(name: 'info')
  int? get context;
  @override

  /// The unix timestamp of when the notification was created.
  @JsonKey(name: 'timestamp')
  int get createdAtTimestamp;
  @override

  /// The unix timestamp of when the notification was read.
  @JsonKey(name: 'timestamp_read')
  int get readAtTimestamp;
  @override

  /// The read status of the notification as an integer.
  ///
  /// This is used internally by the API and should not be used by the client, use [read] instead.
  @JsonKey(name: 'status')
  int get readAsInt;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
