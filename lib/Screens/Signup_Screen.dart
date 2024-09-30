import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/Screens/login.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  String _email = "";
  String _password = "";
  void _handleSignup()async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
    print("User Registed :${userCredential.user!.email}");
    }
    catch(e){
      print("error during regisration : $e");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email..",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your email";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _PasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password..",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your password";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _handleSignup();
                  }

                }, child: Text("Sign Up")),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen(),));
                }, child: Text("you have account ? Login "))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
