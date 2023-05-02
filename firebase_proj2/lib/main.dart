import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_proj2/main_page.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}
