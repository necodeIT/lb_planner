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
          child: Text("Test"),
          onPressed: () {
            lpShowConfirmDialog(context, title: "Test", body: NcBodyText("Test"));
          },
        ),
        NcSpacing.medium(),
        LpButton(
          child: Text("Test"),
          onPressed: () {
            lpShowAlertDialog(context, title: "Test", body: NcBodyText("Test"));
          },
        ),
      ],
    );
  }
}
