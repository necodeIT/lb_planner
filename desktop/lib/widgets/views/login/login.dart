import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'svg/wave.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  String username = "";
  String password = "";

  static const double formMargin = 60;
  static const double formWidth = 350;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NcThemes.current.primaryColor,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        // alignment: Alignment.,
        children: [
          NcVectorImage(
            code: wave,
            aliignment: Alignment.bottomLeft,
            height: double.infinity,
          ),
          Positioned(
            right: formMargin,
            width: formWidth,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NcLogo(
                  width: 100,
                ),
                NcMaterialInputField(
                  onValueChanged: (value) => username = value,
                  placeholder: 'Username',
                  prefixIcon: Icon(
                    FontAwesome5Solid.user,
                    color: NcThemes.current.textColor,
                  ),
                ),
                NcSpacing.all(),
                NcMaterialInputField(
                  onValueChanged: (value) => password = value,
                  placeholder: 'Passsword',
                  prefixIcon: Icon(
                    FontAwesome5Solid.lock,
                    color: NcThemes.current.textColor,
                  ),
                ),
                NcSpacing.all(),
                NcButton(
                  text: "Login",
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
