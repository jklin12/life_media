import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/bg.dart';
import 'package:life_media_demo/widget/widget_loginuser.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
       body: Stack(
         children: <Widget>[
           Backgroud(),WidgetUserLogin()
         ],
       ),
      ),
      
    );
  }
}

