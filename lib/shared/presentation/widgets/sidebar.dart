import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Wraps the current route in a sidebar for navigation.
class Sidebar extends StatelessWidget {
  /// Wraps the current route in a sidebar for navigation.
  const Sidebar({super.key, required this.body});

  /// The body of the currently active page.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    print("Sidebar build");

    return Row(
      children: [
        Text("Sidebarr!!!asdasdasdasdasdasd"),
        Expanded(
          child: body,
        ),
      ],
    );
  }
}

/// Auto wraps a [StatelessWidget] with a [Sidebar].
///
/// example:
///
///
mixin SidebarWrapperMixin on StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return Sidebar(
      body: build(context),
    );
  }
}

/// Auto wraps a [StatefulWidget] with a [Sidebar].
// mixin SidebarWrapperStateMixin<T extends StatefulWidget> on State<T>
//     implements AutoRouteWrapper {
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     print("SidebarWrapperStateMixin wrappedRoute");
//     return Sidebar(
//       body: this,
//     );
//   }
// }
