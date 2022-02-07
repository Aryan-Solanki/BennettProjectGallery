import 'package:bennettprojectgallery/HomePageElements/Footer.dart';
import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectDetailsElements/ProjectDetailsReview.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectDetail extends StatefulWidget {
  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  String selected = "image1";
  String image1link =
      "https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1";
  String image2link =
      "https://th.bing.com/th/id/OIP.E8MxC5RjDDEdkAbNWZXKjAAAAA?pid=ImgDet&w=367&h=550&rs=1";
  String image3link =
      "https://th.bing.com/th/id/OIP.zCCnWcLaZFZMuiCps0LWBQHaHd?pid=ImgDet&w=848&h=854&rs=1";
  bool isdescription = true;
  double num_of_reviews = 3;
  @override
  Widget build(BuildContext context) {
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
                                                      ? NetworkImage(image1link)
                                                      : selected == "image2"
                                                          ? NetworkImage(
                                                              image2link)
                                                          : NetworkImage(
                                                              image3link)),
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
                                                                image1link)))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = "image2";
                                                });
                                              },
                                              child: Card(
                                                elevation: selected == "image2"
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
                                                                image2link)))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = "image3";
                                                });
                                              },
                                              child: Card(
                                                elevation: selected == "image3"
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
                                                                image3link)))),
                                              ),
                                            ),
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
                                            "Computer Vision using Machine Learning and DeepLearning",
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
                                                rating: 3.5,
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
                                                  "(1 customer review)",
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
                                              "Made by - Aryan Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            child: Text(
                                              "We et solutions that are at the forefront of the industry.We enjoy adapting our strategies to offer every client the best solutions that are at the forefront of the industry.",
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
                                                  "We enjoy adapting our strategies to offer every client the best solutions",
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
                                                  "We enjoy adapting our strategies to offer every client the best solutions",
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
                                                  "We enjoy adapting our strategies to offer every client the best solutions",
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
                                                    text: 'Topic: ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: 'Machine Learning',
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
                                                    text: '2020-2024',
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
                                                    text: 'Project Type: ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: 'End Semester',
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
                                          GradientButton(
                                            title: "Upvote Project ",
                                            buttonheight: 45,
                                            buttonwidth: 180,
                                          )
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
                                            "REVIEWS ($num_of_reviews)",
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
                                          "We et solutions that are at the forefront of the industry.We enjoy adapting our strategies to offer every client the best solutions that are at the forefront of the industry.",
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
                                                ? num_of_reviews * 130
                                                : num_of_reviews * 150,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: 5,
                                              itemBuilder: (context, index) {
                                                return ProjectDetailsReview();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Add a review",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                height: 1.3,
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Your email address will not be published. Required fields are marked *",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.5,
                                                fontSize: 15,
                                                color: Colors.black54),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5.0)),
                                                      color: Color(0xfff3f5fe)),
                                                  height: 45,
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                    onChanged: (value) {
                                                      //Do something with the user input.
                                                    },
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                      hintText: 'Name',
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
                                                width: 40,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5.0)),
                                                      color: Color(0xfff3f5fe)),
                                                  height: 45,
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                    onChanged: (value) {
                                                      //Do something with the user input.
                                                    },
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                      hintText: 'Email',
                                                      // contentPadding:
                                                      // EdgeInsets.symmetric(horizontal: 20.0),
                                                      // border: OutlineInputBorder(
                                                      //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Your rating",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
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
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                color: Color(0xfff3f5fe)),
                                            child: TextField(
                                              maxLines: 5,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              onChanged: (value) {
                                                //Do something with the user input.
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                hintText: 'Your review',
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
                                          )
                                        ],
                                      ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Related Projects",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        height: 1.3,
                                        fontFamily: "Metrisch-Bold",
                                        fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 3 * 140.toDouble(),
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 40,
                                            childAspectRatio: 0.68,
                                            crossAxisSpacing: 15),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProjectCard();
                                    },
                                  ),
                                ),
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
                                                      ? NetworkImage(image1link)
                                                      : selected == "image2"
                                                          ? NetworkImage(
                                                              image2link)
                                                          : NetworkImage(
                                                              image3link)),
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
                                                                image1link)))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = "image2";
                                                });
                                              },
                                              child: Card(
                                                elevation: selected == "image2"
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
                                                                image2link)))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                primary: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = "image3";
                                                });
                                              },
                                              child: Card(
                                                elevation: selected == "image3"
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
                                                                image3link)))),
                                              ),
                                            ),
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
                                            "Computer Vision using Machine Learning and DeepLearning",
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
                                                rating: 3.5,
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
                                                  "(1 customer review)",
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
                                              "Made by - Aryan Solanki",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            child: Text(
                                              "We et solutions that are at the forefront of the industry.We enjoy adapting our strategies to offer every client the best solutions that are at the forefront of the industry.",
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
                                                    "We enjoy adapting our strategies to offer every client the best solutions",
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
                                                    "We enjoy adapting our strategies to offer every client the best solutions",
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
                                                    "We enjoy adapting our strategies to offer every client the best solutions",
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
                                          GradientButton(
                                            title: "Upvote Project ",
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
                                                    text: 'Topic: ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: 'Machine Learning',
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
                                                    text: '2020-2024',
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
                                                    text: 'Project Type: ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text: 'End Semester',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54)),
                                              ],
                                            ),
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
                                            "REVIEWS ($num_of_reviews)",
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
                                          "We et solutions that are at the forefront of the industry.We enjoy adapting our strategies to offer every client the best solutions that are at the forefront of the industry.",
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
                                                ? num_of_reviews * 130
                                                : num_of_reviews * 150,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: num_of_reviews.toInt(),
                                              itemBuilder: (context, index) {
                                                return ProjectDetailsReview();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Add a review",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                height: 1.3,
                                                fontFamily: "Metrisch-Bold",
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Your email address will not be published. Required fields are marked *",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.5,
                                                fontSize: 15,
                                                color: Colors.black54),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5.0)),
                                                      color: Color(0xfff3f5fe)),
                                                  height: 45,
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                    onChanged: (value) {
                                                      //Do something with the user input.
                                                    },
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                      hintText: 'Name',
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
                                                width: 40,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5.0)),
                                                      color: Color(0xfff3f5fe)),
                                                  height: 45,
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                    onChanged: (value) {
                                                      //Do something with the user input.
                                                    },
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                      hintText: 'Email',
                                                      // contentPadding:
                                                      // EdgeInsets.symmetric(horizontal: 20.0),
                                                      // border: OutlineInputBorder(
                                                      //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Your rating",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
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
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                color: Color(0xfff3f5fe)),
                                            child: TextField(
                                              maxLines: 5,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              onChanged: (value) {
                                                //Do something with the user input.
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                hintText: 'Your review',
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
                                          )
                                        ],
                                      ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Related Projects",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        height: 1.3,
                                        fontFamily: "Metrisch-Bold",
                                        fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 3 * 140.toDouble(),
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 40,
                                            childAspectRatio: 0.68,
                                            crossAxisSpacing: 15),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProjectCard();
                                    },
                                  ),
                                ),
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
