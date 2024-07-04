import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/dongeng_page.dart'; // Sesuaikan dengan path ke DongengPage
import '../ui/ulasan_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Admin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "admin@admin.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Kumpulan Dongeng"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DongengPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Admin"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text("Ulasan"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UlasanPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
