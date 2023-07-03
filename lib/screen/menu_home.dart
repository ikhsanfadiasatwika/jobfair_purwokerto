import 'package:flutter/material.dart';
import 'package:layout/screen/menu_loker.dart';
import 'package:layout/screen/menu_prusahan.dart';



//menu home
class MenuHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuHomePage(),
    );
  }
}

class MenuHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        color: Colors.red,
        padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Job Fair Purwokwerto',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 80, width: 420,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                              // Aksi yang akan dijalankan saat tombol "signup" ditekan
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return MylokerApp();
                      }));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('CARI LOKER'),
                    ),
                    SizedBox(height: 10 ,width: 500,),
                    ElevatedButton(
                      onPressed: () {
                              // Aksi yang akan dijalankan saat tombol "signup" ditekan
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return PerushaanApp();
                      }));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 93, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('PERUSAHAAN'),
                    ),
                    
                    Padding(padding: EdgeInsets.only(bottom: 330)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
