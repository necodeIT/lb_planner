import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/widgets/view/svg/notifactions_svg.dart';

class NcView extends StatefulWidget {
  NcView.route({Key? key, required this.title, this.onNavigateBack, required this.content}) : super(key: key) {
    isRoute = true;
  }
  NcView({Key? key, required this.routes}) : super(key: key) {
    isRoute = false;
    this._routes = Map.fromIterable(routes, key: (v) => v.title, value: (v) => v);
  }

  late final String title;
  late final Widget content;
  late final Function()? onNavigateBack;

  late final bool isRoute;
  late final List<NcView> routes;
  late final Map<String, Widget> _routes;
  late final _NcViewController controller;

  static const double fontSize = 30;
  static const double notificationsSize = 400;

  static _NcViewController of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<_NcViewController>()!;

  @override
  _NcViewState createState() => _NcViewState();
}

class _NcViewState extends State<NcView> {
  bool showNotifications = false;

  void hideNotificationsPopuop() {
    setState(() {
      showNotifications = false;
    });
  }

  void showNotificationsPopup() {
    setState(() {
      showNotifications = true;
    });
  }

  late String _current;

  void route(String name) {
    setState(() {
      _current = name;
    });
  }

  @override
  void initState() {
    super.initState();
    if (!widget.isRoute) {
      _current = widget._routes.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isRoute
        ? Stack(
            children: [
              Column(
                children: [
                  NcSpacing.small(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.onNavigateBack != null
                            ? NcTextButton(
                                fontSize: NcView.fontSize,
                                text: widget.title,
                                onTap: widget.onNavigateBack ?? () {},
                                leadingIcon: Icon(
                                  Feather.arrow_left_circle,
                                  color: NcThemes.current.textColor,
                                  size: NcView.fontSize,
                                ),
                              )
                            : NcCaptionText(widget.title, fontSize: NcView.fontSize),
                        NcUserProfile(onShowNotifications: showNotificationsPopup),
                      ],
                    ),
                  ),
                  NcSpacing.small(),
                  Expanded(
                    child: widget.content,
                  ),
                  NcSpacing.small(),
                ],
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                top: showNotifications ? 60 : 0,
                right: _popupOffset(),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                  opacity: showNotifications ? 1 : 0,
                  child: Visibility(
                    visible: showNotifications,
                    child: NcContainer(
                      width: NcView.notificationsSize,
                      height: NcView.notificationsSize,
                      label: NcCaptionText(
                        "Notifications",
                        fontSize: 20,
                      ),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: NcVectorImage(
                            code: no_notifications,
                          )),
                          NcBodyText(
                            "No Notifications",
                            fontSize: 15,
                          ),
                        ],
                      ),
                      trailingIcon: GestureDetector(
                        onTap: hideNotificationsPopuop,
                        child: Icon(
                          Icons.close,
                          color: NcThemes.current.lateColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : _NcViewController(
            child: PageTransitionSwitcher(
              // duration: Duration(seconds: 2),
              transitionBuilder: (child, animationIn, animationOut) => FadeThroughTransition(
                fillColor: NcThemes.current.secondaryColor,
                animation: animationIn,
                secondaryAnimation: animationOut,
                child: child,
              ),
              // child: routes[_current],
              child: widget._routes[_current],
            ),
            state: this);
  }

  // Here it is!
  double _popupOffset() {
    final TextPainter textPainter = TextPainter(text: TextSpan(text: User.current.name, style: NcCaptionText.style(fontSize: NcUserProfile.nameSize)), maxLines: 1, textDirection: TextDirection.ltr)..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width + NcUserProfile.bellSize + NcUserProfile.ppWidth + NcSpacing.xsSpacing;
  }
}

class _NcViewController extends InheritedWidget {
  _NcViewController({Key? key, required this.child, required _NcViewState state}) : super(key: key, child: child) {
    _state = state;
  }

  final Widget child;
  late final _NcViewState _state;

  route(String name) => _state.route(name);

  @override
  bool updateShouldNotify(_NcViewController oldWidget) => true;
}
