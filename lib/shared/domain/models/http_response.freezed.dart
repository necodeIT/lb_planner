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
mixin _$HttpResponse<T> {
  /// The HTTP status code.
  int? get statusCode => throw _privateConstructorUsedError;

  /// The HTTP response body.
  T? get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HttpResponseCopyWith<T, HttpResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResponseCopyWith<T, $Res> {
  factory $HttpResponseCopyWith(
          HttpResponse<T> value, $Res Function(HttpResponse<T>) then) =
      _$HttpResponseCopyWithImpl<T, $Res, HttpResponse<T>>;
  @useResult
  $Res call({int? statusCode, T? body});
}

/// @nodoc
class _$HttpResponseCopyWithImpl<T, $Res, $Val extends HttpResponse<T>>
    implements $HttpResponseCopyWith<T, $Res> {
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
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HttpResponseCopyWith<T, $Res>
    implements $HttpResponseCopyWith<T, $Res> {
  factory _$$_HttpResponseCopyWith(
          _$_HttpResponse<T> value, $Res Function(_$_HttpResponse<T>) then) =
      __$$_HttpResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? statusCode, T? body});
}

/// @nodoc
class __$$_HttpResponseCopyWithImpl<T, $Res>
    extends _$HttpResponseCopyWithImpl<T, $Res, _$_HttpResponse<T>>
    implements _$$_HttpResponseCopyWith<T, $Res> {
  __$$_HttpResponseCopyWithImpl(
      _$_HttpResponse<T> _value, $Res Function(_$_HttpResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_HttpResponse<T>(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_HttpResponse<T> implements _HttpResponse<T> {
  _$_HttpResponse({required this.statusCode, this.body});

  /// The HTTP status code.
  @override
  final int? statusCode;

  /// The HTTP response body.
  @override
  final T? body;

  @override
  String toString() {
    return 'HttpResponse<$T>(statusCode: $statusCode, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpResponse<T> &&
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
  _$$_HttpResponseCopyWith<T, _$_HttpResponse<T>> get copyWith =>
      __$$_HttpResponseCopyWithImpl<T, _$_HttpResponse<T>>(this, _$identity);
}

abstract class _HttpResponse<T> implements HttpResponse<T> {
  factory _HttpResponse({required final int? statusCode, final T? body}) =
      _$_HttpResponse<T>;

  @override

  /// The HTTP status code.
  int? get statusCode;
  @override

  /// The HTTP response body.
  T? get body;
  @override
  @JsonKey(ignore: true)
  _$$_HttpResponseCopyWith<T, _$_HttpResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
