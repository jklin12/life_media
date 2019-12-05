import 'package:flutter/material.dart';
import 'package:life_media_demo/widget_page_register/bg2.dart';
import 'package:life_media_demo/widget_page_register/registerdataperusahaan.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[Background2(), Register()],
        ),
      ),
    );
  }
}
