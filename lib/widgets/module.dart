part of lbplanner_widgets;

/// Displays the given [module] in a [ModuleItem].
class ModuleWidget extends LocalizedWidget {
  /// The [ModuleWidget] will display the [Course], the name and the [ModuleStatus].

  ModuleWidget.status({Key? key, required this.moduleId, this.showTag = true, this.contextMenu = true, this.shadow = false}) : super(key: key) {
    displayMode = ModuleWidgetDisyplayModes.status;
  }

  /// The [ModuleWidget] will display the [Course], the name and the deadline assignd by teachers.
  ModuleWidget.date({Key? key, required this.moduleId, this.showTag = true, this.contextMenu = true, this.shadow = false}) : super(key: key) {
    displayMode = ModuleWidgetDisyplayModes.date;
  }

  /// The [ModuleWidget] will display the [Course], the name and a [LpCheckbox] to mark that will be ticked off as soon as the module has the [ModuleStaus.uploaded] status.
  ModuleWidget.checkmark({Key? key, required this.moduleId, this.showTag = true, this.contextMenu = true, this.shadow = false}) : super(key: key) {
    displayMode = ModuleWidgetDisyplayModes.checkmark;
  }

  /// The id of the module to display.
  final int moduleId;

  /// Whether to show the context menu.
  final bool contextMenu;

  /// Whether to show the [Course] tag.
  final bool showTag;

  /// Determins how a [ModuleWidget] should be displayed.
  late final ModuleWidgetDisyplayModes displayMode;

  /// Whether to display drop shaodow.
  final bool shadow;

  /// The font size of the course tag.
  static const double tagSize = 12;

  /// The height of the module item.
  static const double height = 34;

  /// The font size of the module name.
  static const double fontSize = 14;

  /// The width of the module item.
  static const width = double.infinity;

  /// The elevation of the module item when [shadow] is set to true.
  // static const elevation = 2;
  static const elevation = 0;

  /// Formatter for the date if [displayMode] == [ModuleWidgetDisyplayModes.date].
  static final formatter = DateFormat('dd.MM');

  /// How long the user has to hover over the name in order for the tooltip to show the full name.
  static const Duration tooltipTrigger = Duration(seconds: 1);

  @override
  Widget build(BuildContext context, t) {
    return Consumer(builder: (context, ref, _) {
      var module = ref.watch(modulesProvider)[moduleId];

      if (module == null) return LpShimmer();

      var courses = ref.watch(coursesProvider);

      return ConditionalWidget(
        condition: courses.containsKey(module.courseId),
        trueWidget: (context) {
          var course = courses[module.courseId]!;

          return ConditionalWrapper(
            condition: contextMenu,
            wrapper: (context, child) => ContextMenuRegion(
              contextMenu: GenericContextMenu(
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    t.module_openUrl,
                    icon: LpIcon.contextMenu(
                      Icons.link,
                    ),
                    iconHover: LpIcon.contextMenu(
                      Icons.link,
                      color: accentColor,
                    ),
                    onPressed: () => launchUrl(Uri.parse(module.url)),
                  ),
                ],
              ),
              child: child,
            ),
            child: Container(
              padding: EdgeInsets.all(NcSpacing.xsSpacing),
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                color: secondaryColor,
                boxShadow: kElevationToShadow[shadow ? elevation : 0],
              ),
              child: Row(
                children: [
                  if (showTag)
                    LpTag(
                      text: course.shortname,
                      color: course.color,
                      fontSize: tagSize,
                    ),
                  if (showTag) NcSpacing.small(),
                  Expanded(
                    child: Tooltip(
                      waitDuration: tooltipTrigger,
                      message: module.name,
                      child: NcCaptionText(
                        module.name,
                        textAlign: showTag ? TextAlign.center : TextAlign.start,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                  ConditionalWidget(
                    condition: displayMode.isDate,
                    trueWidget: (context) => NcCaptionText(formatter.format(module.deadline!)),
                    falseWidget: (context) => ConditionalWidget(
                      condition: displayMode.isCheckmark,
                      trueWidget: (context) => LpCheckbox(value: module.status.isUploaded || module.status.isDone),
                      falseWidget: (context) {
                        Widget container(Color color, [IconData? icon, bool outlined = false]) => Container(
                              // ignore: no-magic-number
                              width: 18,
                              // ignore: no-magic-number
                              height: 18,
                              decoration: BoxDecoration(
                                color: outlined ? null : color,
                                border: Border.all(
                                  color: color,
                                  // ignore: no-magic-number
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(kRadius),
                              ),
                              child: outlined ? null : FittedBox(child: LpIcon(icon, color: buttonTextColor)),
                            );

                        switch (module.status) {
                          case ModuleStatus.uploaded:
                            return container(warningColor, Icons.remove);
                          case ModuleStatus.done:
                            return container(successColor, Icons.check);
                          case ModuleStatus.late:
                            return container(errorColor, FontAwesome.exclamation);
                          case ModuleStatus.pending:
                            return container(neutralColor, null, true);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
        falseWidget: (context) => LpShimmer(height: height, width: width),
      );
    });
  }
}

/// Determins how a [ModuleWidget] should be displayed.
enum ModuleWidgetDisyplayModes {
  /// The [ModuleWidget] will display the [Course], the name and the [ModuleStatus].
  status,

  /// The [ModuleWidget] will display the [Course], the name and the deadline assignd by teachers.
  date,

  /// The [ModuleWidget] will display the [Course], the name and a [LpCheckbox] to mark that will be ticked off as soon as the module has the [ModuleStaus.uploaded] status.
  checkmark,
}

/// Helper for [ModuleWidgetDisyplayModes].
extension ModuleWidgetDisyplayModesExtension on ModuleWidgetDisyplayModes {
  /// Whether this mode is [ModuleWidgetDisyplayModes.date].
  bool get isStatus => this == ModuleWidgetDisyplayModes.status;

  /// Whether this mode is [ModuleWidgetDisyplayModes.date].
  bool get isDate => this == ModuleWidgetDisyplayModes.date;

  /// Whether this mode is [ModuleWidgetDisyplayModes.checkmark].
  bool get isCheckmark => this == ModuleWidgetDisyplayModes.checkmark;
}
