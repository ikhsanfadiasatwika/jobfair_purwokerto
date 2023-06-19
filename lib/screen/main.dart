import 'package:flutter/material.dart';
// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

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
                    'JOB FAIR PURWOKERTO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8,top: 20,left: 120),
                  child: const Text(
                    'Tentang Aplikasi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.only(bottom: 8,top: 10),
                  child: const Text(
                    'Aplikasi mobile ini sebagai wadah untuk perusahaan yang ingin merekrut karyawan dan bagi orang yang '
                    'ingin mencari informasi lowongan kerja khususnya untuk wilayah purwokerto. Aplikasi ini berisikan profil '
                    'dan informasi perusahaan serta kita dapat melihat apakah perusahaan yang sedang membutuhkan karyawan Sesuai '
                    'dengan spesifikasi dan posisi yang ditawarkan oleh '
                    'perusahaan tersebut. Didalam aplikasi “purwokerto job fair” terdapat pilihan menu yang dapat diakses.',
                    
                    style: TextStyle(
                      
                       color: Color.fromARGB(255, 51, 51, 51),
                    ),
                  ),
                ),
               
                    Container(
                    padding: const EdgeInsets.only(top: 60, left: 70),
                    child: const Text(
                    'Anggota Kelompok\n',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                 ),
                 Container(
                  padding: const EdgeInsets.only(bottom: 8,top: 10, left: 50),
                  child: const Text(
                    '- Ikhsan fadia satwika (22SA11B011)\n'
                    '- Zakki khaerul umam (21SA1065)\n'
                    '- Muhammad ahdi nur fikri (21SA1197)\n'
                    '- Virgina sera Yuliani (21SA1045)\n'
                    '- Rahmatia (21SA1164)\n',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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



    return MaterialApp(
      title: 'Detail Postingan',
       theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('About'),
         
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/amikom.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,


          ],
        ),
      ),
    );
  }


  }
