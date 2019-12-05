import 'package:flutter/material.dart';
import 'package:life_media_demo/widget_page_register/bg.dart';
import 'package:life_media_demo/widget_page_register/login.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[Backgroud(), Login()],
        ),
      ),
    );
  }
}
