import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/widgets/view/svg/notifactions_svg.dart';

class NcView extends StatefulWidget {
  NcView({Key? key, required this.title, this.onNavigateBack, required this.content}) : super(key: key);

  final String title;
  final Widget content;
  final Function()? onNavigateBack;

  static const double fontSize = 30;
  static const double notificationsSize = 400;

  @override
  _NcViewState createState() => _NcViewState();
}

class _NcViewState extends State<NcView> with SingleTickerProviderStateMixin {
  bool showNotifications = false;
  // late AnimationController _controller;
  // late Animation<double> _animation;

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

  // @override
  // void initState() {
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 350),
  //   );

  //   _controller.forward();
  //   _animation = CurvedAnimation(
  //     parent: _controller,
  //     curve: Curves.easeOutCubic,
  //   );

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  UserProfile(onShowNotifications: showNotificationsPopup),
                ],
              ),
            ),
            NcSpacing.small(),
            // Expanded(
            //   child: SlideTransition(
            //     child: widget.content,
            //     position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_animation),
            //   ),
            // ),
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
          right: 140,
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
    );
  }
}
