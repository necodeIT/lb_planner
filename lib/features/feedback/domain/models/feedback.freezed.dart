// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return _Feedback.fromJson(json);
}

/// @nodoc
mixin _$Feedback {
  /// The ID of this feedback.
  int get id => throw _privateConstructorUsedError;

  /// The content of this feedback.
  String get content => throw _privateConstructorUsedError;

  /// The ID of the user who submitted this feedback.
  @JsonKey(name: "userid")
  int get userId => throw _privateConstructorUsedError;

  /// The type of this feedback.
  FeedbackType get type => throw _privateConstructorUsedError;

  /// Comments made by [modifiedByUserId] when reading this feedback.
  @JsonKey(name: "notes")
  String get comment => throw _privateConstructorUsedError;

  /// The read status of this feedback as int.
  ///
  /// This is used internally to map the API response. Use [read] instead.
  @JsonKey(name: "status")
  int get readAsInt => throw _privateConstructorUsedError;

  /// The timestamp when this feedback was created.
  ///
  /// This is used internally to map the API response. Use [createdAt] instead.
  @JsonKey(name: "timestamp")
  int get createdAtTimestamp => throw _privateConstructorUsedError;

  /// The timestamp when this feedback was last modified.
  ///
  /// This is used internally to map the API response. Use [modifiedAt] instead.
  @JsonKey(name: "lastmodified")
  int? get modifiedAtTimestamp => throw _privateConstructorUsedError;

  /// The ID of the user who last modified this feedback.
  @JsonKey(name: "lastmodifiedby")
  int? get modifiedByUserId => throw _privateConstructorUsedError;

  /// The path to the log file of the user who submitted this feedback.
  ///
  /// This will only be available if the user is making a bug report, i.e. [type] is [FeedbackType.bug].
  @JsonKey(name: "logfile")
  String? get logfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackCopyWith<Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) then) =
      _$FeedbackCopyWithImpl<$Res, Feedback>;
  @useResult
  $Res call(
      {int id,
      String content,
      @JsonKey(name: "userid") int userId,
      FeedbackType type,
      @JsonKey(name: "notes") String comment,
      @JsonKey(name: "status") int readAsInt,
      @JsonKey(name: "timestamp") int createdAtTimestamp,
      @JsonKey(name: "lastmodified") int? modifiedAtTimestamp,
      @JsonKey(name: "lastmodifiedby") int? modifiedByUserId,
      @JsonKey(name: "logfile") String? logfile});
}

/// @nodoc
class _$FeedbackCopyWithImpl<$Res, $Val extends Feedback>
    implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? userId = null,
    Object? type = null,
    Object? comment = null,
    Object? readAsInt = null,
    Object? createdAtTimestamp = null,
    Object? modifiedAtTimestamp = freezed,
    Object? modifiedByUserId = freezed,
    Object? logfile = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      readAsInt: null == readAsInt
          ? _value.readAsInt
          : readAsInt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAtTimestamp: null == createdAtTimestamp
          ? _value.createdAtTimestamp
          : createdAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAtTimestamp: freezed == modifiedAtTimestamp
          ? _value.modifiedAtTimestamp
          : modifiedAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiedByUserId: freezed == modifiedByUserId
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      logfile: freezed == logfile
          ? _value.logfile
          : logfile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeedbackCopyWith<$Res> implements $FeedbackCopyWith<$Res> {
  factory _$$_FeedbackCopyWith(
          _$_Feedback value, $Res Function(_$_Feedback) then) =
      __$$_FeedbackCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      @JsonKey(name: "userid") int userId,
      FeedbackType type,
      @JsonKey(name: "notes") String comment,
      @JsonKey(name: "status") int readAsInt,
      @JsonKey(name: "timestamp") int createdAtTimestamp,
      @JsonKey(name: "lastmodified") int? modifiedAtTimestamp,
      @JsonKey(name: "lastmodifiedby") int? modifiedByUserId,
      @JsonKey(name: "logfile") String? logfile});
}

/// @nodoc
class __$$_FeedbackCopyWithImpl<$Res>
    extends _$FeedbackCopyWithImpl<$Res, _$_Feedback>
    implements _$$_FeedbackCopyWith<$Res> {
  __$$_FeedbackCopyWithImpl(
      _$_Feedback _value, $Res Function(_$_Feedback) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? userId = null,
    Object? type = null,
    Object? comment = null,
    Object? readAsInt = null,
    Object? createdAtTimestamp = null,
    Object? modifiedAtTimestamp = freezed,
    Object? modifiedByUserId = freezed,
    Object? logfile = freezed,
  }) {
    return _then(_$_Feedback(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      readAsInt: null == readAsInt
          ? _value.readAsInt
          : readAsInt // ignore: cast_nullable_to_non_nullable
              as int,
      createdAtTimestamp: null == createdAtTimestamp
          ? _value.createdAtTimestamp
          : createdAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedAtTimestamp: freezed == modifiedAtTimestamp
          ? _value.modifiedAtTimestamp
          : modifiedAtTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiedByUserId: freezed == modifiedByUserId
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      logfile: freezed == logfile
          ? _value.logfile
          : logfile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feedback extends _Feedback {
  _$_Feedback(
      {required this.id,
      required this.content,
      @JsonKey(name: "userid") required this.userId,
      required this.type,
      @JsonKey(name: "notes") this.comment = "",
      @JsonKey(name: "status") required this.readAsInt,
      @JsonKey(name: "timestamp") required this.createdAtTimestamp,
      @JsonKey(name: "lastmodified") this.modifiedAtTimestamp,
      @JsonKey(name: "lastmodifiedby") this.modifiedByUserId,
      @JsonKey(name: "logfile") this.logfile})
      : super._();

  factory _$_Feedback.fromJson(Map<String, dynamic> json) =>
      _$$_FeedbackFromJson(json);

  /// The ID of this feedback.
  @override
  final int id;

  /// The content of this feedback.
  @override
  final String content;

  /// The ID of the user who submitted this feedback.
  @override
  @JsonKey(name: "userid")
  final int userId;

  /// The type of this feedback.
  @override
  final FeedbackType type;

  /// Comments made by [modifiedByUserId] when reading this feedback.
  @override
  @JsonKey(name: "notes")
  final String comment;

  /// The read status of this feedback as int.
  ///
  /// This is used internally to map the API response. Use [read] instead.
  @override
  @JsonKey(name: "status")
  final int readAsInt;

  /// The timestamp when this feedback was created.
  ///
  /// This is used internally to map the API response. Use [createdAt] instead.
  @override
  @JsonKey(name: "timestamp")
  final int createdAtTimestamp;

  /// The timestamp when this feedback was last modified.
  ///
  /// This is used internally to map the API response. Use [modifiedAt] instead.
  @override
  @JsonKey(name: "lastmodified")
  final int? modifiedAtTimestamp;

  /// The ID of the user who last modified this feedback.
  @override
  @JsonKey(name: "lastmodifiedby")
  final int? modifiedByUserId;

  /// The path to the log file of the user who submitted this feedback.
  ///
  /// This will only be available if the user is making a bug report, i.e. [type] is [FeedbackType.bug].
  @override
  @JsonKey(name: "logfile")
  final String? logfile;

  @override
  String toString() {
    return 'Feedback(id: $id, content: $content, userId: $userId, type: $type, comment: $comment, readAsInt: $readAsInt, createdAtTimestamp: $createdAtTimestamp, modifiedAtTimestamp: $modifiedAtTimestamp, modifiedByUserId: $modifiedByUserId, logfile: $logfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Feedback &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.readAsInt, readAsInt) ||
                other.readAsInt == readAsInt) &&
            (identical(other.createdAtTimestamp, createdAtTimestamp) ||
                other.createdAtTimestamp == createdAtTimestamp) &&
            (identical(other.modifiedAtTimestamp, modifiedAtTimestamp) ||
                other.modifiedAtTimestamp == modifiedAtTimestamp) &&
            (identical(other.modifiedByUserId, modifiedByUserId) ||
                other.modifiedByUserId == modifiedByUserId) &&
            (identical(other.logfile, logfile) || other.logfile == logfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      userId,
      type,
      comment,
      readAsInt,
      createdAtTimestamp,
      modifiedAtTimestamp,
      modifiedByUserId,
      logfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedbackCopyWith<_$_Feedback> get copyWith =>
      __$$_FeedbackCopyWithImpl<_$_Feedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedbackToJson(
      this,
    );
  }
}

abstract class _Feedback extends Feedback {
  factory _Feedback(
      {required final int id,
      required final String content,
      @JsonKey(name: "userid") required final int userId,
      required final FeedbackType type,
      @JsonKey(name: "notes") final String comment,
      @JsonKey(name: "status") required final int readAsInt,
      @JsonKey(name: "timestamp") required final int createdAtTimestamp,
      @JsonKey(name: "lastmodified") final int? modifiedAtTimestamp,
      @JsonKey(name: "lastmodifiedby") final int? modifiedByUserId,
      @JsonKey(name: "logfile") final String? logfile}) = _$_Feedback;
  _Feedback._() : super._();

  factory _Feedback.fromJson(Map<String, dynamic> json) = _$_Feedback.fromJson;

  @override

  /// The ID of this feedback.
  int get id;
  @override

  /// The content of this feedback.
  String get content;
  @override

  /// The ID of the user who submitted this feedback.
  @JsonKey(name: "userid")
  int get userId;
  @override

  /// The type of this feedback.
  FeedbackType get type;
  @override

  /// Comments made by [modifiedByUserId] when reading this feedback.
  @JsonKey(name: "notes")
  String get comment;
  @override

  /// The read status of this feedback as int.
  ///
  /// This is used internally to map the API response. Use [read] instead.
  @JsonKey(name: "status")
  int get readAsInt;
  @override

  /// The timestamp when this feedback was created.
  ///
  /// This is used internally to map the API response. Use [createdAt] instead.
  @JsonKey(name: "timestamp")
  int get createdAtTimestamp;
  @override

  /// The timestamp when this feedback was last modified.
  ///
  /// This is used internally to map the API response. Use [modifiedAt] instead.
  @JsonKey(name: "lastmodified")
  int? get modifiedAtTimestamp;
  @override

  /// The ID of the user who last modified this feedback.
  @JsonKey(name: "lastmodifiedby")
  int? get modifiedByUserId;
  @override

  /// The path to the log file of the user who submitted this feedback.
  ///
  /// This will only be available if the user is making a bug report, i.e. [type] is [FeedbackType.bug].
  @JsonKey(name: "logfile")
  String? get logfile;
  @override
  @JsonKey(ignore: true)
  _$$_FeedbackCopyWith<_$_Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}
