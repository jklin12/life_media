import 'package:flutter/material.dart';
import 'package:life_media_demo/page/page_perusahaan.dart';
import 'package:life_media_demo/page/page_pribadi.dart';

class WidgetSelect extends StatefulWidget {
  @override
  _WidgetSelectState createState() => _WidgetSelectState();
}

class _WidgetSelectState extends State<WidgetSelect> {
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
                  onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RdataPribadi()),
                        );
                  },
                  child:
                      roundedRectButton("Personal", signInGradients, false)),
              InkWell(
                  onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage2()),
                        );
                  },
                  child:
                      roundedRectButton("Perusahaan", signUpGradients, false))
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
                  borderRadius: BorderRadius.circular(30.0)),
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

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
