import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/Widget_penagihan.dart';
import 'package:life_media_demo/widget/bg.dart';

class Penagihan extends StatefulWidget {
  @override
  _PenagihanState createState() => _PenagihanState();
}

class _PenagihanState extends State<Penagihan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[Backgroud(),Widgetpenagihan()],
        ),
      ),
    );
  }
}
