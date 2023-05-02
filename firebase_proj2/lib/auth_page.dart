

import 'package:firebase_proj2/login.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage=true;
  void toggleScreen(){
    setState(() {//set state error find krny me 4 ghanty lagy
      showLoginPage =!showLoginPage;
    });


  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return loginPage(showRegisterPage:toggleScreen );
    }
    else
      {
        return RegisterPage(showLoginPage: toggleScreen);
      }



  }
}
