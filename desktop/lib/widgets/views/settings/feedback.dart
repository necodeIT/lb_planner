import 'package:desktop/dialogs/feedback_dialog.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class SettingsFeedback extends StatefulWidget {
  SettingsFeedback({Key? key}) : super(key: key);

  @override
  _SettingsFeedbackState createState() => _SettingsFeedbackState();
}

class _SettingsFeedbackState extends State<SettingsFeedback> {
  FeedbackType feedbackType = FeedbackType.Bug;

  String feedbackContent = "";

  setContent(String value) {
    setState(() {
      feedbackContent = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: NcDropdown(
            fontSize: 20,
            value: FeedbackType.values.indexOf(feedbackType),
            items: EnumToString.toList(FeedbackType.values),
            onValueChanged: (index) => feedbackType = FeedbackType.values[index],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          child: NcInputField.multiline(
            placeholder: "Feedback here...",
            onValueChanged: setContent,
            maxLines: null,
          ),
        ),
        NcSpacing.small(),
        Container(
          alignment: Alignment.centerRight,
          child: NcTextButton(
            text: "Submit",
            onTap: feedbackContent.isNotEmpty
                ? () {
                    // TODO: send Feedback
                    showFeedbackDialog(context);
                  }
                : null,
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
