import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bennettprojectgallery/HomePageElements/BlueBanner.dart';
import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/HomePageElements/NoAnimationZoomInImage.dart';
import 'package:bennettprojectgallery/featuredprojects.dart';
import 'package:countup/countup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:bennettprojectgallery/HomePageElements/IconPalette.dart';
import 'package:bennettprojectgallery/HomePageElements/ProfileTile.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'HomePageElements/ZoomInImage.dart';
import 'HomePageElements/Footer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAEIYggOFQByKpPDY6b-lhqo-Z7YRiJpQ0",
      appId: "1:162710403477:web:5905ae37bf1411843c1e9c",
      messagingSenderId: "162710403477",
      projectId: "bennettprojectarchive",
    ),
  );
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
      body: Column(
        children: [
          Header(
            current: "Home",
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                ParallaxWidget(top: rateZero, asset: "parallax0"),
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
                    Container(
                      color: Color(0xfff5f6fb),
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange.shade400,
                                ),
                                width: 10,
                                height: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange.shade400,
                                ),
                                width: 50,
                                height: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange.shade400,
                                ),
                                width: 10,
                                height: 2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("How it works",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold", fontSize: 25)),
                          Container(
                            width: 400,
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            child: Text(
                              "We enjoy adapting our strategies to offer every client the best solutions that are at the forefront of the industry.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Metrisch-Medium",
                                  height: 1.5,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          ),
                          ResponsiveBuilder(
                            breakpoints: ScreenBreakpoints(
                                tablet: 750, desktop: 1100, watch: 300),
                            builder: (context, sizingInformation) {
                              // Check the sizing information here and return your UI
                              if (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: IconPalette(),
                                );
                              }

                              if (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.tablet) {
                                return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
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
                                    ));
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
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25),
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
                    ResponsiveBuilder(
                      breakpoints: ScreenBreakpoints(
                          tablet: 800, desktop: 1050, watch: 580),
                      builder: (context, sizingInformation) {
                        // Check the sizing information here and return your UI
                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop) {
                          return Container(
                            padding: EdgeInsets.only(top: 40),
                            height: 500,
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: -250,
                                        child: Container(
                                          height: 343.75,
                                          width: 730,
                                          decoration: BoxDecoration(
                                            color: Colors.amber[400],
                                            borderRadius:
                                                BorderRadius.circular(400),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 16,
                                        left: 73,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          elevation: 5,
                                          child: Container(
                                            height: 309,
                                            width: 550,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: Image.network(
                                              "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ProfileTile(
                                        top: 31,
                                        left: 24.5,
                                        title:
                                            "Students of Bennett University ",
                                        subtitle: "Under Prof Aryan",
                                        factor:
                                            MediaQuery.of(context).size.width /
                                                1300,
                                      ),
                                      ProfileTile(
                                        top: 275,
                                        left: 550,
                                        title:
                                            "Students of Bennett University ",
                                        subtitle: "Under Prof Aryan",
                                        factor:
                                            MediaQuery.of(context).size.width /
                                                1300,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  padding: EdgeInsets.only(right: 50),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 10,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 50,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 10,
                                            height: 2,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Project Accomplished by Student of Bennett University",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            height: 1.3,
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Text(
                                          "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University ",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.5,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Countup(
                                                    softWrap: true,
                                                    begin: 0,
                                                    end: 270,
                                                    duration:
                                                        Duration(seconds: 7),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff101770),
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 45),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 25),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "PROJECTS MADE",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.3,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 30),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Countup(
                                                    softWrap: true,
                                                    begin: 0,
                                                    end: 90,
                                                    duration:
                                                        Duration(seconds: 7),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff101770),
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 45),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 25),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "ACHIEVEMENTS",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.3,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GradientButton(),
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
                            height: 970,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: -250,
                                        child: Container(
                                          height: 543.75,
                                          width: 930,
                                          decoration: BoxDecoration(
                                            color: Colors.amber[400],
                                            borderRadius:
                                                BorderRadius.circular(400),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 16,
                                        left: 100,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          elevation: 5,
                                          child: Container(
                                            height: 509,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: Image.network(
                                              "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ProfileTile(
                                        top: 31,
                                        left: 24.5,
                                        title:
                                            "Students of Bennett University ",
                                        subtitle: "Under Prof Aryan",
                                        factor: 1,
                                      ),
                                      ProfileTile(
                                        top: 475,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        title:
                                            "Students of Bennett University ",
                                        subtitle: "Under Prof Aryan",
                                        factor: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 10,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 50,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 10,
                                            height: 2,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Project Accomplished by Student of Bennett University",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.3,
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Text(
                                          "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.5,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Countup(
                                                    softWrap: true,
                                                    begin: 0,
                                                    end: 270,
                                                    duration:
                                                        Duration(seconds: 7),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff101770),
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 45),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 25),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "PROJECTS MADE",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.3,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 30),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Countup(
                                                    softWrap: true,
                                                    begin: 0,
                                                    end: 90,
                                                    duration:
                                                        Duration(seconds: 7),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff101770),
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 45),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 25),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "ACHIEVEMENTS",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.3,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GradientButton(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.watch) {
                          return Container(
                            padding: EdgeInsets.only(top: 40),
                            height: 770,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: -350,
                                        child: Container(
                                          height: 300.75,
                                          width: 630,
                                          decoration: BoxDecoration(
                                            color: Colors.amber[400],
                                            borderRadius:
                                                BorderRadius.circular(400),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 16,
                                        left: 50,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          elevation: 5,
                                          child: Container(
                                            height: 260,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: Image.network(
                                              "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ProfileTile(
                                        top: 31,
                                        left: 24.5,
                                        title:
                                            "Students of Bennett University ",
                                        subtitle: "Under Prof Aryan",
                                        factor: 1,
                                      ),
                                      ProfileTile(
                                        top: 230,
                                        left:
                                            MediaQuery.of(context).size.width -
                                                200,
                                        title:
                                            "Students of Bennett University ",
                                        subtitle: "Under Prof Aryan",
                                        factor: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 10,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 50,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.orange.shade400,
                                            ),
                                            width: 10,
                                            height: 2,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Project Accomplished by Student of Bennett University",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.3,
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Text(
                                          "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.5,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "270",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff101770),
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 45),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 25),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "PROJECTS MADE",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.3,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 30),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "90",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff101770),
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 45),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        height: 1.3,
                                                        fontFamily:
                                                            "Metrisch-Bold",
                                                        fontSize: 25),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "ACHIEVEMENTS",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.3,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GradientButton(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return Container(
                          padding: EdgeInsets.only(top: 40),
                          height: 770,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: -250,
                                      child: Container(
                                        height: 343.75,
                                        width: 730,
                                        decoration: BoxDecoration(
                                          color: Colors.amber[400],
                                          borderRadius:
                                              BorderRadius.circular(400),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      left: 100,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 5,
                                        child: Container(
                                          height: 309,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.network(
                                            "https://www.bennett.edu.in/wp-content/uploads/2021/07/attrium-Where-students-sit-relax-and-discuss.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ProfileTile(
                                      top: 31,
                                      left: 24.5,
                                      title: "Students of Bennett University ",
                                      subtitle: "Under Prof Aryan",
                                      factor: 1,
                                    ),
                                    ProfileTile(
                                      top: 275,
                                      left: MediaQuery.of(context).size.width /
                                          1.55,
                                      title: "Students of Bennett University ",
                                      subtitle: "Under Prof Aryan",
                                      factor: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 500,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.orange.shade400,
                                          ),
                                          width: 10,
                                          height: 2,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.orange.shade400,
                                          ),
                                          width: 50,
                                          height: 2,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.orange.shade400,
                                          ),
                                          width: 10,
                                          height: 2,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Project Accomplished by Student of Bennett University",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.3,
                                          fontFamily: "Metrisch-Bold",
                                          fontSize: 25),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: Text(
                                        "Visit all the Projects and Workdone by Students of Bennett University.Visit all the Projects and Workdone by Students of Bennett University ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            height: 1.5,
                                            fontSize: 15,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Countup(
                                                  softWrap: true,
                                                  begin: 0,
                                                  end: 270,
                                                  duration:
                                                      Duration(seconds: 7),
                                                  style: TextStyle(
                                                      color: Color(0xff101770),
                                                      height: 1.3,
                                                      fontFamily:
                                                          "Metrisch-Bold",
                                                      fontSize: 45),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      height: 1.3,
                                                      fontFamily:
                                                          "Metrisch-Bold",
                                                      fontSize: 25),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "PROJECTS MADE",
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.3,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Countup(
                                                  softWrap: true,
                                                  begin: 0,
                                                  end: 90,
                                                  duration:
                                                      Duration(seconds: 7),
                                                  style: TextStyle(
                                                      color: Color(0xff101770),
                                                      height: 1.3,
                                                      fontFamily:
                                                          "Metrisch-Bold",
                                                      fontSize: 45),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      height: 1.3,
                                                      fontFamily:
                                                          "Metrisch-Bold",
                                                      fontSize: 25),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "ACHIEVEMENTS",
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.3,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GradientButton(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 40, top: 50),
                      color: Color(0xffffffff),
                      width: double.infinity,
                      // padding: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange.shade400,
                                ),
                                width: 10,
                                height: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange.shade400,
                                ),
                                width: 50,
                                height: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange.shade400,
                                ),
                                width: 10,
                                height: 2,
                              )
                            ],
                          ),
                          Text("\nBe in the Community",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold", fontSize: 25)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Meet new people and get to learn from their Experience",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Metrisch-Medium",
                                  height: 1.3,
                                  fontSize: 15,
                                  color: Colors.black54)),
                          SizedBox(
                            height: 50,
                          ),
                          MediaQuery.of(context).size.width > 580
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 300,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ZoomInImage(
                                          ImageLink:
                                              "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1",
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        ZoomInImage(
                                            ImageLink:
                                                "https://th.bing.com/th/id/OIP.E8MxC5RjDDEdkAbNWZXKjAAAAA?pid=ImgDet&w=367&h=550&rs=1"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        ZoomInImage(
                                            ImageLink:
                                                "https://th.bing.com/th/id/OIP.zCCnWcLaZFZMuiCps0LWBQHaHd?pid=ImgDet&w=848&h=854&rs=1"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        ZoomInImage(
                                            ImageLink:
                                                "https://th.bing.com/th/id/OIP.DMOUWpymUM_KKCO1jEaaMgHaGK?pid=ImgDet&rs=1")
                                      ],
                                    ),
                                  ),
                                )
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 300,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        NoAnimationZoomInImage(
                                          ImageLink:
                                              "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1",
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        NoAnimationZoomInImage(
                                            ImageLink:
                                                "https://th.bing.com/th/id/OIP.E8MxC5RjDDEdkAbNWZXKjAAAAA?pid=ImgDet&w=367&h=550&rs=1"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        NoAnimationZoomInImage(
                                            ImageLink:
                                                "https://th.bing.com/th/id/OIP.zCCnWcLaZFZMuiCps0LWBQHaHd?pid=ImgDet&w=848&h=854&rs=1"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        NoAnimationZoomInImage(
                                            ImageLink:
                                                "https://th.bing.com/th/id/OIP.DMOUWpymUM_KKCO1jEaaMgHaGK?pid=ImgDet&rs=1")
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    BlueBanner(),
                    FeaturedProjects(),
                    Footer(),
                    // Positioned(
                    //   bottom: 0.0,
                    //   child: Footer(),
                    // ),
                    // Container(
                    //   height: 30,
                    //   color: Colors.white,
                    // )
                  ],
                ),
              ],
            ),
          ),
        ],
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
        height: MediaQuery.of(context).size.height - 60,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/$asset.webp", fit: BoxFit.cover),
      ),
    );
  }
}
