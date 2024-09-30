import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_reg/Screens/Signup_Screen.dart';
import 'package:login_reg/Screens/welcomScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  bool _rememberMe = false; // متغير لتذكر حالة التذكر
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _loadRememberMe(); // تحميل حالة "تذكرني" من SharedPreferences
  }

  void _loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  // حفظ حالة "تذكرني" باستخدام SharedPreferences
  void _saveRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', value);
  }

  void _handlelogin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print("User Login: ${userCredential.user!.email}");

      // حفظ حالة "تذكرني"
      _saveRememberMe(_rememberMe);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome_Screen()));
    } catch (e) {
      print("Error during login: $e");
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      print("Google User Logged in: ${userCredential.user!.email}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome_Screen()));
    } catch (e) {
      print("Error during Google Sign-In: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login To your Account"),
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
                SizedBox(height: 30),
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
                SizedBox(height: 10),

                // إضافة مربع الاختيار "تذكرني"
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (newValue) {
                        setState(() {
                          _rememberMe = newValue!;
                        });
                      },
                    ),
                    Text("Remember Me"),
                  ],
                ),

                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _handlelogin();
                    }
                  },
                  child: Text("Login with Email"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _handleGoogleSignIn();
                  },
                  child: Text("Login with Google"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup_Screen()));
                  },
                  child: Text("Create an Account.."),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
