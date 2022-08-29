// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return _Feedback.fromJson(json);
}

/// @nodoc
class _$FeedbackTearOff {
  const _$FeedbackTearOff();

  _Feedback call(
      {required int id,
      required int userId,
      required String content,
      String? comment,
      String? logFile,
      required FeedbackTypes type,
      required FeedbackStatus status,
      int? lastModifiedBy,
      DateTime? lastModified,
      required DateTime timestamp}) {
    return _Feedback(
      id: id,
      userId: userId,
      content: content,
      comment: comment,
      logFile: logFile,
      type: type,
      status: status,
      lastModifiedBy: lastModifiedBy,
      lastModified: lastModified,
      timestamp: timestamp,
    );
  }

  Feedback fromJson(Map<String, Object?> json) {
    return Feedback.fromJson(json);
  }
}

/// @nodoc
const $Feedback = _$FeedbackTearOff();

/// @nodoc
mixin _$Feedback {
  /// ID of the feedback
  int get id => throw _privateConstructorUsedError;

  /// The user who sent the feedback.
  int get userId => throw _privateConstructorUsedError;

  /// The content of the feedback.
  String get content => throw _privateConstructorUsedError;

  /// Notes admins may add to the feedback.
  String? get comment => throw _privateConstructorUsedError;

  /// Name of the client log file.
  String? get logFile => throw _privateConstructorUsedError;

  /// The type of the feedback.
  FeedbackTypes get type => throw _privateConstructorUsedError;

  /// The status of the feedback.
  FeedbackStatus get status => throw _privateConstructorUsedError;

  /// The id of the user who last modified the feedback.
  int? get lastModifiedBy => throw _privateConstructorUsedError;

  /// The date the feedback was last modified.
  DateTime? get lastModified => throw _privateConstructorUsedError;

  /// The date the feedback was created.
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackCopyWith<Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) then) =
      _$FeedbackCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      String content,
      String? comment,
      String? logFile,
      FeedbackTypes type,
      FeedbackStatus status,
      int? lastModifiedBy,
      DateTime? lastModified,
      DateTime timestamp});
}

/// @nodoc
class _$FeedbackCopyWithImpl<$Res> implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._value, this._then);

  final Feedback _value;
  // ignore: unused_field
  final $Res Function(Feedback) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? comment = freezed,
    Object? logFile = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? lastModifiedBy = freezed,
    Object? lastModified = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      logFile: logFile == freezed
          ? _value.logFile
          : logFile // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackTypes,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedbackStatus,
      lastModifiedBy: lastModifiedBy == freezed
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$FeedbackCopyWith<$Res> implements $FeedbackCopyWith<$Res> {
  factory _$FeedbackCopyWith(_Feedback value, $Res Function(_Feedback) then) =
      __$FeedbackCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      String content,
      String? comment,
      String? logFile,
      FeedbackTypes type,
      FeedbackStatus status,
      int? lastModifiedBy,
      DateTime? lastModified,
      DateTime timestamp});
}

/// @nodoc
class __$FeedbackCopyWithImpl<$Res> extends _$FeedbackCopyWithImpl<$Res>
    implements _$FeedbackCopyWith<$Res> {
  __$FeedbackCopyWithImpl(_Feedback _value, $Res Function(_Feedback) _then)
      : super(_value, (v) => _then(v as _Feedback));

  @override
  _Feedback get _value => super._value as _Feedback;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? comment = freezed,
    Object? logFile = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? lastModifiedBy = freezed,
    Object? lastModified = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_Feedback(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      logFile: logFile == freezed
          ? _value.logFile
          : logFile // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackTypes,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedbackStatus,
      lastModifiedBy: lastModifiedBy == freezed
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feedback extends _Feedback {
  const _$_Feedback(
      {required this.id,
      required this.userId,
      required this.content,
      this.comment,
      this.logFile,
      required this.type,
      required this.status,
      this.lastModifiedBy,
      this.lastModified,
      required this.timestamp})
      : assert(type != FeedbackTypes.bug || logFile != null,
            'Log file must be provided if the feedback is of type bug.'),
        super._();

  factory _$_Feedback.fromJson(Map<String, dynamic> json) =>
      _$$_FeedbackFromJson(json);

  @override

  /// ID of the feedback
  final int id;
  @override

  /// The user who sent the feedback.
  final int userId;
  @override

  /// The content of the feedback.
  final String content;
  @override

  /// Notes admins may add to the feedback.
  final String? comment;
  @override

  /// Name of the client log file.
  final String? logFile;
  @override

  /// The type of the feedback.
  final FeedbackTypes type;
  @override

  /// The status of the feedback.
  final FeedbackStatus status;
  @override

  /// The id of the user who last modified the feedback.
  final int? lastModifiedBy;
  @override

  /// The date the feedback was last modified.
  final DateTime? lastModified;
  @override

  /// The date the feedback was created.
  final DateTime timestamp;

  @override
  String toString() {
    return 'Feedback(id: $id, userId: $userId, content: $content, comment: $comment, logFile: $logFile, type: $type, status: $status, lastModifiedBy: $lastModifiedBy, lastModified: $lastModified, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Feedback &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.logFile, logFile) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.lastModifiedBy, lastModifiedBy) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(logFile),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(lastModifiedBy),
      const DeepCollectionEquality().hash(lastModified),
      const DeepCollectionEquality().hash(timestamp));

  @JsonKey(ignore: true)
  @override
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      __$FeedbackCopyWithImpl<_Feedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedbackToJson(this);
  }
}

abstract class _Feedback extends Feedback {
  const factory _Feedback(
      {required int id,
      required int userId,
      required String content,
      String? comment,
      String? logFile,
      required FeedbackTypes type,
      required FeedbackStatus status,
      int? lastModifiedBy,
      DateTime? lastModified,
      required DateTime timestamp}) = _$_Feedback;
  const _Feedback._() : super._();

  factory _Feedback.fromJson(Map<String, dynamic> json) = _$_Feedback.fromJson;

  @override

  /// ID of the feedback
  int get id;
  @override

  /// The user who sent the feedback.
  int get userId;
  @override

  /// The content of the feedback.
  String get content;
  @override

  /// Notes admins may add to the feedback.
  String? get comment;
  @override

  /// Name of the client log file.
  String? get logFile;
  @override

  /// The type of the feedback.
  FeedbackTypes get type;
  @override

  /// The status of the feedback.
  FeedbackStatus get status;
  @override

  /// The id of the user who last modified the feedback.
  int? get lastModifiedBy;
  @override

  /// The date the feedback was last modified.
  DateTime? get lastModified;
  @override

  /// The date the feedback was created.
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}
