import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFFFF9945),
                Color(0xFFFc6076),
              ])),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
                elevation: 10,
                child: Container(
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      new Expanded(
                        child: Container(
                          child: Center(
                            child: Text("DASHBOARD",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

