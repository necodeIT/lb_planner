import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/widgets/text/caption_text.dart';

class NcTextButton extends StatelessWidget {
  const NcTextButton({Key? key, required this.text, this.trailingIcon, this.leadingIcon, required this.onTap, this.width}) : super(key: key);

  final String text;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final double? width;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    if (trailingIcon == null && leadingIcon == null) throw ArgumentError("You need to specify either a leading icon or a trailing icon!");

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leadingIcon ?? Container(),
            SizedBox(width: ncSpacing),
            NcCaptionText(text),
            SizedBox(width: ncSpacing),
            trailingIcon ?? Container(),
          ],
        ),
      ),
    );
  }
}
