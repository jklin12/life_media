import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/bgdashboard.dart';
import 'package:life_media_demo/widget/myappbar.dart';
import 'package:life_media_demo/widget/mydrawe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Mydrawer(),
        appBar: MyCustomAppBar(height: 150.0,),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[BgDashboard()],
        ),
      ),
    );
  }
}
