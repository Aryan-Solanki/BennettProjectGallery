import 'package:bennettprojectgallery/DashBoardElements/RightBoard.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/models/Review.dart';
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

  List<Project> projectListupdated = [];
  List<Project> finalProjectList = [];
  List<Review> finalReviewList = [];

  bool updated = false;

  UserServices _services = UserServices();
  ProjectServices _services1 = ProjectServices();

  void count_views_and_reviews_from_projects(projectList) {
    num_of_reviews = 0;
    no_of_views = 0;
    for (int i = 0; i < projectList.length; i++) {
      num_of_reviews = num_of_reviews + projectList[i].Reviews.length;

      for (int j = 0; j < projectList[i].Reviews.length; j++) {
        finalReviewList.add(new Review(
            reviewText: projectList[i].Reviews[j]["reviewText"],
            name: projectList[i].Reviews[j]["name"],
            date: projectList[i].Reviews[j]["date"],
            rating: projectList[i].Reviews[j]["rating"]));
      }

      no_of_views = no_of_views + projectList[i].viewCount;
    }
  }

  @override
  void initState() {
    count_views_and_reviews_from_projects(projectList);
    super.initState();
  }

  void reloadProjectList() async {
    List<dynamic> projectList = [];
    UserServices _services = new UserServices();
    var doc = await _services.getUserById(widget.id);
    projectList = doc["projects"];

    List<Project> projectListFinal = [];
    UserServices _services1 = new UserServices();

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

      _services.updateUserData(widget.id, {"projects": projectList});

      projectListFinal.add(
        new Project(
          id: project.id,
          yog: project["StudentIdList"][0]["yog"],
          like_count: project["LikeCount"],
          DatasetLink: project["ProjectDetails"]["DatasetLink"],
          ShortDescription: project["ProjectDetails"]["ShortDescription"],
          LongDescription: project["ProjectDetails"]["LongDescription"],
          KeyFeature1: project["ProjectDetails"]["KeyFeature1"],
          KeyFeature2: project["ProjectDetails"]["KeyFeature2"],
          KeyFeature3: project["ProjectDetails"]["KeyFeature3"],
          ProjectLink: project["ProjectDetails"]["ProjectLink"],
          ReportLink: project["ProjectDetails"]["ReportLink"],
          VideoLink: project["ProjectDetails"]["VideoLink"],
          Reviews: project["Reviews"],
          StudentList: project["StudentIdList"],
          images: project["images"],
          title: project["title"],
          timestamp: project["datetime"],
          viewCount: project["viewCount"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );

      projectListFinal.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    }
    updated = true;
    setState(() {
      projectListupdated = projectListFinal;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (updated == false) {
      finalProjectList = widget.projectList;
    } else {
      finalProjectList = projectListupdated;
    }

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
                              finalProjectList.length != 0
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 400,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: finalProjectList.length,
                                        itemBuilder:
                                            (BuildContext ctxt, int index) {
                                          return Container(
                                              width: 250,
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              padding:
                                                  EdgeInsets.only(bottom: 40),
                                              child: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      800
                                                  ? ProjectCard(
                                                      project: finalProjectList[
                                                          index],
                                                    )
                                                  : NoHoverProjectCard(
                                                      project: finalProjectList[
                                                          index],
                                                    ));
                                        },
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Center(
                                          child: Text("No Projects Found"),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        )
                                      ],
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
                                                                  finalReviewList[
                                                                          index]
                                                                      .name,
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
                                                                  rating: finalReviewList[
                                                                          index]
                                                                      .rating,
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
                                                                  finalReviewList[
                                                                          index]
                                                                      .name,
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
                                                                  rating: finalReviewList[
                                                                          index]
                                                                      .rating,
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
                                                        finalReviewList[index]
                                                            .date,
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
                                                        finalReviewList[index]
                                                            .reviewText,
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
                              func: reloadProjectList))
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
                            image: image,
                            no_of_reviews: num_of_reviews,
                            no_of_views: no_of_views,
                            func: reloadProjectList),
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
                              finalProjectList.length != 0
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 400,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: finalProjectList.length,
                                        itemBuilder:
                                            (BuildContext ctxt, int index) {
                                          return Container(
                                              width: 250,
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              padding:
                                                  EdgeInsets.only(bottom: 40),
                                              child: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      800
                                                  ? ProjectCard(
                                                      project: finalProjectList[
                                                          index],
                                                    )
                                                  : NoHoverProjectCard(
                                                      project: finalProjectList[
                                                          index],
                                                    ));
                                        },
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Center(
                                          child: Text("No Projects Found"),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        )
                                      ],
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
                                                                  finalReviewList[
                                                                          index]
                                                                      .name,
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
                                                                  rating: finalReviewList[
                                                                          index]
                                                                      .rating,
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
                                                                  finalReviewList[
                                                                          index]
                                                                      .name,
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
                                                                  rating: finalReviewList[
                                                                          index]
                                                                      .rating,
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
                                                        finalReviewList[index]
                                                            .date,
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
                                                        finalReviewList[index]
                                                            .reviewText,
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
