import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/Screens/login.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

String? _email=_auth.currentUser!.email;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Logged In With : $_email"),
             SizedBox(height: 50,),

             ElevatedButton(onPressed: (){
               _auth.signOut();
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen(),));
               },
             child: Text("Signout"),
             ),
           ],
          ),
        ),
      ),
    );
  }
}
