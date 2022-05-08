part of lbplanner_widgets;

/// Progress indicator.
class LpLoadingIndicator extends StatelessWidget {
  /// Linear progress indicator.
  LpLoadingIndicator({Key? key, this.progress, this.color, this.size, this.thickness, this.backgroundColor = Colors.transparent}) : super(key: key) {
    type = _LpProgressIndicatorTypes.linear;
  }

  /// Circular progress indicator.
  LpLoadingIndicator.circular({Key? key, this.progress, this.color, this.size, this.thickness, this.backgroundColor = Colors.transparent}) : super(key: key) {
    type = _LpProgressIndicatorTypes.circular;
  }

  /// Circular progress indicator with logo in the middle.
  LpLoadingIndicator.penguin({Key? key, this.size}) : super(key: key) {
    type = _LpProgressIndicatorTypes.penguin;
    backgroundColor = Colors.transparent;
    thickness = 0;
    color = null;
    progress = 0;
  }

  /// Progress indicator type.
  late final _LpProgressIndicatorTypes type;

  /// Progress of the progress indicator.
  late final double? progress;

  /// The size of the progress indicator.
  final double? size;

  /// The thickness of the progress indicator.
  late final double? thickness;

  /// Color of the progress indicator.
  late final Color? color;

  /// Background color of the progress indicator.
  late final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? accentColor;
    return ConditionalWrapper(
      condition: type.isPenguin || type.isCircular,
      wrapper: (context, child) => Center(child: child),
      child: ConditionalWrapper(
        condition: size != null,
        wrapper: (context, child) => SizedBox(
          width: size,
          height: type.isLinear ? null : size,
          child: child,
        ),
        child: ConditionalWidget(
          condition: type.isLinear,
          trueWidget: (context) => LinearProgressIndicator(
            value: progress,
            backgroundColor: backgroundColor,
            color: color,
            minHeight: thickness,
          ),
          falseWidget: (context) => ConditionalWidget(
            condition: type.isCircular,
            trueWidget: (context) => CircularProgressIndicator(
              color: color,
              strokeWidth: thickness ?? 4,
              value: progress,
              backgroundColor: backgroundColor,
            ),
            falseWidget: (context) {
              var animation = (kLoadingAnimations.toList()..shuffle()).first;
              print(animation);
              return UniversalActor.fromRiveAnimation(animation);
            },
          ),
        ),
      ),
    );
  }
}

enum _LpProgressIndicatorTypes {
  circular,
  linear,
  penguin,
}

extension on _LpProgressIndicatorTypes {
  bool get isCircular => this == _LpProgressIndicatorTypes.circular;
  bool get isLinear => this == _LpProgressIndicatorTypes.linear;
  bool get isPenguin => this == _LpProgressIndicatorTypes.penguin;
}
