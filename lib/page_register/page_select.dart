import 'package:flutter/material.dart';
import 'package:life_media_demo/widget_page_register/bg.dart';
import 'package:life_media_demo/widget_page_register/widget_select.dart';

class PageSelect extends StatefulWidget {
  @override
  _PageSelectState createState() => _PageSelectState();
}

class _PageSelectState extends State<PageSelect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
         resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Backgroud(),
        WidgetSelect()
      ],),),
      
    );
  }
}