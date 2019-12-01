import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:life_media_demo/page/page_loginUser.dart';
import 'dart:convert';
import 'package:flutter_launch/flutter_launch.dart';

import 'package:life_media_demo/page/page_select.dart';
import 'package:life_media_demo/test.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String latd;
  String longi;
  Position position;

  void requestLocationPermission(BuildContext context) async {
    Position currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      position = currentPosition;
    });
  }

  login() async {
    final response = await http.post("http://192.168.1.69/test.php",
        body: {"lat": latd, "long": longi});

    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {});
      print(pesan);
      _ackAlert(context);
    } else {
      print(pesan);
      _ackAlert2(context);
    }
    return CircularProgressIndicator();
  }

  void cek() async {
    setState(() {
      print(latd = position.latitude.toString());
      print(longi = position.longitude.toString());
      _ackAlert(context);
    });
  }

  void _onLoading() {
    requestLocationPermission(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ColorLoader3();
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context);
      cek(); //pop dialog
    });
  }

  @override
  initState() {
    super.initState();
    requestLocationPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 50),
              ),
              InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserLogin()),
                      ),
                  child: roundedRectButton("Masuk", signInGradients, false)),
              InkWell(
                  onTap: () {
                    _onLoading();
                  },
                  child: roundedRectButton("Daftar", signUpGradients, false)),
              Text(
                "Daftar Jika Belum Memilki akun!",
                style: TextStyle(fontSize: 12, color: Colors.red),
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage("assets/ic_forward.png"),
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
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
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2.8,
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
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 6,
                            child: Text(
                              "Selamat Lokasi Anda Tercover!",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageSelect()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Lanjutkan",
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

_ackAlert2(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: MediaQuery.of(context).size.width / 1.8,
            height: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.warning,
                      size: 80.0,
                      color: Colors.red,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.width / 3.5,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Mohon maaf Lokasi Anda Belum Tercover!",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text("Silahkan Hubungi Life Media Center"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "kemabli",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                          onTap: () {
                            whatsAppOpen();
                          },
                          child: Image.asset(
                            'assets/img/whatsapp.png',
                            width: 30.0,
                            height: 30.0,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

void whatsAppOpen() async {
  await FlutterLaunch.launchWathsApp(phone: "622746055655", message: "Hello");
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
