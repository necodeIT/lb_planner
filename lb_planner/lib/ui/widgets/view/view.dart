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

class _NcViewState extends State<NcView> {
  bool showNotificationsPopup = false;

  void hideNotifications() {
    setState(() {
      showNotificationsPopup = false;
    });
  }

  void showNotifications() {
    setState(() {
      showNotificationsPopup = true;
    });
  }

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
                  UserProfile(onShowNotifications: showNotifications),
                ],
              ),
            ),
            NcSpacing.small(),
            Expanded(child: widget.content),
            NcSpacing.small(),
          ],
        ),
        if (showNotificationsPopup)
          Positioned(
            top: 60,
            right: 140,
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
                onTap: hideNotifications,
                child: Icon(
                  Icons.close,
                  color: NcThemes.current.lateColor,
                ),
              ),
            ),
          )
      ],
    );
  }
}
