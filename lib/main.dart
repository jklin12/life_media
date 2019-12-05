import 'package:flutter/material.dart';
import 'package:life_media_demo/page_register/first_page.dart';
import 'package:life_media_demo/page_register/page_dashboar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {'/exit': (BuildContext context) => FirstPage()},
      home: DashBoard(),
    );
  }
}
