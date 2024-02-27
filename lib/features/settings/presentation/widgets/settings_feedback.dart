import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Feedback section of the settings route.
class SettingsFeedback extends StatefulWidget {
  /// Feedback section of the settings route.
  const SettingsFeedback({Key? key}) : super(key: key);

  /// The font size of the text.
  static const double fontSize = 18;

  /// The size of the loading indicator when submitting feedback.
  static const double loadingIndicatorSize = 50;

  @override
  State<SettingsFeedback> createState() => _SettingsFeedbackState();
}

class _SettingsFeedbackState extends State<SettingsFeedback> {
  final TextEditingController _feedbackController = TextEditingController();

  FeedbackTypes _feedbackType = FeedbackTypes.bug;

  Future<RawApiResponse>? _submitFuture;

  _submitFeedback(FeedbackProvider feedback, BuildContext context) async {
    if (_feedbackController.text.isEmpty) return;

    setState(() {
      _submitFuture = feedback.submitFeedback(
        Feedback(
          timestamp: DateTime.now(),
          id: -1,
          userId: -1,
          content: _feedbackController.text,
          type: _feedbackType,
          status: FeedbackStatus.unread,
          logFile: _feedbackType.isBug ? Logger.logFileName : "",
        ),
      );
    });

    var response = await _submitFuture!;

    if (!mounted) return;

    setState(() {
      _submitFuture = null;

      if (response.succeeded) _feedbackController.text = "";
    });

    lpShowAlertDialog(
      context,
      title: response.succeeded
          ? t.settings_feedback_submitted_title
          : t.settings_feedback_failed_title,
      message: response.succeeded
          ? t.settings_feedback_submitted_message
          : t.settings_feedback_failed_message(response.errorMessage),
    );
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
      child: ConditionalWidget(
        condition: _submitFuture != null,
        trueWidget: (context) => LpLoadingIndicator.circular(
            size: SettingsFeedback.loadingIndicatorSize),
        falseWidget: (_) => Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: LpDropdown<FeedbackTypes>(
                fontSize: SettingsFeedback.fontSize,
                value: _feedbackType,
                items: [
                  DropdownMenuItem(
                      child: NcBodyText(t.settings_feedback_types_bug),
                      value: FeedbackTypes.bug),
                  DropdownMenuItem(
                      child: NcBodyText(t.settings_feedback_types_error),
                      value: FeedbackTypes.error),
                  DropdownMenuItem(
                      child: NcBodyText(t.settings_feedback_types_suggestion),
                      value: FeedbackTypes.suggestion),
                  DropdownMenuItem(
                      child: NcBodyText(t.settings_feedback_types_other),
                      value: FeedbackTypes.other),
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
              child: Consumer(
                builder: (_, ref, __) => LpTextButton(
                  text: t.settings_feedback_submit,
                  trailingIcon: Feather.arrow_right_circle,
                  // Don't ask why but i get exceptions when using the context provided from the builder.
                  onPressed: () =>
                      _submitFeedback(ref.watch(feedbackController), context),
                  fontSize: SettingsFeedback.fontSize,
                ),
              ),
            ),
            NcSpacing.xs(),
          ],
        ),
      ),
    );
  }
}
