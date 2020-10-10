import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/components/Flashchat/custom_button.dart';
import 'package:flutter_app/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String emailId;
  String password;
  bool showSpinner=false;
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 220.0,
                    child: Image.asset('images/sup.jpg'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: _controller1,
                  keyboardType: TextInputType.emailAddress,

                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    emailId=value;
                  },
                  decoration: kDecoration.copyWith(hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  color: Colors.transparent,
                  child: TextField(
                    controller: _controller2,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      password=value;
                    },
                    decoration:
                        kDecoration.copyWith(hintText: 'Enter your password'),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                CustomButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner=true;
                    });
                    try {
                      final _auth = FirebaseAuth.instance;
                      final user = await _auth.signInWithEmailAndPassword(
                          email: emailId, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      _controller1.clear();
                      _controller2.clear();
                    }catch (e){
                      Fluttertoast.showToast(msg: 'WROng password');
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  },
                  title: 'Log in',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
