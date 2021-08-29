import 'package:desktop/widgets/view.dart';
import 'package:desktop/widgets/views/dashboard/exams.dart';
import 'package:desktop/widgets/views/dashboard/svg/holidays.dart';
import 'package:desktop/widgets/views/dashboard/svg/lb_planner.dart';
import 'package:desktop/widgets/views/dashboard/svg/timetable.dart';
import 'package:desktop/widgets/views/dashboard/todays_task.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static const double titleSize = 25;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return View(
      title: "Dashboard",
      content: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: NcContainer(
                    body: Expanded(
                      child: ListView(
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
                    ),
                    // body: NcCaptionText("Today's Tasks"),
                    label: NcCaptionText(
                      "Today's Tasks",
                      fontSize: titleSize,
                    ),
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  child: NcContainer(
                    body: Expanded(
                        child: NcVectorImage(
                      code: holidaysTBA,
                      aliignment: Alignment.bottomCenter,
                    )),
                    // body: NcCaptionText("Today's Tasks"),
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
                    body: Expanded(child: Container()),
                    // body: NcCaptionText("Today's Tasks"),
                    label: NcCaptionText(
                      "Status Overview",
                      fontSize: titleSize,
                    ),
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  flex: 5,
                  child: NcContainer(
                    body: Expanded(
                        child: NcVectorImage(
                      code: timetableTBA,
                      aliignment: Alignment.bottomCenter,
                    )),
                    // body: NcCaptionText("Today's Tasks"),
                    label: NcCaptionText(
                      "Timelable (TBA)",
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
                    body: Expanded(
                      child: ListView(
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
                          DashboardExamItem(
                            id: 0,
                          ),
                        ],
                      ),
                    ),
                    // body: NcCaptionText("Today's Tasks"),
                    label: NcCaptionText(
                      "Exams",
                      fontSize: titleSize,
                    ),
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  child: NcContainer(
                    body: Expanded(
                        child: NcVectorImage(
                      code: lb_plannerTBA,
                      aliignment: Alignment.bottomCenter,
                    )),
                    // body: NcCaptionText("Today's Tasks"),
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