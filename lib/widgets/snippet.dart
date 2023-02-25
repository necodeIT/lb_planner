part of lbplanner_widgets;

/// Displays a snippet of code with a copy button.
class LpSnippet extends LocalizedWidget {
  /// Displays a snippet of code with a copy button.
  const LpSnippet({Key? key, required this.code}) : super(key: key);

  /// The code to display.
  final String code;

  @override
  Widget build(context, t) {
    var color = accentColor.withOpacity(0.5);

    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      padding: EdgeInsets.all(NcSpacing.smallSpacing),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge,
              child: NcBodyText(
                code,
                color: accentColor,
              ),
            ),
          ),
          NcSpacing.xs(),
          HoverBuilder(
            builder: (context, hovering) => LpIcon(
              Icons.copy,
              color: hovering ? accentColor : color,
            ),
            onTap: () => Clipboard.setData(ClipboardData(text: code)),
          ),
        ],
      ),
    );
  }
}
