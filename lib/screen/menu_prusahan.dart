import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/screen/sidebar_admin.dart';
import 'package:layout/screen/tambah_postingan.dart';
import 'package:layout/screen/edit_postingan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika yang ingin Anda jalankan saat tombol ditekan
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddPostingPage();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("PURWOKERTO JOB FAIR"),
      ),
      drawer: CustomAppBar(),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: db.collection('postingan').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("error"),
              );
            }

            //olah data
            var _data = snapshot.data!.docs;

            //_data.map((e) => null)
            return ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width:
                          double.infinity, // Lebar kotak mengisi seluruh layar
                      padding: EdgeInsets.all(
                          8.0), // Jarak antara isi dengan tepi kotak
                      decoration: BoxDecoration(
                        color: Colors.white, // Warna latar belakang kotak
                        borderRadius: BorderRadius.circular(
                            8.0), // Membuat sudut kotak melengkung
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.3), // Warna bayangan kotak
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
                                image:
                                    NetworkImage(_data[index].data()['image']),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "PROFESI: " +
                                        _data[index].data()['Profesi'],
                                    style: GoogleFonts.openSans(fontSize: 13)),
                                Text("LOKASI: " + _data[index].data()['Lokasi'],
                                    style: GoogleFonts.openSans(fontSize: 13)),
                                Text("GAJI: " + _data[index].data()['Gaja'],
                                    style: GoogleFonts.openSans(fontSize: 13)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "EMAIL: " + _data[index].data()['Email'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
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

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditPostingPage(
                                          postId: _data[index].id),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Logika untuk menangani tombol hapus
                                  _data[index].reference.delete().then(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text("data di hapus"))));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
