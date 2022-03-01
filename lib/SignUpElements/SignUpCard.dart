import 'dart:async';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../login.dart';

class SignUpCard extends StatefulWidget {
  @override
  _SignUpCardState createState() => _SignUpCardState();
}

const spinkit = SpinKitThreeInOut(
  color: Colors.white,
  size: 20.0,
);

class _SignUpCardState extends State<SignUpCard> {
  final myController = TextEditingController();
  bool Hoverforgotpass = false;
  bool Hoveralreadyhaveaccnt = false;
  String emailId = "";
  String password = "";
  bool loading=false;
  final auth = FirebaseAuth.instance;
  Timer timer;
  User user;
  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      // user.delete().then((value) => (){
      //   auth.createUserWithEmailAndPassword(email: emailId, password: password).then((_){
      //     print("User Successfully Verified")
      //   });
      // });
      timer.cancel();
      print("Email Verified");
    }
  }

  createverifyUser() {
    auth
        .createUserWithEmailAndPassword(email: emailId, password: password)
        .then((_) async {
      user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification().then((value) => () {
              timer = Timer.periodic(Duration(seconds: 5), (timer) {
                checkEmailVerified();
              });
            });
      }
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => VerifyScreen()));
    });
  }

  bool verificationSent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(20),
        width: 330,
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sign Up",
                style: TextStyle(
                    height: 1.3,
                    fontFamily: "Metrisch-ExtraBold",
                    fontSize: 25)),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                "Please enter your email first.\nVerification link will be send",
                style: TextStyle(
                    fontFamily: "Metrisch-Medium",
                    height: 1.3,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: TextField(
                  style: TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54),
                  onChanged: (value) {
                    emailId = value.trim();
                    ;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: "Metrisch-Medium",
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black54),
                    hintText: 'roll@bennett.edu.in',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                      fontFamily: "Metrisch-Medium",
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54),
                  onChanged: (value) {
                    password = value.trim();
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: "Metrisch-Medium",
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.black54),
                    hintText: 'password',
                    // contentPadding:
                    // EdgeInsets.symmetric(horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.center,
                child: loading==false?GradientButton(
                  title: "Send Verification",
                  buttonwidth: 300,
                  onPressed: () async {
                    setState(() {
                      verificationSent = true;
                      loading=true;
                    });
                    createverifyUser();
                    // UserCredential userCredential =
                    //     await FirebaseAuth.instance.signInAnonymously();
                  },
                ):Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        colors: colors),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Center(
                    child: spinkit,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onHover: (x) {
                  if (x) {
                    setState(() {
                      Hoveralreadyhaveaccnt = true;
                    });
                  } else {
                    setState(() {
                      Hoveralreadyhaveaccnt = false;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Hoveralreadyhaveaccnt == true
                              ? Colors.black54
                              : Colors.white),
                    ),
                  ),
                  child: Text("Already have an Account ?",
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          color: Colors.black54,
                          fontSize: 13)),
                ),
              ),
            ),
            verificationSent
                ? Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        loading=false;
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => ForgotPassword()));
                        user.delete().then((value) => () {});
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            Hoverforgotpass = true;
                          });
                        } else {
                          setState(() {
                            Hoverforgotpass = false;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 1),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Hoverforgotpass == true
                                    ? Colors.black54
                                    : Colors.white),
                          ),
                        ),
                        child: Text("Resend Verification",
                            style: TextStyle(
                                fontFamily: "Metrisch-Medium",
                                color: Colors.black54,
                                fontSize: 13)),
                      ),
                    ),
                  )
                : Center(),
          ],
        ),
      ),
    );
  }
}
