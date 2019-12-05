import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "http://lifemedia.id/wp-content/uploads/2019/09/cropped-favicon-1.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          draweritem(icon: Icons.account_circle, text: "Data Pengguna"),
          draweritem(icon: Icons.exit_to_app,text: "Log Out")

        ],
      ),
    );
  }
}

Widget draweritem({
  IconData icon,
  String text,
}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      text,
      style: TextStyle(
          color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
    ),
  );
}
