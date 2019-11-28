import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Card(elevation: 6,
                          child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
