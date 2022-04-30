part of lbplanner_routes;

/// Feedback section of the settings route.
class SettingsFeedback extends StatefulWidget {
  /// Feedback section of the settings route.
  const SettingsFeedback({Key? key}) : super(key: key);

  /// The font size of the text.
  static const double fontSize = 18;

  @override
  State<SettingsFeedback> createState() => _SettingsFeedbackState();
}

class _SettingsFeedbackState extends State<SettingsFeedback> {
  final TextEditingController _feedbackController = TextEditingController();

  FeedbackTypes _feedbackType = FeedbackTypes.bug;

  Future? _submitFuture;

  _submitFeedback(BuildContext context) async {
    if (_feedbackController.text.isEmpty) return;

    setState(() {
      _submitFuture = Future.delayed(Duration(seconds: 10));
    });

    await _submitFuture;

    if (!mounted) return;

    setState(() {
      _submitFuture = null;
    });
  }

  _setFeedbackType(FeedbackTypes? type) {
    setState(() {
      _feedbackType = type ?? _feedbackType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LpContainer(
      title: t.settings_feedback,
      child: ConditionalWrapper(
        condition: _submitFuture != null,
        wrapper: (context, child) => FutureBuilder(
          future: _submitFuture,
          builder: (context, snapshot) => ConditionalWidget(
            condition: snapshot.connectionState.isDone,
            trueWidget: (context) => child,
            falseWidget: (context) => LpLoadingIndicator.penguin(),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: LpDropdown<FeedbackTypes>(
                fontSize: SettingsFeedback.fontSize,
                value: _feedbackType,
                items: [
                  DropdownMenuItem(child: NcBodyText(t.settings_feedback_types_bug), value: FeedbackTypes.bug),
                  DropdownMenuItem(child: NcBodyText(t.settings_feedback_types_error), value: FeedbackTypes.error),
                  DropdownMenuItem(child: NcBodyText(t.settings_feedback_types_suggestion), value: FeedbackTypes.suggestion),
                  DropdownMenuItem(child: NcBodyText(t.settings_feedback_types_other), value: FeedbackTypes.other),
                ],
                onChanged: _setFeedbackType,
              ),
            ),
            NcSpacing.xs(),
            Expanded(
              child: LpTextField.filled(
                fontSize: SettingsFeedback.fontSize,
                controller: _feedbackController,
                placeholder: t.settings_feedback_placeholder,
                multiline: true,
              ),
            ),
            NcSpacing.medium(),
            Align(
              alignment: Alignment.centerRight,
              child: LpTextButton(
                text: t.settings_feedback_submit,
                trailingIcon: Feather.arrow_right_circle,
                onPressed: () => _submitFeedback(context),
                fontSize: SettingsFeedback.fontSize,
              ),
            ),
            NcSpacing.xs(),
          ],
        ),
      ),
    );
  }
}
