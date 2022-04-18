part of lbplanner_widgets;

class LpContainer extends StatelessWidget {
  const LpContainer({Key? key, required this.title, this.icon, this.menue, required this.body, this.width, this.height}) : super(key: key);
  final String title;
  final Widget? icon;
  final Widget? menue;
  final Widget body;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Row(
            children: [
              if (icon != null) icon ?? Container(),
              if (icon != null) NcSpacing.small(),
              Expanded(child: NcTitleText(title)),
              if (menue != null) NcSpacing.small(),
              if (menue != null) menue ?? Container(),
            ],
          ),
        ],
      ),
    );
  }
}
