import 'package:flutter/material.dart';
import 'package:lb_planner/decoration/gradient.dart';
import 'package:lb_planner/login/inputfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultGradient(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/Logo.png",
                  width: 178.49,
                  height: 163,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 33,
                  ),
                ),
                InputField(icon: Icons.account_circle_rounded, placeholder: "Username", margin: EdgeInsets.only(top: 30)),
                InputField(icon: Icons.lock, placeholder: "Password", margin: EdgeInsets.only(top: 15)),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  // decoration: BoxShadow(color: Colors.black),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "LOGIN",
                      style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
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
