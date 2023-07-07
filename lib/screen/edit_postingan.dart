import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:layout/screen/menu_prusahan.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditPostingPage extends StatefulWidget {
  final String postId;

  EditPostingPage({required this.postId});

  @override
  State<EditPostingPage> createState() => _EditPostingPageState();
}

class _EditPostingPageState extends State<EditPostingPage> {
  var db = FirebaseFirestore.instance;
  final TextEditingController namaperusahaanController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController profesiController = TextEditingController();
  final TextEditingController persyaratanController = TextEditingController();
  final TextEditingController gajiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tentangController = TextEditingController();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    fetchPostData();
  }

  Future<void> fetchPostData() async {
    // Dapatkan data postingan berdasarkan ID
    DocumentSnapshot postSnapshot =
        await db.collection('postingan').doc(widget.postId).get();

    if (postSnapshot.exists) {
      // Mengisi nilai-nilai dari data postingan ke field input
      Map<String, dynamic> postData = postSnapshot.data() as Map<String, dynamic>;
      namaperusahaanController.text = postData['Namaperusahan'] ?? '';
      lokasiController.text = postData['Lokasi'] ?? '';
      profesiController.text = postData['Profesi'] ?? '';
      persyaratanController.text = postData['Persyaratan'] ?? '';
      gajiController.text = postData['Gaja'] ?? '';
      emailController.text = postData['Email'] ?? '';
      tentangController.text = postData['Tentang'] ?? '';
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _updatePost() async {
    String namaperusahaan = namaperusahaanController.text;
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
    };

    // Perbarui dokumen postingan dengan data yang diperbarui
    await db.collection("postingan").doc(widget.postId).update(loker);

    if (_imageFile != null) {
      // Upload gambar ke Firebase Storage
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${widget.postId}.jpg');
      final uploadTask = storageRef.putFile(_imageFile!);
      await uploadTask.whenComplete(() {
        print('Image uploaded');
      });

      // Dapatkan URL gambar yang diunggah
      String imageUrl = await storageRef.getDownloadURL();

      // Perbarui URL gambar di dokumen yang sesuai di Firestore
      await db.collection("postingan").doc(widget.postId).update({
        "image": imageUrl,
      });
      print('Image URL updated in the database');
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Postingan'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      controller: namaperusahaanController,
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
                  await _updatePost();
                },
                child: Text(
                  'Update',
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
