// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feedback _$$_FeedbackFromJson(Map<String, dynamic> json) => _$_Feedback(
      id: json['id'] as int,
      content: json['content'] as String,
      userId: json['userid'] as int,
      type: $enumDecode(_$FeedbackTypeEnumMap, json['type']),
      comment: json['notes'] as String? ?? "",
      readAsInt: json['status'] as int,
      createdAtTimestamp: json['timestamp'] as int,
      modifiedAtTimestamp: json['lastmodified'] as int?,
      modifiedByUserId: json['lastmodifiedby'] as int?,
      logfile: json['logfile'] as String?,
    );

Map<String, dynamic> _$$_FeedbackToJson(_$_Feedback instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'userid': instance.userId,
      'type': _$FeedbackTypeEnumMap[instance.type]!,
      'notes': instance.comment,
      'status': instance.readAsInt,
      'timestamp': instance.createdAtTimestamp,
      'lastmodified': instance.modifiedAtTimestamp,
      'lastmodifiedby': instance.modifiedByUserId,
      'logfile': instance.logfile,
    };

const _$FeedbackTypeEnumMap = {
  FeedbackType.suggestion: 0,
  FeedbackType.bug: 1,
  FeedbackType.typo: 2,
  FeedbackType.other: 3,
};
