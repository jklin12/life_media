import 'package:flutter/material.dart';
import 'package:life_media_demo/widget/Widget_penagihan.dart';
import 'package:life_media_demo/widget/bg2.dart';

class Penagihan extends StatefulWidget {
  Penagihan(
      {this.nama,
      this.brand,
      this.pekerjaan,
      this.email,
      this.nohp,
      this.noid,
      this.notlp,
      this.jnsid,
      this.alamatprb,
      this.jnsklmn,
      this.tgllhr,
      this.namaprhs,
      this.nonpwp,
      this.namanpwp,
      this.alamatnpwp});

  final String nama;
  final String brand;
  final String pekerjaan;
  final String nohp;
  final String email;
  final String notlp;
  final String noid;
  final String jnsid;
  final String alamatprb;
  final String jnsklmn;
  final String tgllhr;
  final String namaprhs, nonpwp, namanpwp, alamatnpwp;
  @override
  _PenagihanState createState() => _PenagihanState();
}

class _PenagihanState extends State<Penagihan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background2(),
            Widgetpenagihan(
              nama: widget.nama,
              brand: widget.brand,
              pekerjaan: widget.pekerjaan,
              notlp: widget.notlp,
              noid: widget.noid,
              nohp: widget.nohp,
              email: widget.email,
              jnsid: widget.jnsid,
              alamat: widget.alamatprb,
              jnsklmn: widget.jnsklmn,
              tgllhr: widget.tgllhr,
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
