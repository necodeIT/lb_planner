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
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NcVectorImage(
            code: wave,
            aliignment: Alignment.bottomLeft,
          ),
          Container(
            margin: EdgeInsets.only(right: 50),
            alignment: Alignment.center,
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
                NcMaterialInputField(
                  onValueChanged: (value) => password = value,
                  placeholder: 'Passsword',
                  prefixIcon: Icon(
                    FontAwesome5Solid.lock,
                    color: NcThemes.current.textColor,
                  ),
                ),
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
