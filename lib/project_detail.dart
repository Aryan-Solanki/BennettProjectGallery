import 'package:bennettprojectgallery/HomePageElements/Footer.dart';
import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectDetailsElements/ProjectDetailsReview.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/models/Review.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:bennettprojectgallery/services/user_simple_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ProjectDetail extends StatefulWidget {
  final Project project;
  final String cat;
  const ProjectDetail({Key key, this.project, this.cat}) : super(key: key);
  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  String selected = "image1";
  bool isdescription = true;
  bool islogin = true;

  double rating_global = 0.0;
  String reviewText = "";

  bool isloading = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        islogin = false;
      } else {
        islogin = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String mb = "Made By : \n";
    for (int i = 0; i < widget.project.StudentList.length; i++) {
      mb += widget.project.StudentList[i]["name"];
      mb += " ";
      mb += widget.project.StudentList[i]["batch"];
      mb += " ";
      mb += widget.project.StudentList[i]["id"];
      mb += " \n";
    }

    // create objects of Review class from projects

    List<Review> ReviewList = [];

    for (int i = 0; i < widget.project.Reviews.length; i++) {
      ReviewList.add(new Review(
          reviewText: widget.project.Reviews[i]["reviewText"],
          name: widget.project.Reviews[i]["name"],
          date: widget.project.Reviews[i]["date"],
          rating: widget.project.Reviews[i]["rating"]));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: SingleChildScrollView(
                child: MediaQuery.of(context).size.width > 890
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: 1050,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(50),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12)),
                                            height: 550,
                                            width: 400,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: selected == "image1"
                                                      ? NetworkImage(widget
                                                          .project.images[0])
                                                      : selected == "image2"
                                                          ? NetworkImage(widget
                                                              .project
                                                              .images[1])
                                                          : NetworkImage(widget
                                                              .project
                                                              .images[2])),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = "image1";
                                                });
                                              },
                                              child: Card(
                                                elevation: selected == "image1"
                                                    ? 8
                                                    : 0,
                                                child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    height: 110,
                                                    width: 90,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Image(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                widget.project
                                                                        .images[
                                                                    0])))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            widget.project.images.length == 2
                                                ? TextButton(
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      primary: Colors.white,
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selected = "image2";
                                                      });
                                                    },
                                                    child: Card(
                                                      elevation:
                                                          selected == "image2"
                                                              ? 8
                                                              : 0,
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15),
                                                          height: 110,
                                                          width: 90,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Image(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(widget
                                                                          .project
                                                                          .images[
                                                                      1])))),
                                                    ),
                                                  )
                                                : Center(),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            widget.project.images.length == 3
                                                ? TextButton(
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      primary: Colors.white,
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selected = "image3";
                                                      });
                                                    },
                                                    child: Card(
                                                      elevation:
                                                          selected == "image3"
                                                              ? 8
                                                              : 0,
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15),
                                                          height: 110,
                                                          width: 90,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Image(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(widget
                                                                          .project
                                                                          .images[
                                                                      2])))),
                                                    ),
                                                  )
                                                : Center(),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              1050
                                          ? 550
                                          : 400,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.project.title,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                height: 1.3,
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              RatingBarIndicator(
                                                rating: 0,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                direction: Axis.horizontal,
                                              ),
                                              Container(
                                                width: 180,
                                                child: Text(
                                                  "(${widget.project.Reviews.length} Reviews)",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      fontSize: 13,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            child: Text(
                                              mb,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 10,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 15,
                                                  height: 1.5,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              widget.project.ShortDescription,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.blue,
                                                  size: 15,
                                                )),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1050
                                                    ? null
                                                    : 370,
                                                child: Text(
                                                  widget.project.KeyFeature1,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.blue,
                                                  size: 15,
                                                )),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1050
                                                    ? null
                                                    : 370,
                                                child: Text(
                                                  widget.project.KeyFeature2,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.blue,
                                                  size: 15,
                                                )),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1050
                                                    ? null
                                                    : 370,
                                                child: Text(
                                                  widget.project.KeyFeature3,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          // Container(
                                          //   width: double.maxFinite,
                                          //   height: 1,
                                          //   color: Colors.black12,
                                          // ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 36),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Categories : ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: widget.cat,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 36),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Batch: ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: widget.project.yog,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        primary: Colors.white,
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isdescription = true;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: 50,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          gradient: LinearGradient(
                                              begin: const FractionalOffset(
                                                  0.0, 0.0),
                                              end: const FractionalOffset(
                                                  1.0, 0.0),
                                              colors: isdescription == true
                                                  ? [
                                                      Colors.blue.shade400,
                                                      Colors.purple.shade800
                                                    ]
                                                  : [
                                                      Color(0xfff3f5fe),
                                                      Color(0xfff3f5fe)
                                                    ]),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: Center(
                                          child: Text(
                                            "DESCRIPTION",
                                            style: TextStyle(
                                                color: isdescription == true
                                                    ? Colors.white
                                                    : Colors.black,
                                                height: 1.3,
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        primary: Colors.white,
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isdescription = false;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: 50,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          gradient: LinearGradient(
                                              begin: const FractionalOffset(
                                                  0.0, 0.0),
                                              end: const FractionalOffset(
                                                  1.0, 0.0),
                                              colors: isdescription == true
                                                  ? [
                                                      Color(0xfff3f5fe),
                                                      Color(0xfff3f5fe)
                                                    ]
                                                  : [
                                                      Colors.blue.shade400,
                                                      Colors.purple.shade800
                                                    ]),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: Center(
                                          child: Text(
                                            "REVIEWS (${widget.project.Reviews.length})",
                                            style: TextStyle(
                                                color: isdescription == true
                                                    ? Colors.black
                                                    : Colors.white,
                                                height: 1.3,
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                if (isdescription == true)
                                  Container(
                                    child: Text(
                                      widget.project.LongDescription,
                                      style: TextStyle(
                                          fontFamily: "Metrisch-Medium",
                                          height: 1.5,
                                          fontSize: 15,
                                          color: Colors.black54),
                                    ),
                                  )
                                else
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    380
                                                ? widget.project.Reviews.length
                                                        .toDouble() *
                                                    130
                                                : widget.project.Reviews.length
                                                        .toDouble() *
                                                    150,
                                        child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return ProjectDetailsReview(
                                                re: ReviewList[index]);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      islogin
                                          ? isloading
                                              ? Center(
                                                  child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    child: Lottie.asset(
                                                        'assets/loading.json',
                                                        frameRate:
                                                            FrameRate.max),
                                                  ),
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Add a review",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          height: 1.3,
                                                          fontFamily:
                                                              "Metrisch-Bold",
                                                          fontSize: 25),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Your email address will not be published. Required fields are marked *",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Your rating",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    RatingBar.builder(
                                                      initialRating: 0,
                                                      minRating: 1,
                                                      itemSize: 20,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4.0),
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                        Icons.star_rounded,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        rating_global = rating;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0)),
                                                          color: Color(
                                                              0xfff3f5fe)),
                                                      child: TextField(
                                                        maxLines: 5,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                        onChanged: (value) {
                                                          reviewText = value;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintStyle: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                          hintText:
                                                              'Your review',
                                                          // contentPadding:
                                                          // EdgeInsets.symmetric(horizontal: 20.0),
                                                          // border: OutlineInputBorder(
                                                          //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                          // ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    GradientButton(
                                                      title: "SUBMIT",
                                                      buttonheight: 45,
                                                      buttonwidth: 130,
                                                      onPressed: () async {
                                                        String dateTime =
                                                            DateTime.now()
                                                                .toString();

                                                        String email =
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser
                                                                .email;

                                                        if (rating_global ==
                                                            0) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Please give rating",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        } else if (reviewText ==
                                                            "") {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Please give review",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        } else {
                                                          setState(() {
                                                            isloading = true;
                                                          });
                                                          String name = "";
                                                          String userType =
                                                              UserSimplePreferences
                                                                  .getUserType();
                                                          if (userType ==
                                                              "student") {
                                                            String id = email
                                                                .substring(
                                                                    0,
                                                                    email.indexOf(
                                                                        "@"))
                                                                .toUpperCase();
                                                            // get user name based on id from firestore
                                                            UserServices
                                                                _services =
                                                                new UserServices();
                                                            var doc =
                                                                await _services
                                                                    .getUserById(
                                                                        id);
                                                            name = doc["name"];
                                                          } else {
                                                            String id = email
                                                                .toUpperCase();
                                                            // get user name based on id from firestore
                                                            UserServices
                                                                _services =
                                                                new UserServices();
                                                            var doc =
                                                                await _services
                                                                    .getProfessorById(
                                                                        id);
                                                            name = doc["name"];
                                                          }

                                                          Map<String, dynamic>
                                                              reviewMap = {
                                                            "name": name,
                                                            "email": email,
                                                            "rating":
                                                                rating_global,
                                                            "reviewText":
                                                                reviewText,
                                                            "date": dateTime
                                                          };

                                                          widget.project.Reviews
                                                              .add(reviewMap);

                                                          Map<String, dynamic>
                                                              reviewUpdateMap =
                                                              {
                                                            "Reviews": widget
                                                                .project.Reviews
                                                          };

                                                          ProjectServices
                                                              _services =
                                                              ProjectServices();
                                                          await _services
                                                              .updateProjectData(
                                                                  widget.project
                                                                      .id,
                                                                  reviewUpdateMap);
                                                          setState(() {
                                                            isloading = false;
                                                          });
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Review added successfully",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors.green,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        }
                                                      },
                                                    )
                                                  ],
                                                )
                                          : Center(),
                                    ],
                                  ),
                                SizedBox(
                                  height: 40,
                                ),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(
                                //     "Related Projects",
                                //     textAlign: TextAlign.start,
                                //     style: TextStyle(
                                //         height: 1.3,
                                //         fontFamily: "Metrisch-Bold",
                                //         fontSize: 25),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                                // Container(
                                //   height: 3 * 140.toDouble(),
                                //   child: GridView.builder(
                                //     physics: NeverScrollableScrollPhysics(),
                                //     itemCount: 4,
                                //     gridDelegate:
                                //         SliverGridDelegateWithFixedCrossAxisCount(
                                //             crossAxisCount: 4,
                                //             mainAxisSpacing: 40,
                                //             childAspectRatio: 0.68,
                                //             crossAxisSpacing: 15),
                                //     itemBuilder:
                                //         (BuildContext context, int index) {
                                //       return ProjectCard();
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Footer(),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    600
                                                ? EdgeInsets.all(50)
                                                : EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border:
                                                    Border.all(
                                                        color: Colors.black12)),
                                            height:
                                                MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        600
                                                    ? 550
                                                    : 400,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    600
                                                ? 400
                                                : 350,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: selected == "image1"
                                                      ? NetworkImage(widget
                                                          .project.images[0])
                                                      : selected == "image2"
                                                          ? NetworkImage(widget
                                                              .project
                                                              .images[1])
                                                          : NetworkImage(widget
                                                              .project
                                                              .images[2])),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = "image1";
                                                });
                                              },
                                              child: Card(
                                                elevation: selected == "image1"
                                                    ? 8
                                                    : 0,
                                                child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    height: 110,
                                                    width: 90,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Image(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                widget.project
                                                                        .images[
                                                                    0])))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            widget.project.images.length == 2
                                                ? TextButton(
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      primary: Colors.white,
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selected = "image2";
                                                      });
                                                    },
                                                    child: Card(
                                                      elevation:
                                                          selected == "image2"
                                                              ? 8
                                                              : 0,
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15),
                                                          height: 110,
                                                          width: 90,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Image(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(widget
                                                                          .project
                                                                          .images[
                                                                      1])))),
                                                    ),
                                                  )
                                                : Center(),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            widget.project.images.length == 3
                                                ? TextButton(
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      primary: Colors.white,
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selected = "image3";
                                                      });
                                                    },
                                                    child: Card(
                                                      elevation:
                                                          selected == "image3"
                                                              ? 8
                                                              : 0,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(15),
                                                        height: 110,
                                                        width: 90,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          child: Image(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                widget.project
                                                                    .images[2]),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Center()
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width >
                                              1050
                                          ? 550
                                          : 400,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.project.title,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                height: 1.3,
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              RatingBarIndicator(
                                                rating: 0,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                direction: Axis.horizontal,
                                              ),
                                              Container(
                                                width: 180,
                                                child: Text(
                                                  "(${widget.project.Reviews.length} Reviews)",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      fontSize: 13,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              mb,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 15,
                                                  height: 1.5,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Text(
                                              widget.project.ShortDescription,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.blue,
                                                  size: 15,
                                                )),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    widget.project.KeyFeature1,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.blue,
                                                  size: 15,
                                                )),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    widget.project.KeyFeature2,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.blue,
                                                  size: 15,
                                                )),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    widget.project.KeyFeature3,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 36),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Categories : ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: widget.cat,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 36),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Batch: ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: widget.project.yog,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          // Container(
                                          //   width: double.maxFinite,
                                          //   height: 1,
                                          //   color: Colors.black12,
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        primary: Colors.white,
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isdescription = true;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          gradient: LinearGradient(
                                              begin: const FractionalOffset(
                                                  0.0, 0.0),
                                              end: const FractionalOffset(
                                                  1.0, 0.0),
                                              colors: isdescription == true
                                                  ? [
                                                      Colors.blue.shade400,
                                                      Colors.purple.shade800
                                                    ]
                                                  : [
                                                      Color(0xfff3f5fe),
                                                      Color(0xfff3f5fe)
                                                    ]),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: Center(
                                          child: Text(
                                            "DESCRIPTION",
                                            style: TextStyle(
                                                color: isdescription == true
                                                    ? Colors.white
                                                    : Colors.black,
                                                height: 1.3,
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        primary: Colors.white,
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isdescription = false;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          gradient: LinearGradient(
                                              begin: const FractionalOffset(
                                                  0.0, 0.0),
                                              end: const FractionalOffset(
                                                  1.0, 0.0),
                                              colors: isdescription == true
                                                  ? [
                                                      Color(0xfff3f5fe),
                                                      Color(0xfff3f5fe)
                                                    ]
                                                  : [
                                                      Colors.blue.shade400,
                                                      Colors.purple.shade800
                                                    ]),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: Center(
                                          child: Text(
                                            "REVIEWS (${widget.project.Reviews.length})",
                                            style: TextStyle(
                                                color: isdescription == true
                                                    ? Colors.black
                                                    : Colors.white,
                                                height: 1.3,
                                                fontFamily: "Metrisch-Medium",
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                isdescription == true
                                    ? Container(
                                        child: Text(
                                          widget.project.LongDescription,
                                          style: TextStyle(
                                              fontFamily: "Metrisch-Medium",
                                              height: 1.5,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    380
                                                ? widget.project.Reviews.length
                                                        .toDouble() *
                                                    130
                                                : widget.project.Reviews.length
                                                        .toDouble() *
                                                    150,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: widget
                                                  .project.Reviews.length
                                                  .toInt(),
                                              itemBuilder: (context, index) {
                                                return ProjectDetailsReview(
                                                    re: ReviewList[index]);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          islogin
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Add a review",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          height: 1.3,
                                                          fontFamily:
                                                              "Metrisch-Bold",
                                                          fontSize: 25),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Your email address will not be published. Required fields are marked *",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Your rating",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    RatingBar.builder(
                                                      initialRating: 0,
                                                      minRating: 1,
                                                      itemSize: 20,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4.0),
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                        Icons.star_rounded,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        rating_global = rating;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0)),
                                                          color: Color(
                                                              0xfff3f5fe)),
                                                      child: TextField(
                                                        maxLines: 5,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                        onChanged: (value) {
                                                          //Do something with the user input.
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintStyle: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                          hintText:
                                                              'Your review',
                                                          // contentPadding:
                                                          // EdgeInsets.symmetric(horizontal: 20.0),
                                                          // border: OutlineInputBorder(
                                                          //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                          // ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    GradientButton(
                                                      title: "SUBMIT",
                                                      buttonheight: 45,
                                                      buttonwidth: 130,
                                                    ),
                                                  ],
                                                )
                                              : Center(),
                                        ],
                                      ),
                                SizedBox(
                                  height: 40,
                                ),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(
                                //     "Related Projects",
                                //     textAlign: TextAlign.start,
                                //     style: TextStyle(
                                //         height: 1.3,
                                //         fontFamily: "Metrisch-Bold",
                                //         fontSize: 25),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                                // Container(
                                //   height: 3 * 140.toDouble(),
                                //   child: GridView.builder(
                                //     physics: NeverScrollableScrollPhysics(),
                                //     itemCount: 4,
                                //     gridDelegate:
                                //         SliverGridDelegateWithFixedCrossAxisCount(
                                //             crossAxisCount: 4,
                                //             mainAxisSpacing: 40,
                                //             childAspectRatio: 0.68,
                                //             crossAxisSpacing: 15),
                                //     itemBuilder:
                                //         (BuildContext context, int index) {
                                //       return ProjectCard();
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Footer(),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
