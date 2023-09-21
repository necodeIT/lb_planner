// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HttpResponse {
  /// The HTTP status code.
  int? get statusCode => throw _privateConstructorUsedError;

  /// The HTTP response body.
  dynamic get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HttpResponseCopyWith<HttpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResponseCopyWith<$Res> {
  factory $HttpResponseCopyWith(
          HttpResponse value, $Res Function(HttpResponse) then) =
      _$HttpResponseCopyWithImpl<$Res, HttpResponse>;
  @useResult
  $Res call({int? statusCode, dynamic body});
}

/// @nodoc
class _$HttpResponseCopyWithImpl<$Res, $Val extends HttpResponse>
    implements $HttpResponseCopyWith<$Res> {
  _$HttpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HttpResponseCopyWith<$Res>
    implements $HttpResponseCopyWith<$Res> {
  factory _$$_HttpResponseCopyWith(
          _$_HttpResponse value, $Res Function(_$_HttpResponse) then) =
      __$$_HttpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? statusCode, dynamic body});
}

/// @nodoc
class __$$_HttpResponseCopyWithImpl<$Res>
    extends _$HttpResponseCopyWithImpl<$Res, _$_HttpResponse>
    implements _$$_HttpResponseCopyWith<$Res> {
  __$$_HttpResponseCopyWithImpl(
      _$_HttpResponse _value, $Res Function(_$_HttpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_HttpResponse(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_HttpResponse implements _HttpResponse {
  _$_HttpResponse({required this.statusCode, this.body});

  /// The HTTP status code.
  @override
  final int? statusCode;

  /// The HTTP response body.
  @override
  final dynamic body;

  @override
  String toString() {
    return 'HttpResponse(statusCode: $statusCode, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpResponseCopyWith<_$_HttpResponse> get copyWith =>
      __$$_HttpResponseCopyWithImpl<_$_HttpResponse>(this, _$identity);
}

abstract class _HttpResponse implements HttpResponse {
  factory _HttpResponse({required final int? statusCode, final dynamic body}) =
      _$_HttpResponse;

  @override

  /// The HTTP status code.
  int? get statusCode;
  @override

  /// The HTTP response body.
  dynamic get body;
  @override
  @JsonKey(ignore: true)
  _$$_HttpResponseCopyWith<_$_HttpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
