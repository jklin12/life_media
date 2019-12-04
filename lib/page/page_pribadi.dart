import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/bg2.dart';
import 'package:life_media_demo/widget/datapribadi.dart';

class RdataPribadi extends StatefulWidget {
  RdataPribadi({this.namaprhs, this.nonpwp, this.namanpwp, this.alamatnpwp});

  String namaprhs, nonpwp, namanpwp, alamatnpwp;
  @override
  _RdataPribadiState createState() => _RdataPribadiState();
}

class _RdataPribadiState extends State<RdataPribadi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background2(),
            DataPribadi(
              namaprhs: widget.namaprhs,
              namanpwp: widget.namanpwp,
              nonpwp: widget.nonpwp,
              alamatnpwp: widget.alamatnpwp,
            )
          ],
        ),
      ),
    );
  }
}
