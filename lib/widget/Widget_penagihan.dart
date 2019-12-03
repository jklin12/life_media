import 'package:flutter/material.dart';
import 'package:life_media_demo/page/page_paket.dart';

class Widgetpenagihan extends StatefulWidget {
  Widgetpenagihan(
      {this.nama,
      this.brand,
      this.pekerjaan,
      this.email,
      this.nohp,
      this.noid,
      this.notlp,
      this.jnsid,
      this.jnsklmn,
      this.alamat,
      this.tgllhr});

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
  final String tgllhr;

  @override
  _WidgetpenagihanState createState() => _WidgetpenagihanState();
}

class _WidgetpenagihanState extends State<Widgetpenagihan> {
  final _key = new GlobalKey<FormState>();

  final namapenerima = TextEditingController();
  final alamatpenerima = TextEditingController();
  final notlp = TextEditingController();
  final nohp = TextEditingController();
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Color.fromRGBO(255, 255, 255, 0.9),
        elevation: 6,
        child: Container(
          height: MediaQuery.of(context).size.height / 1.1,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Form(
            key: _key,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Data Penagihan",
                        style: (TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey)),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.blueGrey,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                inputData("ex : faris ", "Nama Penerima", namapenerima, true,
                    "Masukan Nama",TextInputType.text),
                inputData("ex : Jl sudirman no 1 ,yogyakarta  ",
                    "Alamat Penagihan", alamatpenerima, true, "Masukan Alamat",TextInputType.text),
                inputData("ex: 021 844566 ", "no Telfon", notlp, true,
                    "Masukan Nomor Telfon",TextInputType.number),
                inputData("ex: 085769213588", "no Hp", nohp, true,
                    "Masukan Nomor HP",TextInputType.number),
                inputData("ex: lifemedia@mail.com", "Email", email, true,
                    "Masukan Email",TextInputType.text),
                InkWell(
                    onTap: () {
                      print(widget.tgllhr);
                      if (_key.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PilihPaket(
                                    nama: widget.nama,
                                    brand: widget.brand,
                                    pekerjaan: widget.pekerjaan,
                                    notlp: widget.notlp,
                                    nohp: widget.nohp,
                                    noid: widget.noid,
                                    email: widget.email,
                                    jnsklmn: widget.jnsklmn,
                                    alamat: widget.alamat,
                                    jnsid: widget.jnsid,
                                    namapenerima: namapenerima.text,
                                    alamatpenerima: alamatpenerima.text,
                                    notlppenerima: notlp.text,
                                    nohppenerima: nohp.text,
                                    emailpenerima: email.text,
                                    tgllhr: widget.tgllhr,
                                  )),
                        );
                      }
                    },
                    child:
                        roundedRectButton("Selanjutnya", signUpGradients, true))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputData(String hintText, String labelText,
    TextEditingController onSave, bool lock, String validater, TextInputType inputype) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: inputype,
        validator: (value) {
          if (value.isEmpty) {
            return validater;
          }
          return null;
        },
        controller: onSave,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            labelText: labelText,
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  });
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 0),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(mContext).size.width / 8,
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  });
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
