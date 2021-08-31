import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CourseOverviewItem extends StatelessWidget {
  CourseOverviewItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  final double? height = 40;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1000,
        height: height,
        //color: Colors.black,
        child: Row(
          children: [
            Container(
              width: 10,
              //height: 40,
              color: Colors.red,
            ),
            Container(
              width: 500,
              height: height,
              color: Colors.yellow,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: NcCaptionText(
                          'Klassenlektüre Ringparabel',
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    //////HHHHHHHHHHHHHHHHHHHHIIIIIIIIIIIIIIIIEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRR ICONBUTTON NICHT VERGESSSENNN!!!!!!!!!!!!!!!!
                    child: Icon(Icons.ac_unit),
                  ),
                ],
              ),
            ),
            Container(
              width: 125,
              height: height,
              color: Colors.green,
              child: Expanded(
                child: Center(
                  child: NcCaptionText(
                    '22.8.2021',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 125,
              height: height,
              color: Colors.blue,
              child: Expanded(
                child: Center(
                  child: NcCaptionText(
                    '22.8.2021',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              height: height,
              color: Colors.purple,
              child: Expanded(
                child: Center(
                  child: NcCaptionText(
                    '1',
                    fontSize: 27,
                  ),
                ),
              ),
            ),
            Container(
              width: 190,
              height: height,
              color: Colors.cyan,
              child: Center(
                  child: Row(
                children: [
                  Expanded(
                    child: NcCaptionText(
                      'Moodle',
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.ac_unit),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
