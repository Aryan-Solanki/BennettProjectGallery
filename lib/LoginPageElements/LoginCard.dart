import 'dart:async';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/forgotpassword.dart';
import 'package:bennettprojectgallery/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final myController = TextEditingController();
  bool Hoverforgotpass = false;
  bool Hoverdonthaveaccnt = false;
  String email = "";
  String password = "";
  final auth = FirebaseAuth.instance;
  Timer timer;
  User user;
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
            Text("Sign In",
                style: TextStyle(
                    height: 1.3,
                    fontFamily: "Metrisch-ExtraBold",
                    fontSize: 25)),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                "Please enter your credentials first.\nWo'nt be shared publicly.",
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
                      fontSize:15,
                      color: Colors.black54),
                  onChanged: (value) {
                    email = value.trim();
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
                child: GradientButton(
                  title: "Sign In",
                  buttonwidth: 300,
                  onPressed: () {
                    auth
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((_) {
                      print("SignIn Successfull");
                    });
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onHover: (x) {
                  if (x) {
                    setState(() {
                      Hoverdonthaveaccnt = true;
                    });
                  } else {
                    setState(() {
                      Hoverdonthaveaccnt = false;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Hoverdonthaveaccnt == true
                              ? Colors.black54
                              : Colors.white),
                    ),
                  ),
                  child: Text("Don't have a Account ?",
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          color: Colors.black54,
                          fontSize: 13)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ForgotPassword()));
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
                  child: Text("Forgot Password",
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",
                          color: Colors.black54,
                          fontSize:13)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
