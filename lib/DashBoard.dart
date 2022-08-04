import 'package:bennettprojectgallery/DashBoardElements/RightBoard.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:bennettprojectgallery/services/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'ProjectGalleryElements/NoHoverProjectCard.dart';

class DashBoard extends StatefulWidget {
  final String id;
  final String batch;
  final String course;
  final String email;
  final String image;
  final String name;
  final String school;
  final String yog;
  final List<Project> projectList;

  DashBoard(
      {this.id,
      this.batch,
      this.course,
      this.email,
      this.image,
      this.name,
      this.school,
      this.yog,
      this.projectList});
  @override
  _DashBoardState createState() => _DashBoardState(
      id: this.id,
      batch: this.batch,
      course: this.course,
      email: this.email,
      image: this.image,
      name: this.name,
      school: this.school,
      yog: this.yog,
      projectList: this.projectList);
}

String selected = "zero";
double num_of_reviews = 0;
double no_of_views = 0;

class _DashBoardState extends State<DashBoard> {
  final String id;
  final String batch;
  final String course;
  final String email;
  final String image;
  final String name;
  final String school;
  final String yog;
  final List<Project> projectList;
  _DashBoardState(
      {this.id,
      this.batch,
      this.course,
      this.email,
      this.image,
      this.name,
      this.school,
      this.yog,
      this.projectList});

  List<dynamic> projectListupdated = [];
  List<Project> finalProjectList = [];

  UserServices _services = UserServices();
  ProjectServices _services1 = ProjectServices();

  void count_views_and_reviews_from_projects(projectList) {
    for (int i = 0; i < projectList.length; i++) {
      num_of_reviews = num_of_reviews + projectList[i].Reviews.length;
      no_of_views = no_of_views + projectList[i].viewCount;
    }
  }

  @override
  void initState() {
    count_views_and_reviews_from_projects(projectList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            current: "Dashboard",
          ),
          Container(
            width: 1050,
            height: MediaQuery.of(context).size.height - 60,
            child: MediaQuery.of(context).size.width > 645
                ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SingleChildScrollView(
                        child: Positioned(
                          left: 0,
                          top: 0,
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 200, right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text("Your Projects",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Bold",
                                        fontSize: 25)),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 400,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: projectList.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Container(
                                          width: 250,
                                          margin: EdgeInsets.only(right: 20),
                                          padding: EdgeInsets.only(bottom: 40),
                                          child: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  800
                                              ? ProjectCard(
                                                  project: projectList[index],
                                                )
                                              : NoHoverProjectCard());
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("All Reviews",
                                    style: TextStyle(
                                        fontFamily: "Metrisch-Bold",
                                        fontSize: 25)),
                                SizedBox(
                                  height: 20,
                                ),
                                num_of_reviews == 0
                                    ? Column(
                                        children: [
                                          Center(
                                            child: Text("No Reviews Found"),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ],
                                      )
                                    : Container(
                                        height: num_of_reviews * 130,
                                        child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: num_of_reviews.toInt(),
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 30),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    height: 80,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              "https://firebasestorage.googleapis.com/v0/b/bennettprojectarchive.appspot.com/o/sampleProfilePicImages%2Fpp2.webp?alt=media&token=edc83022-4130-477c-904d-d0cb71b87851")),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width >
                                                            1050
                                                        ? 900
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            150,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width >
                                                                380
                                                            ? Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "David Parker",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        height:
                                                                            1.3,
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    rating: 3.5,
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Colors
                                                                          .amber,
                                                                    ),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        20.0,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                  ),
                                                                ],
                                                              )
                                                            : Column(
                                                                children: [
                                                                  Text(
                                                                    "David Parker",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        height:
                                                                            1.3,
                                                                        fontFamily:
                                                                            "Metrisch-Medium",
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    rating: 3.5,
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Colors
                                                                          .amber,
                                                                    ),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        20.0,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                  ),
                                                                ],
                                                              ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "NOVEMBER 27, 2018",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black26),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          "This is a useful post for finding broken links within the website, what about links pointing outwards that are broken? I can use a free web service but wondered if this was possible.",
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: RightBoard(
                            id: id,
                            batch: batch,
                            school: school,
                            email: email,
                            name: name,
                            yog: yog,
                            course: course,
                            image: image,
                            no_of_reviews: num_of_reviews,
                            no_of_views: no_of_views,
                          ))
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        RightBoard(
                            id: id,
                            batch: batch,
                            school: school,
                            email: email,
                            name: name,
                            yog: yog,
                            course: course,
                            image: image),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text("Your Projects",
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Bold",
                                      fontSize: 25)),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: projectList.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return Container(
                                        width: 250,
                                        margin: EdgeInsets.only(right: 20),
                                        padding: EdgeInsets.only(bottom: 40),
                                        child:
                                            MediaQuery.of(context).size.width >
                                                    800
                                                ? ProjectCard(
                                                    project: projectList[index],
                                                  )
                                                : NoHoverProjectCard());
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("All Reviews",
                                  style: TextStyle(
                                      fontFamily: "Metrisch-Bold",
                                      fontSize: 25)),
                              SizedBox(
                                height: 20,
                              ),
                              num_of_reviews == 0
                                  ? Center(
                                      child: Text("No Reviews Found"),
                                    )
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.width >
                                                  380
                                              ? num_of_reviews * 130
                                              : num_of_reviews * 150,
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: num_of_reviews.toInt(),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding:
                                                EdgeInsets.only(bottom: 30),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 80,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            "https://firebasestorage.googleapis.com/v0/b/bennettprojectarchive.appspot.com/o/sampleProfilePicImages%2Fpp2.webp?alt=media&token=edc83022-4130-477c-904d-d0cb71b87851")),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width >
                                                          1050
                                                      ? 900
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .width >
                                                              380
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "David Parker",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          1.3,
                                                                      fontFamily:
                                                                          "Metrisch-Medium",
                                                                      fontSize:
                                                                          17),
                                                                ),
                                                                RatingBarIndicator(
                                                                  rating: 3.5,
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      20.0,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                ),
                                                              ],
                                                            )
                                                          : Column(
                                                              children: [
                                                                Text(
                                                                  "David Parker",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          1.3,
                                                                      fontFamily:
                                                                          "Metrisch-Medium",
                                                                      fontSize:
                                                                          17),
                                                                ),
                                                                RatingBarIndicator(
                                                                  rating: 3.5,
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      20.0,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                ),
                                                              ],
                                                            ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "NOVEMBER 27, 2018",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black26),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        "This is a useful post for finding broken links within the website, what about links pointing outwards that are broken? I can use a free web service but wondered if this was possible.",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
