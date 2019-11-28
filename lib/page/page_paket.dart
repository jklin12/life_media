import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/bg.dart';
import 'package:life_media_demo/widget/p_paket.dart';

class PilihPaket extends StatefulWidget {
  @override
  _PilihPaketState createState() => _PilihPaketState();
}

class _PilihPaketState extends State<PilihPaket> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[Backgroud(), PPaket()],
        ),
      ),
    );
  }
}
