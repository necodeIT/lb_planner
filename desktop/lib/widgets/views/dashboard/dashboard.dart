import 'package:desktop/widgets/view.dart';
import 'package:desktop/widgets/views/dashboard/exams.dart';
import 'package:desktop/widgets/views/dashboard/status_overview/status_overview.dart';
import 'package:desktop/widgets/views/dashboard/svg/holidays.dart';
import 'package:desktop/widgets/views/dashboard/svg/lb_planner.dart';
import 'package:desktop/widgets/views/dashboard/svg/timetable.dart';
import 'package:desktop/widgets/views/dashboard/todays_task.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static const double titleSize = 25;

  @override
  Widget build(BuildContext context) {
    // TODO: StatusProfile stats = User.current.plan.stats();
    StatusProfile stats = StatusProfile(done: 10, late: 5, uploaded: 20, pending: 15);

    return View(
      title: "Dashboard",
      content: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: NcContainer(
                    body: ListView(
                      // behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                      children: [
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0),
                        DashboardTodaysTasksItem(id: 0, margin: false),
                      ],
                    ),
                    label: NcCaptionText(
                      "Today's Tasks",
                      fontSize: titleSize,
                    ),
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  child: NcContainer(
                    body: NcVectorImage(
                      code: holidaysTBA,
                      aliignment: Alignment.bottomCenter,
                    ),
                    label: NcCaptionText(
                      "Holidays (TBA)",
                      fontSize: titleSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          NcSpacing.large(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: NcContainer(
                    body: StatusOverview(stats: stats),
                    label: NcCaptionText(
                      "Status Overview",
                      fontSize: titleSize,
                    ),
                    trailingIcon: Row(
                      children: [
                        NcTag(
                          text: stats.done.toString(),
                          backgroundColor: NcThemes.current.doneColor,
                          height: 30,
                          width: 30,
                        ),
                        NcSpacing.small(),
                        NcTag(
                          text: stats.uploaded.toString(),
                          backgroundColor: NcThemes.current.uploadedColor,
                          height: 30,
                          width: 30,
                        ),
                        NcSpacing.small(),
                        NcTag(
                          text: stats.late.toString(),
                          backgroundColor: NcThemes.current.lateColor,
                          height: 30,
                          width: 30,
                        ),
                        NcSpacing.small(),
                        NcTag(
                          text: stats.pending.toString(),
                          backgroundColor: NcThemes.current.pendingColor,
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  flex: 5,
                  child: NcContainer(
                    body: NcVectorImage(
                      code: timetableTBA,
                      aliignment: Alignment.bottomCenter,
                    ),
                    label: NcCaptionText(
                      "Timetable (TBA)",
                      fontSize: titleSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          NcSpacing.large(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: NcContainer(
                    body: ListView(
                      // behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                      children: [
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0),
                        DashboardExamItem(id: 0, margin: false),
                      ],
                    ),
                    label: NcCaptionText(
                      "Exams",
                      fontSize: titleSize,
                    ),
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  child: NcContainer(
                    body: NcVectorImage(
                      code: lb_plannerTBA,
                      aliignment: Alignment.bottomCenter,
                    ),
                    label: NcCaptionText(
                      "LB Planner (TBA)",
                      fontSize: titleSize,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

     // if (User.current.plan.moduleDates.keys.isNotEmpty)
                          //   for (int id in User.current.plan.moduleDates.keys)
                          //     if (User.current.plan.moduleDates[id]!.year == now.year && User.current.plan.moduleDates[id]!.month == now.month && User.current.plan.moduleDates[id]!.day == now.day) DashboardTodaysTasksItem(id: id)
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),
                          // DashboardTodaysTasksItem(id: 0),