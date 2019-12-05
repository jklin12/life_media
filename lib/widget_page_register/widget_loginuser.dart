import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:life_media_demo/page/page_dashboar.dart';
import 'dart:convert';

enum LoginStatus { notSignIn, signIn }

class WidgetUserLogin extends StatefulWidget {
  @override
  _WidgetUserLoginState createState() => _WidgetUserLoginState();
}

class _WidgetUserLoginState extends State<WidgetUserLogin> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      print("$email $password");
      testlogin();
    }
  }

  /* login() async {
    final response = await http.post("http://192.168.10.193/flutter/login.php",
        body: {"email": email, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String emailAPI = data['email'];
    String namaAPI = data['nama'];
    String id = data['id'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, emailAPI, namaAPI, id);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }*/

  testlogin() {
    if (email == "abc") {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => new DashBoard()));
    } else {
      print("gagal");
    }
  }

  /*savePref(int value, String email, String nama, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("email", email);
      preferences.setString("id", id);
    });
  }*/

  var value;
  /*getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }*/

  /*signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);

      _loginStatus = LoginStatus.notSignIn;
    });
  }*/

  /*@override
  void initState() {
    super.initState();
    getPref();
  }*/

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
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
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Image.asset(
                        'assets/img/icon_new.png',
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.width / 8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Login Pengguna",
                          style: (TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey)),
                        ),
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Please insert email";
                          }
                        },
                        onSaved: (e) => email = e,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            labelText: "Email",
                            hintText: "ex: ABC@mail.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: _secureText,
                        onSaved: (e) => password = e,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: Icon(_secureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          check();
                        },
                        child:
                            roundedRectButton("Login", signUpGradients, true))
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return DashBoard();
        break;
    }
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 0),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(mContext).size.width / 10,
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
