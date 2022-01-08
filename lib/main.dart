import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:bennettprojectgallery/HomePageElements/IconPalette.dart';
import 'package:bennettprojectgallery/HomePageElements/ProfileTile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'HomePageElements/CardExpandAnimation.dart';
import 'HomePageElements/Footer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parallax",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 90;
  double rateFivepointFive = 0;

  String asset;
  double top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            //only if scroll update notification is triggered
            setState(() {
              rateEight -= v.scrollDelta / 1;
              rateSeven -= v.scrollDelta / 1.5;
              rateSix -= v.scrollDelta / 2;
              rateFivepointFive -= v.scrollDelta / 2.25;
              rateFive -= v.scrollDelta / 2.5;
              rateFour -= v.scrollDelta / 3;
              rateThree -= v.scrollDelta / 3.5;
              rateTwo -= v.scrollDelta / 4;
              rateOne -= v.scrollDelta / 4.5;
              rateZero -= v.scrollDelta / 50;
            });
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            // Positioned(
            //   top: rateFour+470,
            //   left: 50,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TextButton(
            //
            //         onPressed: () {},
            //         style: TextButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.0),
            //           ),
            //           backgroundColor: Color(0xffa71932),
            //           primary: Colors.white,
            //           padding: EdgeInsets.all(0.0),
            //         ),
            //         child: Container(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 30, vertical: 8),
            //           child: Text(
            //             "Start Now",
            //             style: GoogleFonts.nunito(
            //                 fontSize: MediaQuery.of(context).size.height / 42, fontWeight: FontWeight.w800),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         style: TextButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //               side: BorderSide(color: Colors.black)),
            //           backgroundColor: Colors.transparent,
            //           primary: Colors.black87,
            //           padding: EdgeInsets.all(0.0),
            //         ),
            //         child: Container(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 30, vertical: 8),
            //           child: Text(
            //             "Start Now",
            //             style: GoogleFonts.nunito(
            //                 color: Colors.black,
            //                 fontSize: MediaQuery.of(context).size.height / 42,
            //                 fontWeight: FontWeight.w800),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ResponsiveBuilder(
              breakpoints: ScreenBreakpoints(
                  tablet: 550,
                  desktop: 750,
                  watch: 300
              ),
              builder: (context, sizingInformation) {
                // Check the sizing information here and return your UI
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  return Align(
                    // top: MediaQuery.of(context).size.height / 3.5 + rateFivepointFive,
                    // left: 50,
                    alignment: Alignment(-0.91,-0.4+rateZero/15),
                    // widthFactor: 0,
                    // heightFactor: 10,
                    child: Text("Project Gallery",
                        style: TextStyle(
                            fontFamily: "Metrisch-ExtraBold", fontSize: MediaQuery.of(context).size.width / 33+5)),
                  );
                }

                return Center();
              },
            ),
            ResponsiveBuilder(
              breakpoints: ScreenBreakpoints(
                  tablet: 550,
                  desktop: 750,
                  watch: 300
              ),
              builder: (context, sizingInformation) {
                // Check the sizing information here and return your UI
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  return Align(
                    alignment: Alignment(-0.91,-0.23+rateZero/15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 15,
                            fontFamily: "Metrisch-Medium"),
                        child: AnimatedTextKit(

                          repeatForever: true,
                          pause: Duration(milliseconds: 500),
                          animatedTexts: [
                            TypewriterAnimatedText('An intricate showcase of all the projects made by students of Bennett',speed: Duration(milliseconds: 100)),
                            TypewriterAnimatedText(' all the projects made by students of Bennett',speed: Duration(milliseconds: 100)),
                            TypewriterAnimatedText('An intricate showcase ofade by students of Bennett',speed: Duration(milliseconds: 100)),
                            TypewriterAnimatedText('An indshuabf made by students of Bennett',speed: Duration(milliseconds: 100)),
                          ],

                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  );
                }

                return Center();
              },
            ),
            ParallaxWidget(top: 20, asset: "parallax2"),
            ParallaxWidget(top: rateFive, asset: "parallax1"),
            ParallaxWidget(top: rateSeven, asset: "parallax3"),
            ParallaxWidget(top: rateOne, asset: "parallax5"),

            ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
                ResponsiveBuilder(
                  breakpoints: ScreenBreakpoints(
                      tablet: 550,
                      desktop: 750,
                      watch: 300
                  ),
                  builder: (context, sizingInformation) {
                    // Check the sizing information here and return your UI
                    if (sizingInformation.deviceScreenType !=
                        DeviceScreenType.desktop) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: Color(0xffffffff),
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 40),
                            child: Text("Project Gallery",
                                style: TextStyle(
                                    fontFamily: "Metrisch-ExtraBold", fontSize: 27)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            alignment: Alignment.center,
                            color: Color(0xffffffff),
                            width: double.infinity,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  height: 1.3,
                                  fontSize: 15,
                                  fontFamily: "Metrisch-Medium"),
                              child: AnimatedTextKit(

                                repeatForever: true,
                                pause: Duration(milliseconds: 500),
                                animatedTexts: [
                                  TypewriterAnimatedText('An intricate showcase of all the projects made by students of Bennett',textAlign: TextAlign.center,speed: Duration(milliseconds: 100)),
                                  TypewriterAnimatedText(' all the projects made by students of Bennett',textAlign: TextAlign.center,speed: Duration(milliseconds: 100)),
                                  TypewriterAnimatedText('An intricate showcase ofade by students of Bennett',textAlign: TextAlign.center,speed: Duration(milliseconds: 100)),
                                  TypewriterAnimatedText('An indshuabf made by students of Bennett',textAlign: TextAlign.center,speed: Duration(milliseconds: 100)),
                                ],

                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    }

                    return Center();
                  },
                ),

                Container(
                  color: Color(0xffffffff),
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text("How it works",
                          style: TextStyle(
                              fontFamily: "Metrisch-Bold", fontSize: 23)),
                      SizedBox(
                        height: 40,
                      ),
                      ResponsiveBuilder(
                        breakpoints: ScreenBreakpoints(
                            tablet: 550,
                            desktop: 805,
                            watch: 300
                        ),
                        builder: (context, sizingInformation) {
                          // Check the sizing information here and return your UI
                          if (sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconPalette(
                                    icon: Icons.pie_chart_rounded,
                                    title: "Projects Overview",
                                    text:
                                        "Watch and learn from the Projects made by Bennett Achievers",
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconPalette(
                                    icon: Icons.people_rounded,
                                    title: "Community",
                                    text:
                                        "Get to know your fellow Bennatians and learn from their Projects",
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconPalette(
                                    icon: Icons.person_rounded,
                                    title: "DashBoard",
                                    text:
                                        "Manage all your projects by tracking Activities in Dashboard",
                                  ),
                                ],
                              ),
                            );
                          }

                          if (sizingInformation.deviceScreenType ==
                              DeviceScreenType.tablet) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      IconPalette(
                                        icon: Icons.pie_chart_rounded,
                                        title: "Projects Overview",
                                        text:
                                        "Watch and learn from the Projects made by Bennett Achievers",
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      IconPalette(
                                        icon: Icons.people_rounded,
                                        title: "Community",
                                        text:
                                        "Get to know your fellow Bennatians and learn from their Projects",
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  IconPalette(
                                    icon: Icons.person_rounded,
                                    title: "DashBoard",
                                    text:
                                    "Manage all your projects by tracking Activities in Dashboard",
                                  ),
                                ],
                              )
                            );
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, bottom: 20),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: IconPalette(
                                      icon: Icons.pie_chart_rounded,
                                      title: "Projects Overview",
                                      text:
                                          "Watch and learn from the Projects made by Bennett Achievers",
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: IconPalette(
                                      // mobile: true,
                                      icon: Icons.people_rounded,
                                      title: "Community",
                                      text:
                                          "Get to know your fellow Bennatians and learn from their Projects",
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 20),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: IconPalette(
                                      icon: Icons.person_rounded,
                                      title: "DashBoard",
                                      text:
                                          "Manage all your projects by tracking Activities in Dashboard",
                                    )),
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                        primary: Colors.black87,
                        padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Text(
                          "Explore More",
                          style: GoogleFonts.nunito(
                              fontSize: 12, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    // Check the sizing information here and return your UI
                    if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop) {
                      return Container(
                        padding: EdgeInsets.only(top: 40),
                        height: MediaQuery.of(context).size.width / 2.7,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -250,
                              child: Container(
                                height: MediaQuery.of(context).size.width / 3.2,
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration: BoxDecoration(
                                  color: Colors.amber[400],
                                  borderRadius: BorderRadius.circular(400),
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.width / 65,
                              left: MediaQuery.of(context).size.width / 15,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width / 3.55,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ProfileTile(
                              top: MediaQuery.of(context).size.width / 35,
                              left: MediaQuery.of(context).size.width / 45,
                              title: "Students of Bennett University ",
                              subtitle: "Under Prof Aryan",
                              factor: MediaQuery.of(context).size.width / 1300,
                            ),
                            ProfileTile(
                              top: MediaQuery.of(context).size.width / 4,
                              left: MediaQuery.of(context).size.width / 2.1,
                              title: "Students of Bennett University ",
                              subtitle: "Under Prof Aryan",
                              factor: MediaQuery.of(context).size.width / 1300,
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.width / 10,
                              right: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Project Showcase",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University ",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                52,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet) {
                      return Container(
                        padding: EdgeInsets.only(top: 40),
                        height: MediaQuery.of(context).size.width / 2.4,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -250,
                              child: Container(
                                height: MediaQuery.of(context).size.width / 3.1,
                                width: MediaQuery.of(context).size.width / 1.3,
                                decoration: BoxDecoration(
                                  color: Colors.amber[400],
                                  borderRadius: BorderRadius.circular(400),
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.width / 50,
                              left: MediaQuery.of(context).size.width / 15,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width / 3.55,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ProfileTile(
                              top: MediaQuery.of(context).size.width / 35,
                              left: MediaQuery.of(context).size.width / 45,
                              title: "Students of Bennett University ",
                              subtitle: "Under Prof Aryan",
                              factor: MediaQuery.of(context).size.width / 1000,
                            ),
                            ProfileTile(
                              top: MediaQuery.of(context).size.width / 4,
                              left: MediaQuery.of(context).size.width / 2.2,
                              title: "Students of Bennett University ",
                              subtitle: "Under Prof Aryan",
                              factor: MediaQuery.of(context).size.width / 1000,
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.width / 10,
                              right: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Project Showcase",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University ",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                52,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Container(
                      padding: EdgeInsets.only(top: 40),
                      height: MediaQuery.of(context).size.width / 1.07,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 0,
                            left: -100,
                            child: Container(
                              height: MediaQuery.of(context).size.width / 2.3,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(400),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width / 30,
                            left: MediaQuery.of(context).size.width / 15,
                            child: Container(
                              height: MediaQuery.of(context).size.width / 2.7,
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ProfileTile(
                            top: MediaQuery.of(context).size.width / 20,
                            left: MediaQuery.of(context).size.width / 45,
                            title: "Students of Bennett University ",
                            subtitle: "Under Prof Aryan",
                            factor: MediaQuery.of(context).size.width / 700,
                          ),
                          ProfileTile(
                            top: MediaQuery.of(context).size.width / 3.15,
                            left: MediaQuery.of(context).size.width / 1.75,
                            title: "Students of Bennett University ",
                            subtitle: "Under Prof Aryan",
                            factor: MediaQuery.of(context).size.width / 700,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width / 1.85,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "Project Showcase",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                52,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  color: Color(0xffffffff),
                  width: double.infinity,
                  // padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text("\n\nBe in the Community",
                          style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height / 35,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Meet new people and get to learn from their Experience",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height / 52,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 50,
                      ),
                      ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                          // Check the sizing information here and return your UI
                          if (sizingInformation.deviceScreenType ==
                              DeviceScreenType.mobile) {
                            return CardExpandAnimation(
                              widdth: 1.2,
                              left: false,
                              imagelink:
                                  "https://www.bennett.edu.in/wp-content/uploads/2021/07/CSE-LAB-learning-technology.jpg",
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CardExpandAnimation(
                                widdth: 2.1,
                                left: true,
                                imagelink:
                                    "https://www.bennett.edu.in/wp-content/uploads/2021/07/CSE-LAB-learning-technology.jpg",
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CardExpandAnimation(
                                widdth: 2.1,
                                left: false,
                                imagelink:
                                    "https://www.bennett.edu.in/wp-content/uploads/2021/07/MCE-LAB-Sharp-and-Innovative-Brains.jpg",
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  color: Color(0xff004b93),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started Today",
                        style: GoogleFonts.josefinSans(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height / 35,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Project Showcase - For people who wants to learn from others",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height / 52,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              backgroundColor: Colors.white,
                              primary: Colors.black87,
                              padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Text(
                                "Start Now",
                                style: GoogleFonts.nunito(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 52,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: BorderSide(color: Colors.white)),
                              backgroundColor: Colors.transparent,
                              primary: Colors.black87,
                              padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              child: Text(
                                "Start Now",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 52,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Footer(),
                ),
                // Container(
                //   height: 30,
                //   color: Colors.white,
                // )
              ],
            ),

            Positioned(
                top: 0,
                child: Header(
                  current: "Home",
                )),
          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    @required this.top,
    @required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: 0,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
