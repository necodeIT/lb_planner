import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lb_planner/utils/api/api.dart' as api;
import 'package:lb_planner/utils/color.dart';
import 'package:lb_planner/widgets/home/home.dart';
import 'package:lb_planner/widgets/defaults/default.dart' as Default;
import 'package:lb_planner/widgets/login/input_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final double witdth = MediaQuery.of(context).size.width * 0.90;
    return Scaffold(
      body: SafeArea(
        child: Default.Gradient(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/img/Logo.svg"),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 33,
                  ),
                ),
                InputField(
                  icon: Icons.account_circle_rounded,
                  placeholder: "Username",
                  margin: EdgeInsets.only(top: 30),
                  width: witdth,
                  onChanched: (value) => setState(() => username = value),
                ),
                InputField(
                  icon: Icons.lock,
                  placeholder: "Password",
                  margin: EdgeInsets.only(top: 15),
                  width: witdth,
                  onChanched: (value) => setState(() => password = value),
                  obscureText: true,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: witdth,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: username.isEmpty || password.isEmpty
                        ? null
                        : () => {
                              api.login(username, password).then(
                                    (respone) => {
                                      if (respone.isError)
                                        Default.alertDialog(context: context, message: respone.errorMessage, caption: "Login Failed").then((value) => null)
                                      else
                                        {
                                          // TODO save token to local storage

                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Home()))
                                        }
                                    },
                                  ),
                            },
                    child: Text(
                      "LOGIN",
                      style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: witdth,
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => launch("https://lbplanner.notion.site/Einf-hrung-16c2658e34c7402b9f52c07f8e38f4cb"), // Open Getting Started
                    child: Text(
                      "Need help?",
                      style: TextStyle(
                        color: HexColor.fromHex("#575E69"),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
