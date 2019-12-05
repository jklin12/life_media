import 'package:flutter/material.dart';
import 'package:life_media_demo/widgetdashboard/bgdashboard.dart';
import 'package:life_media_demo/widgetdashboard/myappbar.dart';
import 'package:life_media_demo/widgetdashboard/mydrawe.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Mydrawer(),
        appBar: MyCustomAppBar(
          height: 150.0,
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[BgDashboard()],
        ),
      ),
    );
  }
}
