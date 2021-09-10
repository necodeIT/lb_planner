import 'package:desktop/widgets/views/calendar/modules/module_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class ModuleGrid extends StatelessWidget {
  ModuleGrid({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: NcTitleText(
                    'May',
                    textAlign: TextAlign.center,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: NcTitleText(
                    'May',
                    textAlign: TextAlign.center,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: NcTitleText(
                    'May',
                    textAlign: TextAlign.center,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: NcTitleText(
                    'May',
                    textAlign: TextAlign.center,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  child: NcTitleText(
                    'May',
                    textAlign: TextAlign.center,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  //width: ModuleWidget.heightTag,
                  width: ModuleWidget.heightTag,
                ),
              ],
            ),
          ),
          ModuleWidget(id: 1),
          ModuleWidget(id: 1),
          ModuleWidget(id: 1),
          ModuleWidget(id: 1),
          ModuleWidget(id: 1),
          ModuleWidget(id: 1),
        ],
      ),
    );
  }
}
