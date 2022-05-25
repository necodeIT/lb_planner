part of lbplanner_routes;

/// The TestRoute to Test the widgets
class TestRoute extends StatelessWidget {
  /// The TestRoute to Test the widgets
  const TestRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(routeName: "/test", builder: (_) => TestRoute());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        LpButton(
          text: "lpShowConfirmDialog",
          onPressed: () {
            lpShowConfirmDialog(context, title: "Test", message: "Test");
          },
        ),
        NcSpacing.medium(),
        LpButton(
          text: "lpShowAlertDialog",
          onPressed: () {
            lpShowAlertDialog(context, title: "Test", message: "Test");
          },
        ),
        NcSpacing.medium(),
        Consumer(
          builder: (context, ref, _) => LpButton(
            text: "Fetch modules",
            onPressed: ref.read(modulesController).fetchModules,
          ),
        ),
        NcSpacing.medium(),
      ],
    );
  }
}
