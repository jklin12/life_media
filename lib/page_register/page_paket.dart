import 'package:flutter/material.dart';
import 'package:life_media_demo/widget_page_register/bg2.dart';
import 'package:life_media_demo/widget_page_register/p_paket.dart';

class PilihPaket extends StatefulWidget {
  PilihPaket(
      {this.nama,
      this.brand,
      this.pekerjaan,
      this.email,
      this.nohp,
      this.noid,
      this.notlp,
      this.namapenerima,
      this.alamatpenerima,
      this.notlppenerima,
      this.nohppenerima,
      this.emailpenerima,
      this.jnsid,
      this.alamat,
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
  final String alamat;
  final String jnsklmn;
  final String namapenerima;
  final String alamatpenerima;
  final String notlppenerima;
  final String nohppenerima;
  final String emailpenerima;
  final String tgllhr;
  final String namaprhs, nonpwp, namanpwp, alamatnpwp;

  @override
  _PilihPaketState createState() => _PilihPaketState();
}

class _PilihPaketState extends State<PilihPaket> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background2(),
            PPaket(
              nama: widget.nama,
              brand: widget.brand,
              pekerjaan: widget.pekerjaan,
              email: widget.email,
              nohp: widget.nohp,
              noid: widget.noid,
              notlp: widget.notlp,
              jnsid: widget.jnsid,
              jnsklmn: widget.jnsklmn,
              alamat: widget.alamat,
              namapenerima: widget.namapenerima,
              alamatpenerima: widget.alamatpenerima,
              nohppenerima: widget.nohppenerima,
              notlppenerima: widget.notlppenerima,
              emailpenerima: widget.emailpenerima,
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
