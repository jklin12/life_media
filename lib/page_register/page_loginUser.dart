import 'package:flutter/material.dart';
import 'package:life_media_demo/widget_page_register/bg2.dart';
import 'package:life_media_demo/widget_page_register/widget_loginuser.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[Background2(), WidgetUserLogin()],
        ),
      ),
    );
  }
}
