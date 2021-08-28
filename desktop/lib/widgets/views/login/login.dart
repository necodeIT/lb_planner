import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'svg/wave.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NcThemes.current.primaryColor,
      padding: EdgeInsets.zero,
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Container(
      //       // alignment: Alignment.topLeft,
      //       child: NcVectorImage(
      //         code: wave,
      //         width: 1000,
      //         // height: double.infinity,
      //       ),
      //     ),
      //   ],
      // ),
      child: NcVectorImage(
        code: wave,
        aliignment: Alignment.bottomLeft,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
