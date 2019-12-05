import 'package:flutter/material.dart';
import 'package:life_media_demo/page_register/page_penagihan.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DataPribadi extends StatefulWidget {
  DataPribadi({this.namaprhs, this.nonpwp, this.namanpwp, this.alamatnpwp});

  String namaprhs, nonpwp, namanpwp, alamatnpwp;

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
  final alamat = TextEditingController(text: '');

  int _radioValue1 = -1;
  int _radioValue2 = -1;
  String jnsid = "";
  String jnsklmn = "";
  String _date = "";

  void _handleRadioValueChange1(
    int value,
  ) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          jnsid = "KTP";
          break;
        case 1:
          jnsid = "SIM";

          break;
        case 2:
          jnsid = "Passport";
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
          jnsklmn = "Perempuan";
          break;
        case 1:
          jnsklmn = "Laki-Laki";

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
                inputData("ex: faris", "Nama Lengkap", nama, true,
                    "Masukan Nama", TextInputType.text),
                inputData2("ex: life media", "Nama Brand", brand, true,
                    TextInputType.text),
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
                    "Masukan Nama Brand", TextInputType.number),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 5),
                  child: new Text(
                    "Tanggal Lahir",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(1945, 1, 1),
                          maxTime: DateTime(2000, 12, 31), onConfirm: (date) {
                        print('confirm $_date');
                        _date = '${date.year}-${date.month}-${date.day}';
                      }, locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      _date,
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 5),
                  child: new Text(
                    "Jenis Kelamin",
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
                      groupValue: _radioValue2,
                      onChanged: _handleRadioValueChange2,
                    ),
                    new Text(
                      'Laki-Laki',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Radio(
                      value: 0,
                      groupValue: _radioValue2,
                      onChanged: _handleRadioValueChange2,
                    ),
                    new Text(
                      'Perempuan',
                      style: new TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                inputData("ex: Sales", "Pekerjaan", pekerjaan, true,
                    "Masukan pekerjaan", TextInputType.text),
                inputData2("ex: 021 844566 ", "no Telfon", notlp, true,
                    TextInputType.number),
                inputData("ex: 085769213588", "no Hp", nohp, true,
                    "Masukan Nomor Hp", TextInputType.number),
                inputData("ex: lifemedia@mail.com", "Email", email, true,
                    "Masukan Email", TextInputType.text),
                inputData("ex: Yogyakarta.Diy", "Alamat", alamat, true,
                    "Masukan Alamat", TextInputType.text),
                InkWell(
                    onTap: () {
                      final form = _key.currentState;
                      if (form.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Penagihan(
                                    nama: nama.text,
                                    brand: brand.text,
                                    pekerjaan: pekerjaan.text,
                                    nohp: nohp.text,
                                    noid: noid.text,
                                    notlp: notlp.text,
                                    email: email.text,
                                    jnsid: jnsid,
                                    jnsklmn: jnsklmn,
                                    alamatprb: alamat.text,
                                    tgllhr: _date,
                                    namaprhs: widget.namaprhs,
                                    namanpwp: widget.namanpwp,
                                    nonpwp: widget.nonpwp,
                                    alamatnpwp: widget.alamatnpwp,
                                  )),
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

Widget inputData(
    String hintText,
    String labelText,
    TextEditingController onSave,
    bool lock,
    String validater,
    TextInputType inputtype) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: inputtype,
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

Widget inputData2(String hintText, String labelText,
    TextEditingController onSave, bool lock, TextInputType inputtype) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
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
