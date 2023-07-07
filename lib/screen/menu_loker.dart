import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/screen/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:layout/screen/detail_postingan.dart';


class MylokerApp extends StatelessWidget {
  const MylokerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menuloker(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Menuloker extends StatefulWidget {
  const Menuloker({super.key});

  @override
  State<Menuloker> createState() => _MenulokerState();
}

class _MenulokerState extends State<Menuloker> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("PURWOKERTO JOB FAIR"),
      ),
       drawer: CustomAppBar(),
      
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>> (
        stream: db.collection('postingan').snapshots(),
      builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError){
          return const Center(
            child: Text("error"),
          );
        }
        //olah data
        var _data =snapshot.data!.docs;
        //_data.map((e) => null)
        return ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context,index) {
            return  Column(
          children: [
                    InkWell(
                      onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MydetailApp(postinganId: _data[index].id),
    ),
  );
},
              child: Container(
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
                            _data[index].data()['image']),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        

                        Text(
                          _data[index].data()['Namaperusahan'],
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("PROFESI: " +_data[index].data()['Profesi'],
                        style: GoogleFonts.openSans(fontSize: 13)
                        ),
                        Text(
                            "LOKASI: "+_data[index].data()['Lokasi'],
                             style: GoogleFonts.openSans(fontSize: 13)
                             ),

                        Text("GAJI: "+_data[index].data()['Gaja'],
                            style: GoogleFonts.openSans(fontSize: 13)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "EMAIL: "+_data[index].data()['Email'],
                          style: GoogleFonts.roboto(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  
                    
                ],
              ),
              
            ),
                    ),
             SizedBox(
              height:10 ,
      ),

          ]
            );
                  }
        );
      }
        ),
      ),
    );
  }
}
