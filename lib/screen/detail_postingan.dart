import 'package:flutter/material.dart';
import 'package:layout/screen/sidebar.dart';
//detail-postingan

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Nama Perusahaan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Text(
                  'Lokasi : purwokerto utara',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 50,top: 10,bottom: 10),
                  child: const Text("Rp.4.000.000",
                  
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color.fromARGB(255, 255, 0, 0),
                    
                    ),
                    ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'job Desk : IT analis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Persyaratan :',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8,top: 10),
                  child: const Text(
                    '- Umur minimal 18\n'
                    '- pendidikan minimal S1\n'
                    '- berpengalaman\n'
                    '- memahamin oop\n',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  child: Column(children: [
                    SizedBox(height: 7),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 117, 12, 101),
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Email : telkom@tlkm.com'),
                  ),
                  ]),
                ),
                    Container(
                    padding: const EdgeInsets.only(top: 60, left: 70),
                    child: const Text(
                    'Tentang perusahaan\n',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
    ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
      
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
      
    );

    return MaterialApp(
      title: 'Detail Postingan',
       theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Tambahkan logika yang ingin Anda jalankan saat tombol ditekan
    },
    child: Icon(Icons.add),backgroundColor: Colors.red,
  ),
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("PURWOKERTO JOB FAIR"),
      ),
       drawer: CustomAppBar(),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/telkom.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,

            textSection,
          ],
        ),
      ),
    );
  }


  }
