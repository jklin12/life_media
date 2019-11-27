import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/bg.dart';
import 'package:life_media_demo/widget/datapribadi.dart';

class RdataPribadi extends StatefulWidget {
  @override
  _RdataPribadiState createState() => _RdataPribadiState();
}

class _RdataPribadiState extends State<RdataPribadi> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[Backgroud(), DataPribadi()],
        ),
      ),
    );
  }
}
