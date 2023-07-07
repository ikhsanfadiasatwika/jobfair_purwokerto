import 'package:flutter/material.dart';
import 'package:layout/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:layout/screen/test_firestore.dart';
import 'package:layout/screen/tambah_postingan.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: teststore(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}