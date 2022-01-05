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
          children: <Widget>[
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            ParallaxWidget(top: rateZero, asset: "parallax2"),
            ParallaxWidget(top: rateFive, asset: "parallax1"),
            ParallaxWidget(top: rateSeven, asset: "parallax3"),
            ParallaxWidget(top: rateOne, asset: "parallax5"),
            Positioned(
              top: 100,
              left: 50,
              child: Text("Project Gallery\nFor Bennett University",
                  style: GoogleFonts.nunito(
                      fontSize: MediaQuery.of(context).size.height / 25,
                      fontWeight: FontWeight.w700)),
            ),
            Positioned(
              top: 200,
              left: 50,
              child: Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\nmolestiae quas vel sint commodi repudiandae consequuntur\nvoluptatum laborum numquam blanditiis",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                      fontSize: MediaQuery.of(context).size.height / 45,
                      fontWeight: FontWeight.w400)),
            ),
            Positioned(
              top: 300,
              left: 50,
              child: Row(
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
                            fontSize: MediaQuery.of(context).size.height / 52, fontWeight: FontWeight.w800),
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
                            fontSize: MediaQuery.of(context).size.height / 52,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
                Container(
                  color: Color(0xffffffff),
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text("How it works",
                          style: GoogleFonts.nunito(
                              fontSize: MediaQuery.of(context).size.height / 35,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 40,
                      ),
                      ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                          // Check the sizing information here and return your UI
                          if (sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop) {
                            return Padding(
                              padding:  EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconPalette(
                                    icon: Icons.pie_chart_rounded,
                                    title: "Projects Overview",
                                    text:
                                        "Watch and learn from the Projects made by Bennett Achievers",
                                  ),
                                  SizedBox(width: 20,),
                                  IconPalette(
                                    icon: Icons.people_rounded,
                                    title: "Community",
                                    text:
                                        "Get to know your fellow Bennatians and learn from their Projects",
                                  ),
                                  SizedBox(width: 20,),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  SizedBox(
                                    width: 10,
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

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 25, right: 25,bottom: 20),
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
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25,top: 20),
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
                                    fontSize: MediaQuery.of(context).size.height / 52, fontWeight: FontWeight.w800),
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
                                    fontSize: MediaQuery.of(context).size.height / 52,
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
                Container(
                  height: 30,
                  color: Colors.white,
                )
              ],
            )
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
