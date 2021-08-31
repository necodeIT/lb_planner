import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class SettingsFeedback extends StatefulWidget {
  SettingsFeedback({Key? key}) : super(key: key);

  // static get List<String> types => ;

  @override
  _SettingsFeedbackState createState() => _SettingsFeedbackState();
}

class _SettingsFeedbackState extends State<SettingsFeedback> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: NcDropdown(
            value: 0,
            items: EnumToString.toList(FeedbackType.values),
          ),
        ),
        NcSpacing.medium(),
        NcInputField.multiline(
          placeholder: "Feedback here...",
          maxLines: null,
          // height: double.infinity,
        ),
      ],
    );
  }
}
