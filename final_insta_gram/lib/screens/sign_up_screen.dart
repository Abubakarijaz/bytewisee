import 'dart:typed_data';

import 'package:final_insta_gram/resources/auth_methods.dart';
import 'package:final_insta_gram/screens/login_screen.dart';
import 'package:final_insta_gram/utils/colors.dart';
import 'package:final_insta_gram/utils/utils.dart';
import 'package:final_insta_gram/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _userNameController.text,
        bio: _bioController.text,
        file: _image!);
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackBar(res as BuildContext, context as String);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                height: 64,
                color: primaryColor,
              ),
              SizedBox(
                height: 20.0,
              ),
              Stack(
                children: [
                  _image !=
                          null //=================ternary operator=================
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(_image!),
                          radius: 64,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                          radius: 64,
                        ),
                  Positioned(
                      bottom: -10,
                      left: 90,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: Icon(Icons.add_a_photo),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                textEditingController: _userNameController,
                hintText: 'Enter Your Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter Your Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter Your Password',
                  isPass: true,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: 'Enter Your Bio',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Text('Sign Up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Sign in ',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
