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
  NcView({Key? key, required this.builder}) : super(key: key) {
    isRoute = false;
  }

  late final String title;
  late final Widget content;
  late final Function()? onNavigateBack;

  late final bool isRoute;
  late final Widget Function(BuildContext, Function(NcView)) builder;

  static const double fontSize = 30;
  static const double notificationsSize = 400;

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

  Widget current = Container();
  Widget last = Container();

  route(Widget view) {
    if (widget.isRoute) return;
    setState(() {
      last = current;
      current = view;
    });
  }

  pop() {
    if (widget.isRoute) return;
    setState(() {
      last = current;
      current = view;
    });
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
        : PageTransitionSwitcher(
            // duration: Duration(seconds: 2),
            transitionBuilder: (child, animationIn, animationOut) => FadeThroughTransition(
              fillColor: NcThemes.current.secondaryColor,
              animation: animationIn,
              secondaryAnimation: animationOut,
              child: child,
            ),
            child: current,
          );
  }

  // Here it is!
  double _popupOffset() {
    final TextPainter textPainter = TextPainter(text: TextSpan(text: User.current.name, style: NcCaptionText.style(fontSize: NcUserProfile.nameSize)), maxLines: 1, textDirection: TextDirection.ltr)..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width + NcUserProfile.bellSize + NcUserProfile.ppWidth + NcSpacing.xsSpacing;
  }
}
