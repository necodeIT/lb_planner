part of lbplanner_widgets;

/// Svg logo of the app.
class LpLogo extends StatelessWidget {
  /// Svg logo of the app.
  const LpLogo({Key? key, this.size, this.alignment = Alignment.center}) : super(key: key);

  /// The size of the logo.
  final double? size;

  /// The alignment of the logo.
  final Alignment alignment;

  /// The svg code of the logo
  static const svg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="257.594" height="233" viewBox="0 0 257.594 233">
    <g id="Logo" transform="translate(-641 -1172)">
      <text id="LP" transform="translate(740 1361)" fill="${NcVectorImage.textColor}" font-size="175" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="-98.48" y="0">LP</tspan></text>
      <path id="Path_13" data-name="Path 13" d="M-2975.34,4671.469l56.379,50.013v-50.013Z" transform="translate(3817.555 -3430.982)" fill="${NcVectorImage.accentColor}"/>
    </g>
  </svg>
  ''';

  @override
  Widget build(BuildContext context) {
    return NcVectorImage(
      code: svg,
      height: size,
      width: size,
      alignment: alignment,
    );
  }
}
