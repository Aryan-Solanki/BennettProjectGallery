import 'dart:async';

import 'package:bennettprojectgallery/DashBoard.dart';
import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/facultylogin.dart';
import 'package:bennettprojectgallery/forgotpassword.dart';
import 'package:bennettprojectgallery/services/faculty_service.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:bennettprojectgallery/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../errors.dart';
import '../form_error.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

bool loading = false;
List<String> errors = [];

const spinkit = SpinKitThreeInOut(
  color: Colors.white,
  size: 20.0,
);

class _LoginCardState extends State<LoginCard> {
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  final myController = TextEditingController();
  bool Hoverforgotpass = false;
  bool Hoverdonthaveaccnt = false;
  bool Facultysignin = false;
  String email = "";
  String password = "";
  final auth = FirebaseAuth.instance;
  Timer timer;
  User user;
  ProjectServices _services = ProjectServices();
  var collectionRef;

  @override
  void initState() {
    collectionRef = _services.studentCol;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> checkIfDocExists(String docId) async {
      try {
        var doc = await collectionRef.doc(docId).get();
        return doc.exists;
      } catch (e) {
        return false;
      }
    }

    Future<bool> checkIfdocumentExists(String email) async {
      bool docExists = await checkIfDocExists(email);
      return docExists;
    }

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
              height: 7.5,
            ),
            FormError(errors: errors),
            SizedBox(
              height: 7.5,
            ),
            Align(
                alignment: Alignment.center,
                child: loading == false
                    ? GradientButton(
                        title: "Sign In",
                        buttonwidth: 300,
                        onPressed: () async {
                          errors=[];
                          try {
                            String result = email
                                .substring(0, email.indexOf('@'))
                                .toUpperCase();
                            setState(() {
                              loading = true;
                            });

                            bool check = await checkIfdocumentExists(result);

                            if (check) {
                              try {
                                await auth
                                    .signInWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((_) async {
                                  UserServices _services = new UserServices();
                                  var doc = await _services.getUserById(result);
                                  String batch = doc["batch"];
                                  String course = doc["course"];
                                  String email1 = doc["email"];
                                  String image = doc["image"];
                                  String name = doc["name"];
                                  String school = doc["school"];
                                  String yog = doc["yog"].toString();
                                  List<dynamic> projectList = doc["projects"];
                                  print(batch);
                                  print(course);
                                  print(email1);

                                  Fluttertoast.showToast(
                                      msg: "Login Successful",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashBoard(
                                              id: result,
                                              batch: batch,
                                              course: course,
                                              email: email1,
                                              image: image,
                                              name: name,
                                              school: school,
                                              yog: yog,
                                              projectList: projectList)));
                                  loading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  setState(() {
                                    addError(error: kUserNotFoundError);
                                  });
                                } else if (e.code == 'wrong-password') {
                                  setState(() {
                                    addError(error: kPassWrongError);
                                  });
                                } else if (e.code == 'network-request-failed') {
                                  setState(() {
                                    addError(error: kFirebaseNetworkError);
                                  });
                                }
                                else {
                                  setState(() {
                                    addError(error: ksomethingerror);
                                  });
                                }
                                print('Failed with error code: ${e.code}');
                                print(e.message);
                                // TODO: Raise Error
                              } catch (e) {
                                print("Something Went Wrong");
                                //TODO: Raise Error
                              }
                            } else {
                              setState(() {
                                addError(error: "Student Id Not Found");
                              });
                              print("Cannot find id in student database");
                              //TODO: Raise Error
                            }
                          } catch (e) {
                            setState(() {
                              addError(error: "Enter Valid Email Id");
                            });
                            print("Please enter valid email id");
                          }
                          loading = false;
                        },
                      )
                    : Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              colors: colors),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Center(
                          child: spinkit,
                        ),
                      )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
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
                Text("/",
                    style: TextStyle(
                        fontFamily: "Metrisch-Medium",
                        color: Colors.black54,
                        fontSize: 13)),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => FacultyLoginPage()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onHover: (x) {
                      if (x) {
                        setState(() {
                          Facultysignin = true;
                        });
                      } else {
                        setState(() {
                          Facultysignin = false;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: Facultysignin == true
                                  ? Colors.black54
                                  : Colors.white),
                        ),
                      ),
                      child: Text("Faculty Login",
                          style: TextStyle(
                              fontFamily: "Metrisch-Medium",
                              color: Colors.black54,
                              fontSize: 13)),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
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
