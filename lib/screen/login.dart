/// LOGIN PAGE KELAR
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:layout/screen/signup.dart';
import 'package:layout/screen/menu_loker.dart';
import 'package:layout/screen/menu_prusahan.dart';
import 'package:layout/screen/menu_home.dart';  



class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _PasswordController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Login'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 248, 71, 58),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Job Fair',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  TextField(controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(controller: _PasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _login(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Aksi yang akan dijalankan saat tombol "signup" ditekan
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _PasswordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Melakukan login ke Firebase Authentication
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Mengambil data user dari Firestore
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential.user!.uid)
                .get();

        // Memeriksa tipe user
        String userType = userSnapshot.data()?['type'];

        // Mengarahkan pengguna ke halaman berdasarkan tipe user
        if (userType == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MenuHomeApp(),
            ),
          );
        } else if (userType == 'User') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MylokerApp(),
            ),
          );
        }
      } catch (e) {
        // Menampilkan pesan error jika login gagal
        String errorMessage = e.toString();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
}
