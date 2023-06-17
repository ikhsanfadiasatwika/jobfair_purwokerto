import 'package:flutter/material.dart';
 

class AddPostingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Tambah Postingan'),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
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
              },
            ),
            ListTile(
              leading: Icon(Icons.home), // Ikon "Home"
              title: Text('Item 2'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
              },
            ),
             ListTile(
              leading: Icon(Icons.info), // Ikon "Home"
              title: Text('About'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
              },
            ),
             ListTile(
              leading: Icon(Icons.exit_to_app), // Ikon "Home"
              title: Text('Logout'),
              onTap: () {
                // Aksi ketika item di sidebar ditekan
              },
            ),
          ],
        ),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          
          color: Colors.white, // Warna latar belakang merah
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.green,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NAMA PERUSAHAAN'),
                    SizedBox(height: 14.0),    
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Nama',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LOKASI'),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan Lokasi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Container 3'),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan teks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Container 4'),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan teks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(

                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Container 5'),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan teks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Container 6'),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan teks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(14.0),
                // ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Container 7'),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan teks',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Fungsi yang akan dijalankan saat tombol simpan ditekan
                },
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white, 
                  fontSize: 16.0),
                ),

                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Warna latar belakang merah
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddPostingPage(),
    debugShowCheckedModeBanner: false,
  ));
}


