import 'package:flutter/material.dart';
import 'package:life_media_demo/page/page_penagihan.dart';
import 'package:life_media_demo/widget/timepicker.dart';

class DataPribadi extends StatefulWidget {
  @override
  _DataPribadiState createState() => _DataPribadiState();
}

class _DataPribadiState extends State<DataPribadi> {
  final _key = new GlobalKey<FormState>();
  final nama = TextEditingController(text: '');
  final brand = TextEditingController(text: '');
  final pekerjaan = TextEditingController(text: '');
  final nohp = TextEditingController(text: '');
  final email = TextEditingController(text: '');
  final notlp = TextEditingController(text: '');
  final noid = TextEditingController(text: '');

  int _radioValue1 = -1;

  void _handleRadioValueChange1(
    int value,
  ) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          print("SIM");
          break;
        case 1:
          print("KTP");
          break;
        case 2:
          print("Passport");
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
                        "Data Pribadi",
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
                inputData(
                    "ex: faris", "Nama Lengkap", nama, true, "Masukan Nama"),
                inputData("ex: life media", "Nama Brand", brand, true,
                    "Masukan Nama Brand"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 5),
                  child: new Text(
                    "Jenis ID",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
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
                      'KTP',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'SIM',
                      style: new TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    new Radio(
                      value: 2,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'Passport',
                      style: new TextStyle(
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                inputData("ex: 3520000000190798", "Nomor Identitas", noid, true,
                    "Masukan Nama Brand"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BasicDateField(),
                ),
                inputData("ex: Sales", "Pekerjaan", pekerjaan, true,
                    "Masukan pekerjaan"),
                inputData("ex: 021 844566 ", "no Telfon", notlp, true,
                    "Masukan No Telfon"),
                inputData("ex: 085769213588", "no Hp", nohp, true,
                    "Masukan Nomor Hp"),
                inputData("ex: lifemedia@mail.com", "Email", email, true,
                    "Masukan Email"),
                InkWell(
                    onTap: () {
                      final form = _key.currentState;
                      if (form.validate()) {
                        _key.currentState.save();
                        print(nama.text);
                        print(brand.text);
                        print(pekerjaan.text);
                        print(noid.text);
                        print(nohp.text);
                        print(notlp.text);
                        print(email.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Penagihan()),
                        );
                      }
                    },
                    child: roundedRectButton(
                        "Selanjutnya", signUpGradients, false)),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
      padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 5.0),
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
