import 'package:flutter/material.dart';
import 'package:life_media_demo/page_dashboard/page_about.dart';
import 'package:life_media_demo/page_dashboard/page_home.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    AboutPage()
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text("About"),
          )
        ],
      ),
    );
  }
}
