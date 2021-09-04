import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';

class Course {
  Course(this.id, this.name, this.modules, this.tag, this.tags, Color? color) {
    var filter = name.toLowerCase();

    splitCharachters.forEach((i) => filter = filter.replaceAll(i, splitCharacter));

    var split = name.replaceAll("-", splitCharacter).split(splitCharacter);

    tag = split.length >= 0 ? split.first : name;
    this.color = color ?? colorPresets[Random().nextInt(colorPresets.length)];
  }

  final int id;
  final String name;
  final List<int> modules;

  late final String tag;
  late final List<CourseTags> tags;
  late Color color;

  StatusProfile getStats() {
    int done = 0;
    int late = 0;
    int pending = 0;
    int uploaded = 0;

    modules.forEach((i) {
      switch (DB.modules[i]!.status) {
        case ModuleStatus.Done:
          done++;
          break;
        case ModuleStatus.Uploaded:
          uploaded++;
          break;
        case ModuleStatus.Late:
          late++;
          break;
        case ModuleStatus.Pending:
          pending++;
          break;
      }
    });

    return StatusProfile(done: done, late: late, uploaded: uploaded, pending: pending);
  }

  double getAverageGrade() {
    int sum = 0;

    modules.forEach((i) {
      var module = DB.modules[i];

      if (module!.grade == Grade.None) return;

      sum += Grade.values.indexOf(module.grade) + 1;
    });

    return sum >= 0 ? sum / modules.length : 0;
  }

  static const List<String> splitCharachters = ["-"];
  static const List<Color> colorPresets = [Colors.red];
  static const String splitCharacter = " ";
}
