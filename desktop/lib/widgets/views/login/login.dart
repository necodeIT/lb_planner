import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'svg/wave.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NcThemes.current.primaryColor,
      width: double.infinity,
      child: Stack(
        // alignment: Alignment.,
        children: [
          NcVectorImage(
            code: wave,
            aliignment: Alignment.bottomLeft,
          ),
          Positioned(
            right: 60,
            width: 350,
            child: Column(
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
