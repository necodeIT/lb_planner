import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalenderAccess extends StatelessWidget {
  CalenderAccess({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  static const double size = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: NcThemes.current.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hallo',
            style: NcBodyText.baseStyle,
          ),
          User.current.plan.access[id] == PlanAccess.Owner
              ? Icon(
                  FontAwesome5Solid.crown,
                  color: NcThemes.current.accentColor,
                  size: size,
                )
              : Row(
                  children: [
                    Icon(
                      User.current.plan.access[id] == PlanAccess.Read ? Feather.edit_2 : FontAwesome5Solid.eye,
                      color: NcThemes.current.accentColor,
                      size: size,
                    ),
                    if (User.current.plan.access[User.current.id] == PlanAccess.Owner)
                      GestureDetector(
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: NcThemes.current.lateColor,
                          size: size,
                        ),
                      )
                  ],
                )

          // TODO: Row(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.only(right: 10.0),
          //       child: GestureDetector(
          //         onTap: () {},
          //         child: Icon(
          //           FontAwesome5Solid.pen,
          //           color: NcThemes.current.accentColor,
          //           size: 20,
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         FontAwesome5Solid.minus_circle,
          //         color: NcThemes.current.lateColor,
          //         size: 20,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
