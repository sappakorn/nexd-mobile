import 'package:flutter/material.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:fluttertest/screen_widget/auth/logout.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle navigation or action here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle navigation or action here
            },
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                authService.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginWidget(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
