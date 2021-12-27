import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parallax/HomePageElements/IconPalette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            // ParallaxWidget(top: rateFour, asset: "parallax4"),
            ParallaxWidget(top: rateOne, asset: "parallax5"),
            // ParallaxWidget(top: rateSix, asset: "parallax6"),
            // ParallaxWidget(top: rateSeven, asset: "parallax7"),
            // ParallaxWidget(top: rateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
                Container(
                  color: Color(0xffffffff),
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text("How it works",style: GoogleFonts.nunito(
                          fontSize: MediaQuery.of(context).size.height/35,
                          fontWeight: FontWeight.w700
                      )),
                      SizedBox(height: 40,),
                      ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                          // Check the sizing information here and return your UI
                          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconPalette(icon: Icons.pie_chart_rounded,title:"Projects Overview" ,text: "Watch and learn from the Projects made by Bennett Achievers",),
                                IconPalette(icon: Icons.people_rounded,title: "Community",text: "Get to know your fellow Bennatians and learn from their Projects",),
                                IconPalette(icon: Icons.person_rounded,title: "DashBoard",text: "Manage all your projects by tracking Activities in Dashboard",),
                              ],
                            );
                          }

                          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                            return Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconPalette(icon: Icons.pie_chart_rounded,title:"Projects Overview" ,text: "Watch and learn from the Projects made by Bennett Achievers",),
                                  SizedBox(width: 10,),
                                  IconPalette(icon: Icons.people_rounded,title: "Community",text: "Get to know your fellow Bennatians and learn from their Projects",),
                                  SizedBox(width: 10,),
                                  IconPalette(icon: Icons.person_rounded,title: "DashBoard",text: "Manage all your projects by tracking Activities in Dashboard",),
                                ],
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 25,right: 25),
                                child: Align(alignment: Alignment.centerLeft,child: IconPalette(icon: Icons.pie_chart_rounded,title:"Projects Overview" ,text: "Watch and learn from the Projects made by Bennett Achievers",)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 25),
                                child: Align(alignment: Alignment.centerRight,child: IconPalette(icon: Icons.people_rounded,title: "Community",text: "Get to know your fellow Bennatians and learn from their Projects",)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 25),
                                child: Align(alignment: Alignment.centerLeft,child: IconPalette(icon: Icons.person_rounded,title: "DashBoard",text: "Manage all your projects by tracking Activities in Dashboard",)),
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),

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

      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
