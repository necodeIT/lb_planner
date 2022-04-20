part of lbplanner_routes;

/// The TestRoute to Test the widgets
class TestRoute extends StatelessWidget {
  /// The TestRoute to Test the widgets
  const TestRoute({Key? key}) : super(key: key);

  /// The route name for Test
  static const routeName = "/test";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LpButton(
          text: "lpShowConfirmDialog",
          onPressed: () {
            lpShowConfirmDialog(context, title: "Test", body: NcBodyText("Test"));
          },
        ),
        NcSpacing.medium(),
        LpButton(
          text: "lpShowAlertDialog",
          onPressed: () {
            lpShowAlertDialog(context, title: "Test", body: NcBodyText("Test"));
          },
        ),
        NcSpacing.medium(),
        Consumer(
          builder: (context, ref, _) => LpButton(
            text: "Fetch modules",
            onPressed: ref.read(modulesController).fetchModules,
          ),
        ),
      ],
    );
  }
}
