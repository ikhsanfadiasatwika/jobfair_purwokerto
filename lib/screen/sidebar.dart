import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/screen/login.dart';
import 'package:layout/screen/menu_home.dart';  
import 'package:layout/screen/menu_prusahan.dart';
import 'package:layout/screen/about.dart';
import 'package:layout/screen/menu_loker.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return 
     Drawer(
        // Sidebar menu
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu', style: TextStyle(fontSize: 24.0), ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), // Ikon "Home"
              title: Text('Home'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MenuHomeApp();
                      }));
              },
            ),
            ListTile(
              leading: Icon(Icons.search), // Ikon "Home"
              title: Text('Info Loker'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
                // Aksi yang akan dijalankan saat tombol "signup" ditekan
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return MylokerApp();
                      }));
              },
            ),
             ListTile(
              leading: Icon(Icons.info), // Ikon "Home"
              title: Text('About'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MyaboutApp();
                      }));
              },
            ),
             ListTile(
              leading: Icon(Icons.exit_to_app), // Ikon "Home"
              title: Text('Logout'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
                Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginApp();
                      }));
              },
            ),
          ],
        ),
      );
  }
}


