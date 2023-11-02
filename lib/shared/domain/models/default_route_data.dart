// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/navigator.dart';
// import 'package:lb_planner/shared/shared.dart';

// /// A wrapper for [GoRouteData] which overrides the [buildPage] method to change the transition animation to a [SharedAxisTransition].
// abstract class DefaultRouteData extends GoRouteData {
//   /// Creates the [Widget] for `this` route.
//   ///
//   /// Corresponds to [GoRoute.builder].
//   Widget buildScreen(BuildContext context, GoRouterState state);

//   /// Returns the title of the route.
//   ///
//   /// The title is used in the [ScreenTitleBar] and must be localized.
//   String title(BuildContext context);

//   @override
//   Page<void> buildPage(BuildContext context, GoRouterState state) {
//     return CustomTransitionPage<void>(
//       key: state.pageKey,
//       child: buildScreen(context, state),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//           SharedAxisTransition(
//         animation: animation,
//         secondaryAnimation: secondaryAnimation,
//         transitionType: SharedAxisTransitionType.vertical,
//       ),
//     );
//   }

//   /// The path of the route.
//   ///
//   /// When overriding, just set this to `location`. Code generation will take care of the rest.
//   String get path;
// }
