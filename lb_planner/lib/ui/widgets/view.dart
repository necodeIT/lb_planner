import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class NcView extends StatefulWidget {
  NcView({Key? key, required this.title, this.onNavigateBack, required this.content}) : super(key: key);

  final String title;
  final Widget content;
  final Function()? onNavigateBack;

  static const double fontSize = 30;

  @override
  _NcViewState createState() => _NcViewState();
}

class _NcViewState extends State<NcView> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              UserProfile(),
            ],
          ),
        ),
        NcSpacing.small(),
        Expanded(child: widget.content),
        NcSpacing.small(),
      ],
    );
  }
}
