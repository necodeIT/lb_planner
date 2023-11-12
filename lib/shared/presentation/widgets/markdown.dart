import 'package:flutter/material.dart';

/// Themed [Markdown] widget.
///
/// Also allows for loading files from the internet.
class Markdown extends LocalizedWidget {
  /// Themed [Markdown] widget.
  const Markdown(this.data, {Key? key})
      : source = null,
        assert(data != null),
        super(key: key);

  /// Themed [Markdown] widget.
  ///
  /// Loads markdown from the given [source].
  const Markdown.network(this.source, {Key? key})
      : data = null,
        assert(source != null),
        super(key: key);

  /// The markdown source to display.
  final String? data;

  /// The url to load the markdown from.
  final Uri? source;

  @override
  Widget build(context, t) {
    return ConditionalWidget(
      condition: data == null,
      trueWidget: (_) => FutureBuilder<http.Response>(
        future: http.get(source!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ignore: no-magic-number
            if (snapshot.data!.statusCode == 200)
              return _buildMarkdown(context, snapshot.data!.body);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LpIcon(
                  FontAwesome.exclamation_triangle,
                  color: errorColor,
                  size: UpdateRoute.iconSize,
                ),
                NcSpacing.small(),
                NcCaptionText(
                  t.widgets_markdown_networkError(source.toString()),
                  textAlign: TextAlign.center,
                ),
                NcSpacing.large(),
                LpButton(
                  text: t.widgets_markdown_networkError_openInBrowser,
                  onPressed: () => launchUrl(source!),
                ),
              ],
            );
          } else {
            return Center(
              child: LpLoadingIndicator.circular(),
            );
          }
        },
      ),
      falseWidget: (_) => _buildMarkdown(context, data!),
    );
  }

  Widget _buildMarkdown(BuildContext context, String data) {
    return Markdown(
      data: data,
      styleSheet: MarkdownStyleSheet.fromTheme(
        Theme.of(context),
      ).copyWith(
        blockquoteDecoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        a: TextStyle(color: accentColor),
        h1: NcBaseText.style(fontWeight: FontWeight.bold, fontSize: null),
        h2: NcBaseText.style(fontWeight: FontWeight.bold, fontSize: null),
        h3: NcBaseText.style(fontWeight: FontWeight.bold, fontSize: null),
        h4: NcBaseText.style(fontWeight: FontWeight.bold, fontSize: null),
        h5: NcBaseText.style(fontWeight: FontWeight.bold, fontSize: null),
        h6: NcBaseText.style(fontWeight: FontWeight.bold, fontSize: null),
        code: TextStyle(
          color: textColor,
          backgroundColor: primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      onTapLink: (text, href, title) {
        if (href == null) return;

        launchUrl(Uri.parse(href));
      },
      checkboxBuilder: (checked) => LpCheckbox(
        value: checked,
      ),
    );
  }
}
