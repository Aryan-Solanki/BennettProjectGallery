import 'dart:async';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/forgotpassword.dart';
import 'package:bennettprojectgallery/login.dart';
import 'package:bennettprojectgallery/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FacultyLoginCard extends StatefulWidget {
  @override
  _FacultyLoginCardState createState() => _FacultyLoginCardState();
}

class _FacultyLoginCardState extends State<FacultyLoginCard> {
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
            Text("Faculty Sign In",
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
                      fontSize: 15,
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
                    hintText: 'facultyroll@bennett.edu.in',
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
                        .then((_) {});
                    Fluttertoast.showToast(
                        msg: "Login Successful",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
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
                      MaterialPageRoute(builder: (context) => LoginPage()));
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
                  child: Text("Student Login",
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
                          fontSize: 13)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
