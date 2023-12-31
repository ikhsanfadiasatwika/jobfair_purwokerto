import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:layout/screen/menu_prusahan.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddPostingPage extends StatefulWidget {
  @override
  State<AddPostingPage> createState() => _AddPostingPageState();
}

class _AddPostingPageState extends State<AddPostingPage> {
  var db = FirebaseFirestore.instance;
  final TextEditingController namaperusahanController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController profesiController = TextEditingController();
  final TextEditingController persyaratanController = TextEditingController();
  final TextEditingController gajiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tentangController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImageAndSaveData() async {
    String namaperusahaan = namaperusahanController.text;
    String Lokasi = lokasiController.text;
    String profesi = profesiController.text;
    String persyaratan = persyaratanController.text;
    String gaji = gajiController.text;
    String email = emailController.text;
    String tentang = tentangController.text;

    final loker = <String, dynamic>{
      "Namaperusahan": namaperusahaan,
      "Lokasi": Lokasi,
      "Profesi": profesi,
      "Persyaratan": persyaratan,
      "Gaja": gaji,
      "Email": email,
      "Tentang": tentang,
      "image":
          "https://1.bp.blogspot.com/-FjQUlOvcDaI/XpKYTM5eLqI/AAAAAAAALH0/sX0sDZY51EkhaziCI9xTLBbx55YdnuOMgCNcBGAsYHQ/s1600/Universitas%2BAmikom%2BPurwokerto%2B%255Bwww.blogovector.com%255D.png",
    };

    // Tambahkan dokumen ke koleksi "postingan"
    DocumentReference docRef = await db.collection("postingan").add(loker);
    String docId = docRef.id;

    if (_imageFile != null) {
      // Upload gambar ke Firebase Storage
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/$docId.jpg');
      final uploadTask = storageRef.putFile(_imageFile!);
      await uploadTask.whenComplete(() {
        print('Image uploaded');
      });

      // Dapatkan URL gambar yang diunggah
      String imageUrl = await storageRef.getDownloadURL();

      // Perbarui URL gambar di dokumen yang sesuai di Firestore
      await db.collection("postingan").doc(docId).update({
        "image": imageUrl,
      });
      print('Image URL updated in the database');
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PerushaanApp();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Tambah Postingan"),
      ),
    
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NAMA PERUSAHAAN'),
                    SizedBox(height: 14.0),
                    TextField(
                      controller: namaperusahanController,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LOKASI'),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: lokasiController,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        await _pickImage();
                      },
                      child: Text('Upload Image'),
                    ),
                    SizedBox(height: 16.0),
                    if (_imageFile != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected Image:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Image.file(
                            _imageFile!,
                            height: 200.0,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Profesi'),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: profesiController,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('persyaratan'),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: persyaratanController,
                      maxLines:
                          null, // Mengatur maxLines menjadi null agar menjadi TextArea
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('gaji'),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: gajiController,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('email'),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: emailController,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('tentang'),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: tentangController,
                      maxLines: null,
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
                onPressed: () async {
                  await _uploadImageAndSaveData();
                },
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
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
