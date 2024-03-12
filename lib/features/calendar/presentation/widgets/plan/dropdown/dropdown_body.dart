import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/shared/shared.dart';

/// Dropdown body.
class CalendarPlanDropDownBody extends StatefulWidget {
  /// Dropdown body.
  const CalendarPlanDropDownBody({Key? key, required this.close})
      : super(key: key);

  /// Callback to close the dropdown.
  final VoidCallback close;

  /// Builder for the body.
  static CalendarPlanDropDownBody popupBuilder(
          BuildContext context, VoidCallback close) =>
      CalendarPlanDropDownBody(close: close);

  /// The font size of the dropdown.
  static const double fontSize = 15.0;

  @override
  State<CalendarPlanDropDownBody> createState() =>
      _CalendarPlanDropDownBodyState();
}

class _CalendarPlanDropDownBodyState extends State<CalendarPlanDropDownBody> {
  bool _showModules = true;
  bool planNameEditMode = false;

  Future? planNameFuture;

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _planNameController = TextEditingController();

  void _enterEditMode(WidgetRef ref) {
    if (planNameFuture != null) return;

    var plan = ref.read(planProvider);

    setState(() {
      planNameEditMode = true;

      _planNameController.text = plan.name;
    });
  }

  void exitEditMode() {
    if (planNameFuture != null) return;

    setState(() {
      planNameEditMode = false;
    });
  }

  void setPlanName(WidgetRef ref) async {
    var controller = ref.read(planController);
    var plan = ref.read(planProvider);

    if (plan.name == _planNameController.text) {
      exitEditMode();
      return;
    }

    setState(() {
      planNameFuture = controller.setPlanName(_planNameController.text);
    });

    await planNameFuture;

    if (!mounted) return;

    setState(() {
      planNameFuture = null;
      planNameEditMode = false;
    });
  }

  void showModules() {
    setState(() {
      _searchController.text = "";
      _showModules = true;
    });
  }

  void showMembers() {
    setState(() {
      _searchController.text = "";
      _showModules = false;
    });
  }

  @override
  initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);
      var user = ref.watch(userProvider);

      var hasWriteAccess =
          (plan.members[user.id] ?? PlanAccessLevels.read).index <
              PlanAccessLevels.write.index;

      return LpContainer(
        trailing: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConditionalWidget(
                condition: planNameEditMode,
                ifTrue: Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: Spacing.mediumSpacing),
                    child: LpTextField(
                      placeholder:
                          t.calendar_plan_dropdown_planName_placeholder,
                      onCancel: exitEditMode,
                      onUnfocus: exitEditMode,
                      autoFocus: true,
                      controller: _planNameController,
                      onSubmitted: (text) => setPlanName(ref),
                      suffix: planNameFuture != null
                          ? CircularProgressIndicator()
                          : null,
                    ),
                  ),
                ),
                ifFalse: Expanded(
                  child: LpGestureDetector(
                    cursor: hasWriteAccess
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.basic,
                    onDoubleTap:
                        !hasWriteAccess ? null : () => _enterEditMode(ref),
                    child: NcTitleText(plan.name,
                        fontSize: LpContainer.titleFontSize),
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.close,
                child: Icon(
                  Icons.close,
                  color: context.theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
        // ignore: no-magic-number
        width: screen.width * .2,
        // ignore: no-magic-number
        height: screen.height * 0.6,
        child: Column(
          children: [
            Spacing.medium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Spacing.mediumSpacing),
                  child: CalendarPlanDropdownHeader(
                    active: _showModules,
                    onTap: showModules,
                    title: t.calendar_plan_dropdown_modules_title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: Spacing.mediumSpacing),
                  child: CalendarPlanDropdownHeader(
                    active: !_showModules,
                    onTap: showMembers,
                    title: t.calendar_plan_dropdown_members_title,
                  ),
                ),
              ],
            ),
            Spacing.small(),
            Expanded(
              child: PageTransitionSwitcher(
                // reverse: lastMonth.isBefore(month),
                duration: Duration(milliseconds: 500),
                child: ConditionalWidget(
                  key: ValueKey(_showModules),
                  condition: _showModules,
                  ifTrue: CalendarPlanDropDwonModules(
                      searchController: _searchController),
                  ifFalse: CalendarPlanDropDownMembers(
                      searchController: _searchController),
                ),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) =>
                        SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical,
                  child: child,
                  fillColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
