import 'package:flutter/material.dart';
import 'package:life_media_demo/widgetdashboard/piechart.dart';

class WidgetHomeDashboard extends StatefulWidget {
  @override
  _WidgetHomeDashboardState createState() => _WidgetHomeDashboardState();
}

class _WidgetHomeDashboardState extends State<WidgetHomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 6,
            child: Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Penggunaan Data",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  PieChartSample2()
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 6,
            child: Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Penggunaan Data",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  PieChartSample2()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
