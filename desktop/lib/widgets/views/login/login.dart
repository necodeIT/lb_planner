import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/api.dart';
import '../../../version.dart';
import 'svg/wave.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key, required this.onLoginSuccess}) : super(key: key);

  String username = "";
  String password = "";

  static const double formMargin = 60;
  static const double widthFactor = 0.25;
  static const double logoFactor = 0.1;

  final Function(Token) onLoginSuccess;

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
            width: MediaQuery.of(context).size.width * widthFactor,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NcLogo(
                  width: MediaQuery.of(context).size.width * logoFactor,
                ),
                NcSpacing.large(),
                NcMaterialInputField(
                  autoFocus: true,
                  onValueChanged: (value) => username = value,
                  placeholder: 'Username',
                  prefixIcon: Icon(
                    FontAwesome5Solid.user,
                    color: NcThemes.current.textColor,
                  ),
                ),
                NcSpacing.medium(),
                NcMaterialInputField(
                  obscureText: true,
                  onValueChanged: (value) => password = value,
                  placeholder: 'Password',
                  prefixIcon: Icon(
                    FontAwesome5Solid.lock,
                    color: NcThemes.current.textColor,
                  ),
                ),
                NcSpacing.large(),
                NcButton(
                  text: "LOGIN",
                  onTap: () {
                    MoodleAPI.login(username, password)
                      ..then(
                        (response) {
                          if (response.isError)
                            return NcSnackBar.showBottomRightMessage(
                              context,
                              message: response.errorMessage,
                              prefixIcon: Icon(
                                Icons.error,
                                color: NcThemes.current.lateColor,
                              ),
                            );

                          onLoginSuccess(response.value);
                        },
                      );
                  },
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: NcBodyText(
              version,
              buttonText: true,
            ),
          )
        ],
      ),
    );
  }
}
