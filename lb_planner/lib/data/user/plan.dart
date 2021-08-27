import 'package:lb_planner/data/enums/plan_access.dart';

class Plan {
  Plan(this.access, this.moduleDates);

  final Map<int, PlanAccess> access;
  final Map<int, DateTime> moduleDates;
}
