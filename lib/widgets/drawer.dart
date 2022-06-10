import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(),
                  accountName: Text(
                    "USERNAME",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    "USEREMAIL",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
