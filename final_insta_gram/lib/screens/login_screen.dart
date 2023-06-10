import 'package:final_insta_gram/resources/auth_methods.dart';
import 'package:final_insta_gram/utils/colors.dart';
import 'package:final_insta_gram/utils/utils.dart';
import 'package:final_insta_gram/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(); //_emailcontroer and _passwdcontorolller me _ cheez is property ko private bna rahi ha tak ye kisi aur page me use na hoksy
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading=false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading=true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if(res=='success'){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );

    }
    else{
      showSnackBar(res as BuildContext, context as String);
    }
    setState(() {
      _isLoading=false;
    });
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
                height: 50.0,
              ),
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                height: 64,
                color: primaryColor,
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter Your Password',
                  isPass: true,
                  textInputType: TextInputType.text),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  child:_isLoading ? Center(child: CircularProgressIndicator(
                    color: primaryColor,
                  ),): Text('Log in'),
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
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUPScreen()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: blueColor),
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

class ResponsiveScreen {
}
