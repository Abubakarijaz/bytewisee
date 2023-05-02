import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'auth_page.dart';
import 'forgot_password.dart';

class loginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const loginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
    );
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              //Hello Again
              Text(
                'Hello There',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Welcome Again',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 10.0),

              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              //PasswordTextfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              
              
              //forgot Password Area
              
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ForgotPasswordPage();
                  },),);
                },
                child: Text('Forgot Password?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
              ),
              SizedBox(height: 20.0),

              //Sign in
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Text("Sign In",
                        style: TextStyle(color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              //Not a Member ? Reg here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member ?'),

                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text('Register Here',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
