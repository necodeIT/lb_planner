import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

/// Renders a [MarkdownView]
///
/// Also allows to loading content from the internet.
class MarkdownView extends ConsumerWidget {
  /// Renders a Markdown wit the [data]
  const MarkdownView(this.data, {Key? key})
      : source = null,
        assert(data != null),
        super(key: key);

  /// Renders a [MarkdownView]
  ///
  /// Also allows to loading content from the internet.
  const MarkdownView.network(this.source, {Key? key})
      : data = null,
        assert(source != null),
        super(key: key);

  /// The markdown content to display.
  final String? data;

  /// The url to load the markdown from.
  final Uri? source;

  @override
  Widget build(context, ref) {
    final networkService = ref.watch(networkServiceProvider);

    return ConditionalWidget(
      condition: data == null,
      ifTrue: FutureBuilder<HttpResponse>(
        future: networkService.get(source.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isOk) {
              return _buildMarkdown(context, snapshot.data!.body);
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesome.exclamation_triangle,
                  color: context.theme.colorScheme.error,
                  size: 60,
                ),
                Spacing.small(),
                Text(
                  context.t.widgets_markdown_networkError(source.toString()),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, letterSpacing: 0.4),
                ),
                Spacing.large(),
                ElevatedButton(
                  child: Text(
                      context.t.widgets_markdown_networkError_openInBrowser),
                  onPressed: () => launchUrl(source!),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      ifFalse: _buildMarkdown(context, data!),
    );
  }

  /// Builds the Markdown View with the specified [data] and style.
  Widget _buildMarkdown(BuildContext context, String data) {
    return Markdown(
      data: data,
      styleSheet: MarkdownStyleSheet.fromTheme(
        Theme.of(context),
      ).copyWith(
        blockquoteDecoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        a: TextStyle(color: context.theme.colorScheme.primary),
        h1: TextStyle(fontWeight: FontWeight.bold, fontSize: null),
        h2: TextStyle(fontWeight: FontWeight.bold, fontSize: null),
        h3: TextStyle(fontWeight: FontWeight.bold, fontSize: null),
        h4: TextStyle(fontWeight: FontWeight.bold, fontSize: null),
        h5: TextStyle(fontWeight: FontWeight.bold, fontSize: null),
        h6: TextStyle(fontWeight: FontWeight.bold, fontSize: null),
        code: TextStyle(
          color: context.theme.textTheme.bodyLarge!.color!,
          backgroundColor: context.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      onTapLink: (text, href, title) {
        if (href == null) return;

        launchUrl(Uri.parse(href));
      },
    );
  }
}
