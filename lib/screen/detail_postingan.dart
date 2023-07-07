import 'package:flutter/material.dart';
import 'package:layout/screen/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MydetailApp extends StatefulWidget {
  final String postinganId;

  const MydetailApp({required this.postinganId});

  @override
  State<MydetailApp> createState() => _MydetailAppState();
}

class _MydetailAppState extends State<MydetailApp> {
  var db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> _getPostinganData() async {
    final document =
        await db.collection('postingan').doc(widget.postinganId).get();
    return document;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Detail Postingan"),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _getPostinganData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("Data not found"),
            );
          }

          final postinganData = snapshot.data!.data()!;

          return ListView(
            children: [
              Image.network(
                postinganData['image'],
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postinganData['Namaperusahan'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Lokasi: ${postinganData['Lokasi']}',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      'Profesi: ${postinganData['Profesi']}',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 81, 77, 77),
                      ),
                    ),
                    // Add other information as needed
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 60, top: 10, bottom: 10),
                child: Text(
                  "Rp." + postinganData['Gaja'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(bottom: 8, top: 10, left: 30, right: 100),
                child: Text(
                  ' Persyaratan : \n'
                          '    ' +
                      postinganData['Persyaratan'],
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(postinganData['Email']),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 60,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Tentang Perusahaan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  postinganData['Tentang'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
