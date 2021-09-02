import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class SettingsFeedback extends StatelessWidget {
  SettingsFeedback({Key? key}) : super(key: key);

  FeedbackType feedbackType = FeedbackType.Bug;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: NcDropdown(
            fontSize: 20,
            value: FeedbackType.values.length - 1,
            items: EnumToString.toList(FeedbackType.values),
            onValueChanged: (index) => feedbackType = FeedbackType.values[index],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          child: NcInputField.multiline(
            placeholder: "Feedback here...",
            maxLines: null,
          ),
        ),
        NcSpacing.small(),
        Container(
          alignment: Alignment.centerRight,
          child: NcTextButton(
            text: "Submit",
            onTap: () {},
            trailingIcon: Icon(
              Feather.arrow_right_circle,
              color: NcThemes.current.textColor,
            ),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
