import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/shared/domain/domain.dart';

part 'http_response.freezed.dart';

/// Represents an HTTP response returned by the [NetworkService].
@freezed
class HttpResponse<T> with _$HttpResponse<T> {
  const HttpResponse._();

  /// Represents an HTTP response returned by the [NetworkService].
  factory HttpResponse({
    /// The HTTP status code.
    required int? statusCode,

    /// The HTTP response body.
    T? body,
  }) = _HttpResponse;

  /// `true` [statusCode] is 200.
  bool get isOk => statusCode == 200;

  /// `true` [statusCode] is not 200.
  bool get isNotOk => !isOk;
}