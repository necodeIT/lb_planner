import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:lb_planner/data.dart';

const String service = "service=moodle_mobile_app";
const String format = "moodlewsrestformat=json";

bool _certificateCheck(X509Certificate cert, String host, int port) => true;

final _ioClient = new HttpClient()..badCertificateCallback = _certificateCheck;

final http.Client _client = IOClient(_ioClient);

http.Client get client => _client;

String error(String message) => "Internal Error: $message";

String function(String name, Map<String, dynamic> args) {
  var url = "https://elearning.tgm.ac.at/webservice/rest/server.php?wstoken=${User.current?.token.privateToken}&$format&wsfunction=";

  args.forEach((key, value) => url += "&$key=$value");

  return url;
}
