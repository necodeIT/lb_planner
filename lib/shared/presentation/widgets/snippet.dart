import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb_planner/shared/shared.dart';

/// Displays code snippets with copy functionality.
class Snippet extends StatelessWidget {
  /// Displays code snippets with copy functionality.
  const Snippet({Key? key, required this.code}) : super(key: key);

  /// The code to display.
  final String code;

  @override
  Widget build(context) {
    var color = context.theme.colorScheme.primary.withOpacity(0.5);

    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(Spacing.smallSpacing),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge,
              child: Text(
                code,
                style: TextStyle(
                    color: context.theme.colorScheme.primary, fontSize: 16),
              ),
            ),
          ),
          Spacing.xs(),
          HoverBuilder(
            builder: (context, hovering) => Icon(
              Icons.copy,
              color: hovering ? context.theme.colorScheme.primary : color,
            ),
            onTap: () => Clipboard.setData(ClipboardData(text: code)),
          ),
        ],
      ),
    );
  }
}
