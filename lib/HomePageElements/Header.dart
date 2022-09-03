import 'package:bennettprojectgallery/AdminDashBoard.dart';
import 'package:bennettprojectgallery/DashBoard.dart';
import 'package:bennettprojectgallery/login.dart';
import 'package:bennettprojectgallery/main.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/projectgallery.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:bennettprojectgallery/services/user_simple_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatefulWidget {
  final String current;
  const Header({
    this.current,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

String hover = "";
bool mobilemenu = false;
final auth = FirebaseAuth.instance;

class _HeaderState extends State<Header> {
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  String batch = "";
  String course = "";
  String email1 = "";
  String image = "";
  String name = "";
  String school = "";
  String yog = "";
  String result = "";
  List<dynamic> projectList = [];
  bool islogin = false;
  String userType;

  void getinfo() async {
    userType = UserSimplePreferences.getUserType();
    islogin = auth.currentUser != null;
    String email = auth.currentUser.email;
    result = email.substring(0, email.indexOf('@')).toUpperCase();
    UserServices _services = new UserServices();
    var doc = await _services.getUserById(result);
    batch = doc["batch"];
    course = doc["course"];
    email1 = doc["email"];
    image = doc["image"];
    name = doc["name"];
    school = doc["school"];
    yog = doc["yog"].toString();
    projectList = doc["projects"];
  }

  List<dynamic> categoriesname = [];

  Future<void> getAllCategories() async {
    ProjectServices _services = ProjectServices();
    DocumentSnapshot cat = await _services.mainscreen.get();
    categoriesname = await cat["categoryList"];
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        islogin = false;
        UserSimplePreferences.setUserType("");
      } else {
        islogin = true;
      }
    });
    getinfo();
    getAllCategories();
    super.initState();
  }

  void logoutandlogin() async {
    await FirebaseAuth.instance.signOut();
    await UserSimplePreferences.setUserType(""); //clearing user type
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff101770),
      borderOnForeground: true,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: ResponsiveBuilder(
        breakpoints: ScreenBreakpoints(tablet: 550, desktop: 800, watch: 300),
        builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: MediaQuery.of(context).size.width,
              color: Color(0xff101770),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  isReoaded: false,
                                )));
                      },
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover = "Home";
                          });
                        } else {
                          setState(() {
                            hover = "";
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Metrisch-Bold"),
                              )),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange.shade400,
                            ),
                            duration: Duration(milliseconds: 200),
                            width: widget.current == "Home"
                                ? 25
                                : hover == "Home"
                                    ? 25
                                    : 0,
                            height: 2,
                          )
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProjectGallery(
                                categoriesname: categoriesname)));
                      },
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover = "Project Gallery";
                          });
                        } else {
                          setState(() {
                            hover = "";
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Project Gallery",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Metrisch-Bold"),
                              )),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange.shade400,
                            ),
                            duration: Duration(milliseconds: 200),
                            width: widget.current == "Project Gallery"
                                ? 25
                                : hover == "Project Gallery"
                                    ? 25
                                    : 0,
                            height: 2,
                          )
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        _launchURL("http://www.timesofbennett.com/");
                      },
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover = "Times of Bennett";
                          });
                        } else {
                          setState(() {
                            hover = "";
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Times of Bennett",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Metrisch-Bold"),
                              )),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange.shade400,
                            ),
                            duration: Duration(milliseconds: 200),
                            width: widget.current == "Times of Bennett"
                                ? 25
                                : hover == "Times of Bennett"
                                    ? 25
                                    : 0,
                            height: 2,
                          )
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () async {
                        List<Project> projectListFinal = [];
                        UserServices _services = new UserServices();

                        if (userType == "student") {
                          for (var projectID in projectList) {
                            var project = await FirebaseFirestore.instance
                                .collection("project")
                                .doc(projectID)
                                .get();
                            bool x = project.exists;
                            if (!x) {
                              projectList.remove(projectID);
                              continue;
                            }

                            _services.updateUserData(
                                result, {"projects": projectList});

                            projectListFinal.add(
                              new Project(
                                id: project.id,
                                yog: project["StudentIdList"][0]["yog"],
                                like_count: project["LikeCount"],
                                DatasetLink: project["ProjectDetails"]
                                    ["DatasetLink"],
                                ShortDescription: project["ProjectDetails"]
                                    ["ShortDescription"],
                                LongDescription: project["ProjectDetails"]
                                    ["LongDescription"],
                                KeyFeature1: project["ProjectDetails"]
                                    ["KeyFeature1"],
                                KeyFeature2: project["ProjectDetails"]
                                    ["KeyFeature2"],
                                KeyFeature3: project["ProjectDetails"]
                                    ["KeyFeature3"],
                                ProjectLink: project["ProjectDetails"]
                                    ["ProjectLink"],
                                ReportLink: project["ProjectDetails"]
                                    ["ReportLink"],
                                VideoLink: project["ProjectDetails"]
                                    ["VideoLink"],
                                Reviews: project["Reviews"],
                                StudentList: project["StudentIdList"],
                                images: project["images"],
                                title: project["title"],
                                timestamp: project["datetime"],
                                viewCount: project["viewCount"],
                                Categories: project["ProjectDetails"]
                                    ["Categories"],
                                ProfessorDetails: project["ProfessorDetails"],
                              ),
                            );
                          }

                          projectListFinal.sort(
                              (a, b) => b.timestamp.compareTo(a.timestamp));
                        }

                        !islogin
                            ? Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()))
                            : userType == "student"
                                ? Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => DashBoard(
                                              id: result,
                                              batch: batch,
                                              course: course,
                                              email: email1,
                                              image: image,
                                              name: name,
                                              school: school,
                                              yog: yog,
                                              projectList: projectListFinal,
                                            )))
                                : Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AdminDashBoard()));
                      },
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover = "Dashboard";
                          });
                        } else {
                          setState(() {
                            hover = "";
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Metrisch-Bold"),
                              )),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange.shade400,
                            ),
                            duration: Duration(milliseconds: 200),
                            width: widget.current == "Dashboard"
                                ? 25
                                : hover == "Dashboard"
                                    ? 25
                                    : 0,
                            height: 2,
                          )
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () async {
                        islogin == false
                            ? Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()))
                            : logoutandlogin();
                      },
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover = islogin == false ? "Sign In" : "Sign Out";
                          });
                        } else {
                          setState(() {
                            hover = "";
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                islogin == false ? "Sign In" : "Sign Out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Metrisch-Bold"),
                              )),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange.shade400,
                            ),
                            duration: Duration(milliseconds: 200),
                            width: widget.current == "Sign In"
                                ? 25
                                : hover == "Sign In" || hover == "Sign Out"
                                    ? 25
                                    : 0,
                            height: 2,
                          )
                        ],
                      )),
                ],
              ),
            );
          }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: MediaQuery.of(context).size.width,
            color: Color(0xff101770),
            // height: 50,
            child: Column(
              children: [
                mobilemenu == true
                    ? AnimatedContainer(
                        alignment: Alignment.center,
                        height: 345,
                        duration: Duration(milliseconds: 600),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 13),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 27,
                                  ),
                                  FaIcon(FontAwesomeIcons.twitter,
                                      size: 18, color: Colors.white),
                                  SizedBox(
                                    width: 27,
                                  ),
                                  FaIcon(FontAwesomeIcons.linkedinIn,
                                      size: 18, color: Colors.white),
                                ],
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                color: Colors.white60,
                                height: 1,
                                width: 300,
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Home";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Home",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width: widget.current == "Home"
                                            ? 25
                                            : hover == "Home"
                                                ? 25
                                                : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProjectGallery(
                                                  categoriesname:
                                                      categoriesname,
                                                )));
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Project Gallery";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Project Gallery",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width:
                                            widget.current == "Project Gallery"
                                                ? 25
                                                : hover == "Project Gallery"
                                                    ? 25
                                                    : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Times of Bennett";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Times of Bennett",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width:
                                            widget.current == "Times of Bennett"
                                                ? 25
                                                : hover == "Times of Bennett"
                                                    ? 25
                                                    : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    name == ""
                                        ? Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()))
                                        : Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminDashBoard()));
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Dashboard";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Dashboard",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width: widget.current == "Dashboard"
                                            ? 25
                                            : hover == "Dashboard"
                                                ? 25
                                                : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    islogin == false
                                        ? Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()))
                                        : logoutandlogin();
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Sign In";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width: widget.current == "Sign In"
                                            ? 25
                                            : hover == "Sign In"
                                                ? 25
                                                : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )
                    : AnimatedContainer(
                        alignment: Alignment.bottomCenter,
                        height: 0,
                        duration: Duration(milliseconds: 600),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 13),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 27,
                                  ),
                                  FaIcon(FontAwesomeIcons.twitter,
                                      size: 18, color: Colors.white),
                                  SizedBox(
                                    width: 27,
                                  ),
                                  FaIcon(FontAwesomeIcons.linkedinIn,
                                      size: 18, color: Colors.white),
                                ],
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                color: Colors.white60,
                                height: 1,
                                width: 300,
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Home";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Home",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width: widget.current == "Home"
                                            ? 25
                                            : hover == "Home"
                                                ? 25
                                                : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProjectGallery(
                                                  categoriesname:
                                                      categoriesname,
                                                )));
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Project Gallery";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Project Gallery",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width:
                                            widget.current == "Project Gallery"
                                                ? 25
                                                : hover == "Project Gallery"
                                                    ? 25
                                                    : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    print("Button Pressed");
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Times of Bennett";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Times of Bennett",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width:
                                            widget.current == "Times of Bennett"
                                                ? 25
                                                : hover == "Times of Bennett"
                                                    ? 25
                                                    : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    name == ""
                                        ? Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()))
                                        : Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminDashBoard()));
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Dashboard";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Dashboard",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width: widget.current == "Dashboard"
                                            ? 25
                                            : hover == "Dashboard"
                                                ? 25
                                                : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {
                                    islogin == false
                                        ? Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()))
                                        : logoutandlogin();
                                  },
                                  onHover: (x) {
                                    if (x) {
                                      setState(() {
                                        hover = "Sign In";
                                      });
                                    } else {
                                      setState(() {
                                        hover = "";
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Color(0xff101770),
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Metrisch-Bold"),
                                          )),
                                      AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.orange.shade400,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        width: widget.current == "Sign In"
                                            ? 25
                                            : hover == "Sign In"
                                                ? 25
                                                : 0,
                                        height: 2,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                AnimatedContainer(
                  height: 50,
                  duration: Duration(seconds: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (mobilemenu == true) {
                              setState(() {
                                mobilemenu = false;
                              });
                            } else {
                              setState(() {
                                mobilemenu = true;
                              });
                            }
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
