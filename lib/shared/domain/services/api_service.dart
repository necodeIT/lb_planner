import 'package:lb_planner/shared/domain/services/services.dart';
import 'package:lb_planner/shared/domain/models/models.dart';
import 'package:logging/logging.dart';

/// Abstracts the communication with an API using [NetworkService].
abstract class ApiService {
  /// The [Logger] instance for this class.
  Logger get log => Logger("ApiService.$runtimeType");

  /// Abstracts the communication with an API using [NetworkService].
  final NetworkService networkService;

  /// The [NetworkService] used to communicate with the Moodle-API.
  ApiService(this.networkService);

  /// Calls the specified [function] on the Moodle-API.
  ///
  /// If [redact] is set to true, the response/request body will not be logged.
  Future<HttpResponse<JSON>> callFunction(
      {required String function,
      required String token,
      required JSON body,
      bool redact = false});
}
