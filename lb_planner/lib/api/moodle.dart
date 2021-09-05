import 'dart:convert';

import 'package:lb_planner/api/api_response.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/data/user/user_info.dart';
import 'package:lb_planner/ui/themes/themes.dart';
import 'utils.dart';

class MoodleAPI {
  static Future<List<int>> getAdmins() async {
    // TODO: get admins from server

    return [];
  }

  static Future<List<int>> getMods(Token token) async {
    // TODO: get mods from server

    return [];
  }

  static Future<List<UserInfo>> getRegisteredUsers() async {
    // TODO: get all registerd users UserInfo.restricted
    return [];
  }

  static Future<ApiResponse<Token>> login(String username, String password) async {
    try {
      var response = await client.get(Uri.parse("https://elearning.tgm.ac.at/login/token.php?username=$username&password=$password&$format&service=$service"));

      Map<String, dynamic> data = json.decode(response.body);

      var error = data["error"];

      if (error != null) return ApiResponse.error(error);

      var token = Token(token: data["token"], privateToken: data["privatetoken"]);

      return ApiResponse.success(token);
    } catch (e) {
      return ApiResponse.error(error(e.toString()));
    }
  }

  static Future<ApiResponse<UserInfo>> loadUser(Token token) async {
    try {
      var response = await client.get(function("core_webservice_get_site_info", {"wstoken": token.token, "serviceshortnames[]": service}));

      Map<String, dynamic> data = json.decode(response.body);

      var error = data["errorcode"];

      if (error != null) return ApiResponse.error(error);

      int id = data["userid"];
      String name = data["username"];

      var admins = await getAdmins();
      var mods = await getAdmins();
      var users = await getRegisteredUsers();

      UserPermissions permissions = admins.contains(id)
          ? UserPermissions.Admin
          : mods.contains(id)
              ? UserPermissions.Moderator
              : UserPermissions.Student;

      return ApiResponse.success(UserInfo(id, name, token, permissions, users.any((info) => info.id == id)));
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  static Future<ApiResponse<List<Course>>> loadCourses() async {
    try {
      var response = await client.get(function("core_enrol_get_users_courses", {"userid": User.current.id}));

      var data = json.decode(response.body);

      try {
        var error = data["errorcode"];

        if (error != null) return ApiResponse.error(error);
      } catch (e) {}

      var courses = List<Course>.empty();

      // List<dynamic> data = catgirl.values.first;

      for (var course in data) {
        // TODO: get course color from settings if user is not new
        int id = course["id"];
        var modules = await loadModules(id);

        if (modules.isError) return ApiResponse.error(modules.errorMessage);

        courses.add(Course(id, course["shortname"], modules.value.map<int>((e) => e.id).toList(), null));
      }

      return ApiResponse.success(courses);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  static Future<ApiResponse<List<Module>>> loadModules(int courseID) async {
    try {
      var response = await client.get(function("core_course_get_contents", {"courseid": courseID}));

      var data = json.decode(response.body);
      try {
        var error = data["errorcode"];

        if (error != null) return ApiResponse.error(error);
      } catch (e) {}

      var modules = List<Module>.empty();

      var catgirl = data.first["modules"];

      catgirl.forEach((module) {
        // TODO: get "isEnabled" if user is not new
        // TODO: get grade from moodle
        // TODO: "customdata": "{\"duedate\":1603464600}",
        // TODO: evaluate status
        // TODO: get deadline

        if (module["modplural"] != "Aufgaben") return;

        modules.add(Module(false, module["id"], module["shortname"], module["url"], Grade.None, ModuleStatus.Pending, DateTime.now(), courseID));
      });

      return ApiResponse.success(modules);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  static Future<ApiResponse<Plan>> loadPlan(Token token) async {
    // TODO: load plan from server

    return ApiResponse.success(Plan({}, {}));
  }

  static Future<ApiResponse<Settings>> loadSettings(Token token) async {
    // TODO: load settings from server

    return ApiResponse.success(Settings(NcThemes.sakura.name, {}));
  }

  void registerUser() {
    // TODO: register user
    // send default settings and selected courses
  }
}
