import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalenderModuleItem extends StatelessWidget {
  CalenderModuleItem({
    Key? key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: LOGIK FEHLT!!!!!!!!!!!!!!!!!!!!!
      height: 40, //TODO: Weg löschn
      width: 200, //TODO: Weg löschn
      color: Colors.red,
      child: NcTitleText(
        'D',
        buttonText: true,
        textAlign: TextAlign.center,
        fontSize: 30,
      ),
    );
  }
}
