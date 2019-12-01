import 'package:flutter/material.dart';
import 'package:life_media_demo/page/first_page.dart';
import 'package:geolocator/geolocator.dart';

class PPaket extends StatefulWidget {
  @override
  _PPaketState createState() => _PPaketState();
}

class _PPaketState extends State<PPaket> {
  Position position;

  void requestLocationPermission(BuildContext context) async {
    Position currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      position = currentPosition;
      print(position);
    });
  }

  final _key = new GlobalKey<FormState>();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  final waktu = TextEditingController();
  bool _termsChecked = false;

  void _handleRadioValueChange1(
    int value,
  ) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          print("open");
          break;
        case 1:
          print("close");
          break;
        case 2:
          print("close");
          break;
      }
    });
  }

  void handleRadioValueChange1(int value) {
    print(value);
    setState(() => _radioValue1 = value);
  }

  void _handleRadioValueChange2(
    int value,
  ) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          print("open");
          break;
        case 1:
          print("close");
          break;
      }
    });
  }

  void handleRadioValueChange2(int value) {
    print(value);
    setState(() => _radioValue2 = value);
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
                        "Pilih Paket",
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 5),
                  child: new Text(
                    "Pilih Paket Internet :",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          '20 Mbps',
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          '50 Mbps',
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 2,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          '100 Mbps',
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 5),
                  child: new Text(
                    "Pilih Paket TV Kabel :",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioValue2,
                          onChanged: _handleRadioValueChange2,
                        ),
                        new Text(
                          'Live VU',
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: _radioValue2,
                          onChanged: _handleRadioValueChange2,
                        ),
                        new Text(
                          'Life Vision',
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    inputData("ex : 5 bulan", "Jangka Waktu Berlangganan",
                        waktu, true, "Masukan Jangka Waktu Berlangganan "),
                    CheckboxListTile(
                        title: InkWell(
                          onTap: () {
                            print("test!");
                            _ackAlertSK(context);
                          },
                          child: new Text(
                            'Syarat dan ketentuan',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        value: _termsChecked,
                        onChanged: (bool value) =>
                            setState(() => _termsChecked = value)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            if (_key.currentState.validate()) {
                              if (_radioValue1 < 0) {
                                final sncakbar = SnackBar(
                                  content: Text("Pilih Paket internet"),
                                  action: SnackBarAction(
                                    label: 'Ok!',
                                    onPressed: () {},
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(sncakbar);
                              } else if (!_termsChecked) {
                                final sncakbar = SnackBar(
                                  content: Text("Setujui Syarat dan Ketentuan!"),
                                  action: SnackBarAction(
                                    label: 'Ok!',
                                    onPressed: () {},
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(sncakbar);
                              } else {
                                print(waktu.text);
                                _ackAlert(context);
                                requestLocationPermission(context);
                              }
                            }
                          },
                          child: roundedRectButton(
                              "Selanjutnya", signUpGradients, true)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget sncakbar(String notif) {
  return Builder(builder: (BuildContext mContext) {
    return SnackBar(
      content: Text(notif),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
  });
}

Widget inputData(String hintText, String labelText,
    TextEditingController onSave, bool lock, String validater) {
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

_ackAlert(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 1.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      size: 60.0,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.width / 2.8,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Selamat Anda Sudah Mendaftar!",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tunggu Pemberitahuan selanjutnya",
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

_ackAlertSK(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Syarat & Ketentaun",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Dengan menyetujui formulir berlangganan ini, Saya menyatakan bahwa seluruh data yang di berikan disini adalah benar dan memahami sertamenyetujui segala persyaratan dan ketentuan perjanjian berlangganan  yang tercantum",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Kembali",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
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
