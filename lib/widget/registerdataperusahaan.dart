import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:life_media_demo/page/page_pribadi.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool lock2;

  final savenama = TextEditingController();
  final savenamanpwp = TextEditingController();
  final savenonpwp = TextEditingController();
  final savealmatnpwp = TextEditingController();

  final _key = new GlobalKey<FormState>();
  int _radioValue1 = -1;
  bool _statutsFormField;

  void _handleRadioValueChange1(
    int value,
  ) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          print("close");
          _statutsFormField = false;
          break;
        case 1:
          print("open");
          _statutsFormField = true;
          break;
      }
    });
  }

  void handleRadioValueChange(int value) {
    print(value);
    setState(() => _radioValue1 = value);
  }

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
                        "Data Perusahaan",
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
                inputData2(
                  "PT. Sims",
                  "Nama Perusahaan",
                  savenama,
                  "Masukan Nama Perusahaan",
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 5),
                  child: new Text(
                    "NPWP",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'Ya',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'Tidak',
                      style: new TextStyle(
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                inputData(
                    "ex : Budi Harsono",
                    "Nama Npwp",
                    savenamanpwp,
                    "Masukan Nama NPWP",
                    _statutsFormField,
                    _radioValue1 < 0,
                    TextInputType.text),
                inputData(
                    "ex : 0123456",
                    "No Npwp",
                    savenonpwp,
                    "Masukan Nomor NPWP",
                    _statutsFormField,
                    _radioValue1 < 0,
                    TextInputType.number),
                inputData(
                    "ex : Yogyakarta,sleman,maguwo",
                    "Alamat Npwp",
                    savealmatnpwp,
                    "Masukan Alamat NPWP",
                    _statutsFormField,
                    _radioValue1 < 0,
                    TextInputType.text),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RdataPribadi(
                                namaprhs: savenama.text,
                                namanpwp: savenamanpwp.text,
                                nonpwp: savenonpwp.text,
                                alamatnpwp: savealmatnpwp.text,
                              )),
                    );
                    /*if (_key.currentState.validate()) {
                      if (_radioValue1 < 0) {
                        {
                          final snackBar = SnackBar(
                            content: Text('Pilih NPWP'),
                            action: SnackBarAction(
                              label: 'Ok !',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        insert();
                        print(
                            "$savenama $savenamanpwp $savenonpwp $savealmatnpwp ");
                      }
                    }*/
                  },
                  child:
                      roundedRectButton("Selanjutnya", signUpGradients, false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget sncakbar() {
  return Builder(builder: (BuildContext mContext) {
    return SnackBar(
      content: Text("Pilih NPWP"),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
  });
}

Widget inputData(
    String hintText,
    String labelText,
    TextEditingController onSave,
    String validater,
    bool en,
    bool nilai,
    TextInputType inputtype) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value) {
          if (nilai) {
            return validater;
          }
          return null;
        },
        enabled: en,
        keyboardType: inputtype,
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

Widget inputData2(
  String hintText,
  String labelText,
  TextEditingController simpan,
  String validater,
) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return validater;
          }
          return null;
        },
        controller: simpan,
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
