import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_reg/Screens/Signup_Screen.dart';
import 'package:login_reg/Screens/login.dart';
import 'package:login_reg/Screens/welcomScreen.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(


    options: FirebaseOptions(
      apiKey: 'AIzaSyDB-wtfa2iVsnJfU-dWAmOBKXgkOHwfh08',
      appId: '1:167572580881:android:265b3180212b2ba7805fb0',
      messagingSenderId: '167572580881',
      projectId: 'auth-a4c4f'),
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      home: Login_Screen(),
    );
  }
}
