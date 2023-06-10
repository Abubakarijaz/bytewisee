import 'package:final_insta_gram/providers/user_provider.dart';
import 'package:final_insta_gram/responsive/mobile_screen_layout.dart';
import 'package:final_insta_gram/responsive/responsive_layout_screen.dart';
import 'package:final_insta_gram/responsive/web_screen_layout.dart';
import 'package:final_insta_gram/screens/login_screen.dart';
import 'package:final_insta_gram/screens/sign_up_screen.dart';
import 'package:final_insta_gram/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyD3rN1QDThhvBxX5fDATVrlmXTFe_Zcp2k',
        appId: "1:269263272308:web:723ca5f2f38e3cd0c7d421",
        messagingSenderId: "269263272308",
        projectId: "instagram-3a310",
        storageBucket: "instagram-3a310.appspot.com",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  ResponsiveLayout(
                    webScreenLayout: WebScreenLayout(),
                    mobileScreenLayout: MobileScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return LoginScreen();
            }),
      ),
    );
  }
}
