import 'dart:convert';

import 'package:lb_planner/api/api_response.dart';
import 'package:lb_planner/data.dart';
import 'utils.dart';

class MoodleAPI {
  static List<int> getAdmins() {
    return [10, 5, 6];
  }

  static List<int> getMods() {
    List<int> mods = List.empty(growable: true);
    if (User.current == null) return mods;

    for (var i = 0; i < 10; i++) {
      mods.add(i);
    }

    return mods;
  }

  static Future<ApiResponse<Token>> login(String username, String password) async {
    try {
      var response = await client.get(Uri.parse("https://elearning.tgm.ac.at/login/token.php?username=$username&password=$password&$format&$service"));

      Map<String, dynamic> data = json.decode(response.body);

      var error = data["error"];

      if (error != null) return ApiResponse.error(error);

      var token = Token(token: data["token"], privateToken: data["privatetoken"]);

      return ApiResponse(token);
    } catch (e) {
      return ApiResponse.error(error(e.toString()));
    }
  }
}
