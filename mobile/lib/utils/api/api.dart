import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:lb_planner/utils/api/data/token.dart';
import 'response.dart';

const String service = "service=moodle_mobile_app";
const String format = "moodlewsrestformat=json";

bool _certificateCheck(X509Certificate cert, String host, int port) => true;

final _ioClient = new HttpClient()..badCertificateCallback = _certificateCheck;

final http.Client client = IOClient(_ioClient);

String _error(String message) => "Internal Error: $message";

Future<Response<Token>> login(String username, String password) async {
  try {
    final response = await client.get(Uri.parse("https://elearning.tgm.ac.at/login/token.php?username=$username&password=$password&$format&$service"));

    Map<String, dynamic> data = json.decode(response.body);

    if (data["error"] != null) return new Response<Token>(errorMessage: data["error"]);

    Token token = new Token(token: data["token"], privateToken: data["privatetoken"]);

    return new Response<Token>(value: token);
  } catch (e) {
    return new Response<Token>(errorMessage: _error(e.toString()));
  }
}
