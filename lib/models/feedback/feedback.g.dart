// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feedback _$$_FeedbackFromJson(Map<String, dynamic> json) => _$_Feedback(
      id: json['id'] as int,
      userId: json['userId'] as int,
      content: json['content'] as String,
      comment: json['comment'] as String? ?? "",
      logFile: json['logFile'] as String? ?? "",
      type: $enumDecode(_$FeedbackTypesEnumMap, json['type']),
      status: $enumDecode(_$FeedbackStatusEnumMap, json['status']),
      lastModifiedBy: json['lastModifiedBy'] as int?,
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$_FeedbackToJson(_$_Feedback instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'content': instance.content,
      'comment': instance.comment,
      'logFile': instance.logFile,
      'type': _$FeedbackTypesEnumMap[instance.type]!,
      'status': _$FeedbackStatusEnumMap[instance.status]!,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModified': instance.lastModified?.toIso8601String(),
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$FeedbackTypesEnumMap = {
  FeedbackTypes.suggestion: 'suggestion',
  FeedbackTypes.bug: 'bug',
  FeedbackTypes.error: 'error',
  FeedbackTypes.other: 'other',
};

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.unread: 'unread',
  FeedbackStatus.read: 'read',
};
