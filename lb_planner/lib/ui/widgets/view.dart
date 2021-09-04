import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

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
    return GestureDetector(
      onTap: hideNotifications,
      child: Stack(
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
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width - NcView.notificationsSize - 200, top: 60),
                // margin: EdgeInsets.only(left: 100, top: 60),
                width: NcView.notificationsSize,
                height: NcView.notificationsSize,
                child: NcContainer.window(
                  label: NcCaptionText(
                    "Notifications",
                    fontSize: 20,
                  ),
                  body: NcBodyText("Notifications"),
                  trailingIcon: GestureDetector(
                    onTap: hideNotifications,
                    child: Icon(
                      Icons.close,
                      color: NcThemes.current.lateColor,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
