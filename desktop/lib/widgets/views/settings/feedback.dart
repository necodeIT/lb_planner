import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
        Container(
          height: 500,
          //color: NcThemes.current.secondaryColor,
          decoration: new BoxDecoration(
            color: NcThemes.current.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Expanded(
            child: NcInputField.multiline(
              placeholder: "Feedback here...",
              maxLines: null,
            ),
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
