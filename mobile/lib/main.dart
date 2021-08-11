import 'package:flutter/material.dart';
import 'login/login.dart';
import 'extensions/color.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LB Planner',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        backgroundColor: Colors.yellow,
        primaryColor: HexColor.fromHex("#2B2F37"),
        brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          buttonColor: HexColor.fromHex("#27BCF3"),
        ),
      ),
      home: Login(),
    );
  }
}
