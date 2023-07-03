import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/screen/sidebar.dart';


class PerushaanApp extends StatelessWidget {
  const PerushaanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPerusahaan(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuPerusahaan extends StatefulWidget {
  const MenuPerusahaan({super.key});

  @override
  State<MenuPerusahaan> createState() => _MenuPerusahaanState();
}

class _MenuPerusahaanState extends State<MenuPerusahaan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
     
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity, // Lebar kotak mengisi seluruh layar
              padding: EdgeInsets.all(8.0), // Jarak antara isi dengan tepi kotak
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang kotak
                borderRadius:
                    BorderRadius.circular(8.0), // Membuat sudut kotak melengkung
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Warna bayangan kotak
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 5), // Posisi bayangan
                  ),
                ],
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.all(2)),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://1.bp.blogspot.com/-FjQUlOvcDaI/XpKYTM5eLqI/AAAAAAAALH0/sX0sDZY51EkhaziCI9xTLBbx55YdnuOMgCNcBGAsYHQ/s1600/Universitas%2BAmikom%2BPurwokerto%2B%255Bwww.blogovector.com%255D.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AMIKOM PURWOKERTO",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("PROFESI:OFFICE BOY",
                        style: GoogleFonts.openSans(fontSize: 13)
                        ),
                        Text(
                            "LOKASI: PURWOKERTO UTARA",
                             style: GoogleFonts.openSans(fontSize: 13)
                             ),

                        Text("GAJI: 2.200.000",
                            style: GoogleFonts.openSans(fontSize: 13)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "EMAIL: @amikompurwokerto.ac.id",
                          style: GoogleFonts.roboto(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  
                    Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Logika untuk menangani tombol edit
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Logika untuk menangani tombol hapus
                },
              ),
            ],
                  ),
                ],
              ),
              
            ),
            SizedBox(
              height:10 ,
             ),
               Container(
                width: double.infinity, // Lebar kotak mengisi seluruh layar
                padding: EdgeInsets.all(8.0), // Jarak antara isi dengan tepi kotak
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang kotak
                  borderRadius:
                      BorderRadius.circular(8.0), // Membuat sudut kotak melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Warna bayangan kotak
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 5), // Posisi bayangan
                    ),
                  ],
                ),
            
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.all(2)),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://lh3.googleusercontent.com/wPmx6o5n7b2rdlmcn6PVhKkO0PkC7qSwIT2fJyyMrfg5VvCVzES-t84gmYOgP-4Avqo"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "OKE MART",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "PROFESI: KASIR WANITA",
                          style: GoogleFonts.openSans(fontSize: 13),
                        ),
                        Text(
                            "LOKASI: PURWOKERTO UTARA",
                             style: GoogleFonts.openSans(fontSize: 13)
                             ),
                        Text(
                          "GAJI: 2.000.000",
                          style: GoogleFonts.openSans(fontSize: 13),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "EMAIL: okemart@gmail.com",
                          style: GoogleFonts.roboto(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        ],
                        
                      ),
                    ),
                    
                      Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Logika untuk menangani tombol edit
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Logika untuk menangani tombol hapus
                  },
                ),
              ],
                    ),
                  ],
                ),
                
              ),
             SizedBox(
              height:10 ,
             ),
               Container(
                width: double.infinity, // Lebar kotak mengisi seluruh layar
                padding: EdgeInsets.all(8.0), // Jarak antara isi dengan tepi kotak
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang kotak
                  borderRadius:
                      BorderRadius.circular(8.0), // Membuat sudut kotak melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Warna bayangan kotak
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 5), // Posisi bayangan
                    ),
                  ],
                ),
            
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.all(2)),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://tse3.mm.bing.net/th?id=OIP.xPjLGE2kvXdj5Y4A29f7CAHaHa&pid=Api&P=0&h=180"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "MIE GACOAN",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("PROFESI:PELAYAN LAKI-LAKI",
                        style: GoogleFonts.openSans(fontSize: 13)
                        ),
                        Text(
                            "LOKASI: KARANGWANGKAL",
                             style: GoogleFonts.openSans(fontSize: 13)
                             ),

                        Text("GAJI: 2.000.000",
                            style: GoogleFonts.openSans(fontSize: 13)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "EMAIL: miegacoan@gmail.com",
                          style: GoogleFonts.roboto(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        ],
                        
                      ),
                    ),
                    
                      Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Logika untuk menangani tombol edit
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Logika untuk menangani tombol hapus
                  },
                ),
              ],
                    ),
                  ],
                ),
                
              ),
            
          ],
        ),
        
      ),
    );
  }
}
