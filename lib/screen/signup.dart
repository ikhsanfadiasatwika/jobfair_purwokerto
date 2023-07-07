// SIGNUP KELARRR
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:layout/screen/login.dart';


enum UserType { Admin, User,}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserType? _selectedUserType = UserType.Admin;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Sign Up'),
      ),
      body: Container(
        color: Colors.red,
        padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
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
              SizedBox(height: 80),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    DropdownButtonFormField<UserType>(
              value: _selectedUserType,
              onChanged: (UserType? newValue) {
                setState(() {
                  _selectedUserType = newValue;
                });
              },
              items: [
                DropdownMenuItem(
                  value: UserType.Admin,
                  child: Text('Admin'),
                ),
                DropdownMenuItem(
                  value: UserType.User,
                  child: Text('User'),
                ),
                
              ],
            ),
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                          registerUser();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Sign Up'),
                    ),
                    SizedBox(height: 10),
                    
                    TextButton(
                      onPressed: () {
                      
                            // Aksi yang akan dijalankan saat tombol "signup" ditekan
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginPage();
                      }));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 100)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorDialog(String errorMessage) {
    String title;
    String content;

    switch (errorMessage) {
      case 'email-already-in-use':
        title = 'Email sudah digunakan';
        content = 'Silakan gunakan email lain.';
        break;
      case 'weak-password':
        title = 'Password terlalu lemah';
        content = 'Silakan gunakan password yang lebih kuat.';
        break;
      default:
        title = 'Error';
        content = 'email dan password sudah dipakai.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
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

  void registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Menentukan jenis pengguna berdasarkan pilihan yang dipilih pengguna
      String userType;
      switch (_selectedUserType) {
        case UserType.Admin:
          userType = 'admin';
          break;
        case UserType.User:
          userType = 'User';
          break;
       default:
          userType = 'User';
      }

      // Memasukkan data pengguna ke Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'type': userType,
      });
      showSuccessDialog();
    } catch (e) {
      String errorMessage = '';

      // Tangani kesalahan yang mungkin terjadi
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'email-already-in-use';
            break;
          case 'weak-password':
            errorMessage = 'weak-password';
            break;
          default:
            errorMessage = '';
        }
      }

      showErrorDialog(errorMessage);
    }
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pendaftaran Berhasil'),
          content: Text('Akun Anda telah berhasil didaftarkan.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()), // Halaman login
                );
              },
            ),
          ],
        );
      },
    );
  }
}

