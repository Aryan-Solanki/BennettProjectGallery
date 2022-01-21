import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectCard extends StatefulWidget {
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

bool hover1 = false;
bool hover2 = false;
bool hover3 = false;
bool hover4 = false;
bool hover5 = false;
bool hover6 = false;
bool hover7 = false;
bool hover8 = false;
bool hover9 = false;

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: ScreenBreakpoints(tablet: 700, desktop: 1140, watch: 541),
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = true;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover1 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover1) ? 20 : 0.0,
                                  top: (hover1) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover1 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = true;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover2 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover2) ? 20 : 0.0,
                                  top: (hover2) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover2 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = true;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover3 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover3) ? 20 : 0.0,
                                  top: (hover3) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover3 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = true;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover4 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover4) ? 20 : 0.0,
                                  top: (hover4) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover4 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = true;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover5 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover5) ? 20 : 0.0,
                                  top: (hover5) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover5 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = true;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover6 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover6) ? 20 : 0.0,
                                  top: (hover6) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover6 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = true;
                            hover8 = false;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover7 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover7) ? 20 : 0.0,
                                  top: (hover7) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover7 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = true;
                            hover9 = false;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover8 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover8) ? 20 : 0.0,
                                  top: (hover8) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover8 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 380,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        primary: Colors.white,
                        padding: EdgeInsets.all(0.0),
                      ),
                      onPressed: () {},
                      onHover: (x) {
                        if (x) {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = true;
                          });
                        } else {
                          setState(() {
                            hover1 = false;
                            hover2 = false;
                            hover3 = false;
                            hover4 = false;
                            hover5 = false;
                            hover6 = false;
                            hover7 = false;
                            hover8 = false;
                            hover9 = false;
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            shadowColor: Colors.black,
                            elevation: hover9 == true ? 8 : 1,
                            child: Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 180,
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Computer Vision using Machine Learning and DeepLearning",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Bold",
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RatingBarIndicator(
                                      rating: 3.5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        "Aryan Singh Solanki",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Metrisch-Medium",
                                            fontSize: 13,
                                            color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(
                                  bottom: (hover9) ? 20 : 0.0,
                                  top: (hover9) ? 0 : 20),
                              duration: Duration(milliseconds: 500),
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: hover9 ? 1.0 : 0.0,
                                child: GradientButton(
                                  title: "Open Project",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      width: 220,
                      height: 340,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          primary: Colors.white,
                          padding: EdgeInsets.all(0.0),
                        ),
                        onPressed: () {},
                        onHover: (x) {
                          if (x) {
                            setState(() {
                              hover1 = true;
                              hover2 = false;
                              hover3 = false;
                              hover4 = false;
                              hover5 = false;
                              hover6 = false;
                              hover7 = false;
                              hover8 = false;
                              hover9 = false;
                            });
                          } else {
                            setState(() {
                              hover1 = false;
                              hover2 = false;
                              hover3 = false;
                              hover4 = false;
                              hover5 = false;
                              hover6 = false;
                              hover7 = false;
                              hover8 = false;
                              hover9 = false;
                            });
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Card(
                              shadowColor: Colors.black,
                              elevation: hover1 == true ? 8 : 1,
                              child: Center(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 160,
                                          width: 140,
                                          child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 140,
                                        child: Text(
                                          "Computer Vision using Machine Learning and DeepLearning",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Bold",
                                              fontSize: 15,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RatingBarIndicator(
                                        rating: 3.5,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Text(
                                          "Aryan Singh Solanki",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              fontSize: 13,
                                              color: Colors.green),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              child: GradientButton(
                                buttonheight: 45,
                                buttonwidth: 170,
                                title: "Open Project",
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = true;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover2 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = true;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover3 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),

                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = true;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover4 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = true;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover5 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = true;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover6 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),

                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = true;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover7 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = true;
                                  hover9 = false;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover8 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          width: 220,
                          height: 340,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: Colors.white,
                              padding: EdgeInsets.all(0.0),
                            ),
                            onPressed: () {},
                            onHover: (x) {
                              if (x) {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = true;
                                });
                              } else {
                                setState(() {
                                  hover1 = false;
                                  hover2 = false;
                                  hover3 = false;
                                  hover4 = false;
                                  hover5 = false;
                                  hover6 = false;
                                  hover7 = false;
                                  hover8 = false;
                                  hover9 = false;
                                });
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  shadowColor: Colors.black,
                                  elevation: hover9 == true ? 8 : 1,
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 160,
                                              width: 140,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Computer Vision using Machine Learning and DeepLearning",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Bold",
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "Aryan Singh Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 13,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -20,
                                  child: GradientButton(
                                    buttonheight: 45,
                                    buttonwidth: 170,
                                    title: "Open Project",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ],
              ),
            ],
          );
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = true;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover1 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = true;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover2 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = true;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover3 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = true;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover4 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = true;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover5 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = true;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover6 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = true;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover7 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = true;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover8 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 40,
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = true;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover9 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = true;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover1 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = true;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover2 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),

              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = true;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover3 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = true;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover4 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),

              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = true;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover5 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = true;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover6 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),

              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = true;
                                hover8 = false;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover7 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = true;
                                hover9 = false;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover8 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState){
                      return Container(
                        width: 220,
                        height: 340,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {},
                          onHover: (x) {
                            if (x) {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = true;
                              });
                            } else {
                              setState(() {
                                hover1 = false;
                                hover2 = false;
                                hover3 = false;
                                hover4 = false;
                                hover5 = false;
                                hover6 = false;
                                hover7 = false;
                                hover8 = false;
                                hover9 = false;
                              });
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Card(
                                shadowColor: Colors.black,
                                elevation: hover9 == true ? 8 : 1,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 160,
                                            width: 140,
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://d2slcw3kip6qmk.cloudfront.net/marketing/blog/2019Q1/why-pm-is-important/why-is-project-management-important-header@2x.png"))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Computer Vision using Machine Learning and DeepLearning",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 15,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "Aryan Singh Solanki",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: GradientButton(
                                  buttonheight: 45,
                                  buttonwidth: 170,
                                  title: "Open Project",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
