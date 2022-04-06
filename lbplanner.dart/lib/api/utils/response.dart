part of lbplanner_api;

/// An HTTP response where the entire response body is known in advance.
/// This inplementation contains helper methods for a better workflow.
class Response extends http.Response {
  /// Creates a new HTTP response with a string body.
  Response(String body, int statusCode) : super(body, statusCode);

  /// Constructs an empty response with status code 200.
  Response.ok() : super("", 200);
}
