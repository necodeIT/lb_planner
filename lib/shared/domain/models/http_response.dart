import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/shared/domain/domain.dart';

part 'http_response.freezed.dart';

@freezed

/// Represents an HTTP response returned by the [NetworkService].
class HttpResponse with _$HttpResponse {
  /// Represents an HTTP response returned by the [NetworkService].
  factory HttpResponse({
    /// The HTTP status code.
    required int? statusCode,

    /// The HTTP response body.
    dynamic body,
  }) = _HttpResponse;
}
