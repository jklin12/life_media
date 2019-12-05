import 'package:flutter/material.dart';
import 'package:life_media_demo/widget_page_dashboard/widget_home_page.dart';
import 'package:life_media_demo/widgetdashboard/bgdashboard.dart';
import 'package:life_media_demo/widgetdashboard/myappbar.dart';
import 'package:life_media_demo/widgetdashboard/mydrawe.dart';

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
        appBar: MyCustomAppBar(
          height: 70.0,
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            BgDashboard(),
            new Container(
              height: MediaQuery.of(context).size.height / 1.5,
              
              child: Column(
                children: <Widget>[
                  WidgetHomeDashboard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
