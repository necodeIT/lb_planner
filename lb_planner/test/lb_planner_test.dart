import 'dart:convert';

import 'package:lb_planner/api.dart';
import 'package:lb_planner/data.dart';

void main() async {
  var userR = await MoodleAPI.login("webservice_proj_lbplaner", "ZumTag32%Kum");

  if (userR.isError) return print(userR.errorMessage);

  print(userR.value.token);

  var infoR = await MoodleAPI.loadUser(userR.value);

  if (infoR.isError) return print(infoR.errorMessage);

  print(infoR.value.name);

  var info = infoR.value;

  User.current = User(info.id, info.token, info.name, (await MoodleAPI.loadPlan(info.token)).value, (await MoodleAPI.loadSettings(info.token)).value, info.permissions);

  var response = await MoodleAPI.loadCourses();

  if (response.isError) return print(json.encode(response.errorMessage));

  print(response.value.first.name);
  print(response.value.first.modules.first);
}
