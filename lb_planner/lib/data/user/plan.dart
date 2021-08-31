import 'package:lb_planner/data.dart';

class Plan {
  Plan(this.access, this.moduleDates);

  final Map<int, PlanAccess> access;
  final Map<int, DateTime> moduleDates;

  StatusProfile getStats() {
    int done = 0;
    int late = 0;
    int pending = 0;
    int uploaded = 0;

    moduleDates.keys.forEach((i) {
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
}
