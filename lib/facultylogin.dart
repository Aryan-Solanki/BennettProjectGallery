import 'package:bennettprojectgallery/FacultyLoginElements/FacultyLoginCard.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FacultyLoginPage extends StatefulWidget {
  @override
  _FacultyLoginPageState createState() => _FacultyLoginPageState();
}

class _FacultyLoginPageState extends State<FacultyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        breakpoints: ScreenBreakpoints(tablet: 550, desktop: 800, watch: 300),
        builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Column(
              children: [
                Header(
                  current: "Sign In",
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Image(
                                  height: 100,
                                  image: AssetImage(
                                    "assets/logo1.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Welcome to the \nBennett University \nProject Archive",
                                    style: TextStyle(
                                        height: 1.3,
                                        fontFamily: "Metrisch-ExtraBold",
                                        fontSize: 30)),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 250,
                                  child: Text(
                                    "A central repository for all the projects undertaken by Bennett University students",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Medium",
                                        height: 1.5,
                                        fontSize: 15,
                                        color: Colors.black54),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 1),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  // child: Text("+91 7983 737272",
                                  //     style: TextStyle(
                                  //         fontFamily: "Metrisch-ExtraBold",
                                  //         fontSize: 23)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 1),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  // child: Text("+91 9827 475613",
                                  //     style: TextStyle(
                                  //         fontFamily: "Metrisch-ExtraBold",
                                  //         fontSize: 23)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(FontAwesomeIcons.twitter, size: 18),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(FontAwesomeIcons.linkedinIn,
                                        size: 18),
                                  ],
                                ),
                                SizedBox(
                                  height: 130,
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                    height: 500,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/loginpageimg.png"))),
                                FacultyLoginCard(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              Header(
                current: "Sign In",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Image(
                                height: 100,
                                image: AssetImage(
                                  "assets/logo1.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Bennett University \nProject Archive",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.3,
                                    fontFamily: "Metrisch-ExtraBold",
                                    fontSize: 30)),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                "A central repository for all the projects undertaken by Bennett University students",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Metrisch-Medium",
                                    height: 1.5,
                                    fontSize: 15,
                                    color: Colors.black54),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),

                            // SizedBox(height: 20,),
                            //
                            // SizedBox(height: 130,)
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.2,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/loginpageimg.png"))),
                            FacultyLoginCard(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
