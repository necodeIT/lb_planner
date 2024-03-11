import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../widgets/widgets.dart';

/// Dashboard route.
class DashboardRoute extends StatelessWidget {
  /// Dashboard route.
  const DashboardRoute({Key? key}) : super(key: key);

  /// The height of the [DashboardStatusOverview] section.
  static const double statusOverViewHeight = 100;

  @override
  Widget build(BuildContext context) {
    var filler = TBAContainer();

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: DashboardTodaysTasks()),
              Spacing.medium(),
              Expanded(child: filler),
            ],
          ),
        ),
        Spacing.medium(),
        Expanded(
          // ignore: no-magic-number
          flex: 2,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: statusOverViewHeight),
                child: DashboardStatusOverview(),
              ),
              Spacing.medium(),
              // ignore: no-magic-number
              Expanded(flex: 3, child: filler),
            ],
          ),
        ),
        Spacing.medium(),
        Expanded(
          child: Column(
            children: [
              Expanded(child: DashboardExams()),
              Spacing.medium(),
              Expanded(child: filler),
            ],
          ),
        ),
      ],
    );
  }
}
