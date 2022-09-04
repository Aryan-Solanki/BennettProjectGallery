import 'dart:async';

import 'package:algolia/algolia.dart';
import 'package:bennettprojectgallery/HomePageElements/Footer.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/services/algoliaService.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/NoHoverProjectCard.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/RightSide.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/batchwiseprojects.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/categoriesButton.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/topprojects.dart';
import 'package:lottie/lottie.dart';

class ProjectGallery extends StatefulWidget {
  final List<dynamic> categoriesname;
  final String searchTerm;
  final String categoryTerm;
  final String yearTerm;
  final bool lm;
  ProjectGallery(
      {@required this.categoriesname,
      this.searchTerm = "",
      this.categoryTerm = "",
      this.yearTerm = "",
      this.lm = true});
  @override
  _ProjectGalleryState createState() =>
      _ProjectGalleryState(categoriesname: categoriesname);
}

class _ProjectGalleryState extends State<ProjectGallery> {
  List<Project> ProjectList = [];
  List<dynamic> keys = [];

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _projects = [];
  bool _loadingProducts = true;
  int _perpage = 9;
  DocumentSnapshot _lastDocument;
  bool _gettingMoreProducts = false;
  bool _moreProductsAvailable = true;

  _getCategoryProducts(String catname) async {
    // firestore query where category is equal to the category name and category is inside project details in firestore database structure
    Query q = _firestore
        .collection("project")
        .where("ProjectDetails.Categories", arrayContains: catname)
        .orderBy("datetime", descending: true)
        .limit(_perpage);
    setState(() {
      _loadingProducts = true;
    });
    QuerySnapshot querySnapshot = await q.get();
    _projects = querySnapshot.docs;
    for (var project in _projects) {
      ProjectList.add(
        new Project(
          id: project.id,
          yog: project["StudentIdList"][0]["yog"].toString(),
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
          viewCount: project["viewCount"],
          timestamp: project["datetime"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    // ProjectList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    if (ProjectList.length == 0) {
      setState(() {
        _loadingProducts = false;
        _moreProductsAvailable = false;
      });
    } else {
      _lastDocument = _projects[_projects.length - 1];
      setState(() {
        Future.delayed(Duration(seconds: 1), () {
          // <-- Delay here
          setState(() {
            _loadingProducts = false; // <-- Code run after delay
          });
        });
      });
    }
    // _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
  }

  getMoreCategoryProducts(String catname) async {
    if (_moreProductsAvailable == false) {
      return;
    }

    if (_gettingMoreProducts == true) {
      return;
    }

    _gettingMoreProducts = true;

    Query q = _firestore
        .collection("project")
        .where("ProjectDetails.Categories", arrayContains: catname)
        .orderBy("datetime", descending: true)
        .startAfter([_lastDocument.get("datetime")]).limit(_perpage);
    QuerySnapshot querySnapshot = await q.get();

    if (querySnapshot.docs.length < _perpage) {
      _moreProductsAvailable = false;
    }

    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    _projects = querySnapshot.docs;
    for (var project in _projects) {
      ProjectList.add(
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
          viewCount: project["viewCount"],
          timestamp: project["datetime"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    // ProjectList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    setState(() {});
    _gettingMoreProducts = false;
  }

  _getYearProducts(String yearname) async {
    // firestore query where category is equal to the category name and category is inside project details in firestore database structure
    Query q = _firestore
        .collection("project")
        .where("StudentYearList", arrayContains: yearname)
        .orderBy("datetime", descending: true)
        .limit(_perpage);
    setState(() {
      _loadingProducts = true;
    });
    QuerySnapshot querySnapshot = await q.get();
    _projects = querySnapshot.docs;
    for (var project in _projects) {
      ProjectList.add(
        new Project(
          id: project.id,
          yog: project["StudentIdList"][0]["yog"].toString(),
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
          viewCount: project["viewCount"],
          timestamp: project["datetime"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    // ProjectList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    if (ProjectList.length == 0) {
      setState(() {
        _loadingProducts = false;
        _moreProductsAvailable = false;
      });
    } else {
      _lastDocument = _projects[_projects.length - 1];
      setState(() {
        Future.delayed(Duration(seconds: 1), () {
          // <-- Delay here
          setState(() {
            _loadingProducts = false; // <-- Code run after delay
          });
        });
      });
    }
    // _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    // setState(() {
    //   Future.delayed(Duration(seconds: 1), () {
    //     // <-- Delay here
    //     setState(() {
    //       _loadingProducts = false; // <-- Code run after delay
    //     });
    //   });
    // });
  }

  getMoreYearProducts(String yearname) async {
    if (_moreProductsAvailable == false) {
      return;
    }

    if (_gettingMoreProducts == true) {
      return;
    }

    _gettingMoreProducts = true;

    Query q = _firestore
        .collection("project")
        .where("StudentYearList", arrayContains: yearname)
        .orderBy("datetime", descending: true)
        .startAfter([_lastDocument.get("datetime")]).limit(_perpage);
    QuerySnapshot querySnapshot = await q.get();

    if (querySnapshot.docs.length < _perpage) {
      _moreProductsAvailable = false;
    }

    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    _projects = querySnapshot.docs;
    for (var project in _projects) {
      ProjectList.add(
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
          viewCount: project["viewCount"],
          timestamp: project["datetime"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    // ProjectList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    setState(() {});
    _gettingMoreProducts = false;
  }

  _getProducts() async {
    // firestore query orderby reverse datetime to show latest projects at top
    Query q = _firestore
        .collection("project")
        .orderBy("datetime", descending: true)
        .limit(_perpage);
    setState(() {
      _loadingProducts = true;
    });
    QuerySnapshot querySnapshot = await q.get();
    _projects = querySnapshot.docs;
    for (var project in _projects) {
      ProjectList.add(
        new Project(
          id: project.id,
          yog: project["StudentIdList"][0]["yog"].toString(),
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
          viewCount: project["viewCount"],
          timestamp: project["datetime"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    // ProjectList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    setState(() {
      Future.delayed(Duration(seconds: 1), () {
        // <-- Delay here
        setState(() {
          _loadingProducts = false; // <-- Code run after delay
        });
      });
    });
  }

  getMoreProducts() async {
    if (_moreProductsAvailable == false) {
      return;
    }

    if (_gettingMoreProducts == true) {
      return;
    }

    _gettingMoreProducts = true;

    Query q = _firestore
        .collection("project")
        .orderBy("datetime", descending: true)
        .startAfter([_lastDocument.get("datetime")]).limit(_perpage);
    QuerySnapshot querySnapshot = await q.get();

    if (querySnapshot.docs.length < _perpage) {
      _moreProductsAvailable = false;
    }

    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    _projects = querySnapshot.docs;
    for (var project in _projects) {
      ProjectList.add(
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
          viewCount: project["viewCount"],
          timestamp: project["datetime"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    // ProjectList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    setState(() {});
    _gettingMoreProducts = false;
  }

  AlgoliaQuery algoliaQuery;
  Algolia algolia;

  refresh(String x) {
    print(x);
    // var newString = x.substring(x.length - 5).trim();
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ProjectGallery(
    //               categoriesname: categoriesname,
    //               searchTerm: newString,
    //             )));
  }

  final List<dynamic> categoriesname;
  _ProjectGalleryState({this.categoriesname});

  Future<List<AlgoliaObjectSnapshot>> _searchalgolia(String input) async {
    AlgoliaQuery query = algolia.instance.index("project").query(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  searchalgolia(String query) async {
    setState(() {
      _loadingProducts = true;
    });
    //search algolia for query and get results in descending order of datetime
    List<AlgoliaObjectSnapshot> snaplist = await _searchalgolia(query);
    for (var pr in snaplist) {
      var project = pr.data;
      // var timestamp1 = project["datetime"]; // timestamp in seconds
      // Timestamp ts = Timestamp.fromMillisecondsSinceEpoch(timestamp1 * 1000);

      ProjectList.add(
        new Project(
          id: pr.objectID,
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
          viewCount: project["viewCount"],
          Categories: project["ProjectDetails"]["Categories"],
          ProfessorDetails: project["ProfessorDetails"],
        ),
      );
    }
    //reverse a list in dart
    ProjectList = ProjectList.reversed.toList();
    setState(() {
      Future.delayed(Duration(seconds: 1), () {
        // <-- Delay here
        setState(() {
          _loadingProducts = false; // <-- Code run after delay
        });
      });
    });
  }

  @override
  void initState() {
    algolia = Application.algolia;
    if (widget.categoryTerm != "") {
      _getCategoryProducts(widget.categoryTerm);
    } else if (widget.yearTerm != "") {
      _getYearProducts(widget.yearTerm);
    } else if (widget.searchTerm == "") {
      _getProducts();
    } else {
      searchalgolia(widget.searchTerm);
    }
    super.initState();
  }

  String searchedvalue = "";

  List<String> sortkeys = <String>[];

  // int cardnumber = 9;

  bool searched = false;

  @override
  Widget build(BuildContext context) {
    double catheight = (43 * categoriesname.length) as double;
    final Widget normalChildButton = Container(
      color: Color(0xfff3f5fe),
      width: 250,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                selectedKey,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: "Metrisch-Medium",
                    height: 1.5,
                    fontSize: 15,
                    color: Colors.black54),
              ),
            ),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            current: "Project Gallery",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: ResponsiveBuilder(
                      breakpoints: ScreenBreakpoints(
                          tablet: 580, desktop: 971, watch: 300),
                      builder: (context, sizingInformation) {
                        // Check the sizing information here and return your UI
                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResponsiveBuilder(
                                breakpoints: ScreenBreakpoints(
                                    tablet: 971, desktop: 1140, watch: 300),
                                builder: (context, sizingInformation) {
                                  // Check the sizing information here and return your UI
                                  if (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop) {
                                    return Container(
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                color: Color(0xfff3f5fe)),
                                            height: 45,
                                            child: TextField(
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              onChanged: (value) {
                                                searchedvalue = value;
                                                //Do something with the user input.
                                              },
                                              decoration: InputDecoration(
                                                suffixIcon: InkWell(
                                                    onTap: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProjectGallery(
                                                                    categoriesname:
                                                                        categoriesname,
                                                                    searchTerm:
                                                                        searchedvalue,
                                                                    lm: false,
                                                                  )));
                                                    },
                                                    child: Icon(
                                                      Icons.search,
                                                      size: 22,
                                                      color: Colors.black,
                                                    )),

                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),

                                                hintText: 'Search Project',
                                                // contentPadding:
                                                // EdgeInsets.symmetric(horizontal: 20.0),
                                                // border: OutlineInputBorder(
                                                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                // ),
                                              ),
                                              onSubmitted: (query) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProjectGallery(
                                                              categoriesname:
                                                                  categoriesname,
                                                              searchTerm: query,
                                                              lm: false,
                                                            )));
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
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
                                                width: 5,
                                                height: 3,
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
                                                width: 20,
                                                height: 3,
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
                                                width: 5,
                                                height: 3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Categories",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: catheight,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: categoriesname.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    CategoriesButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          searched = true;
                                                          Navigator
                                                              .pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ProjectGallery(
                                                                            categoriesname:
                                                                                categoriesname,
                                                                            categoryTerm:
                                                                                categoriesname[index]["name"],
                                                                          )));
                                                        });
                                                      },
                                                      categoryName:
                                                          categoriesname[index]
                                                              ["name"],
                                                      categoryQuantity:
                                                          categoriesname[index]
                                                              ["number"],
                                                    ),
                                                    Divider(
                                                      color: Colors.black12,
                                                      thickness: 1,
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 40,
                                          // ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Container(
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: Colors.orange.shade400,
                                          //       ),
                                          //       width: 5,
                                          //       height: 3,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Container(
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: Colors.orange.shade400,
                                          //       ),
                                          //       width: 20,
                                          //       height: 3,
                                          //     ),
                                          //     // SizedBox(
                                          //     //   width: 10,
                                          //     // ),
                                          //     // Container(
                                          //     //   decoration: BoxDecoration(
                                          //     //     borderRadius:
                                          //     //         BorderRadius.circular(5),
                                          //     //     color: Colors.orange.shade400,
                                          //     //   ),
                                          //     //   width: 5,
                                          //     //   height: 3,
                                          //     // )
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   height: 15,
                                          // ),
                                          // Text(
                                          //   "Most Viewed Projects",
                                          //   style: TextStyle(
                                          //       fontSize: 21,
                                          //       color: Colors.black87,
                                          //       fontFamily: "Metrisch-Bold"),
                                          // ),
                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                          // Container(
                                          //   height: 300,
                                          //   child: ListView.builder(
                                          //     physics:
                                          //         NeverScrollableScrollPhysics(),
                                          //     shrinkWrap: true,
                                          //     itemCount: 3,
                                          //     itemBuilder: (context, index) {
                                          //       return TopProjects(
                                          //         projectName:
                                          //             "Computer Vision using Deep Learning and Machine Learning",
                                          //         madeBy: "Aryan Solanki",
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 40,
                                          ),
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
                                                width: 5,
                                                height: 3,
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
                                                width: 20,
                                                height: 3,
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
                                                width: 5,
                                                height: 3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Batch Wise Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BatchWiseProjects(
                                              notifyParent: refresh,
                                              categoriesname: categoriesname),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  if (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.tablet) {
                                    return Container(
                                      width: 220,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                color: Color(0xfff3f5fe)),
                                            height: 45,
                                            child: TextField(
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              onChanged: (value) {
                                                searchedvalue = value;
                                                //Do something with the user input.
                                              },
                                              onSubmitted: (query) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProjectGallery(
                                                              categoriesname:
                                                                  categoriesname,
                                                              searchTerm:
                                                                  searchedvalue,
                                                              lm: false,
                                                            )));
                                              },
                                              decoration: InputDecoration(
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProjectGallery(
                                                                  categoriesname:
                                                                      categoriesname,
                                                                  searchTerm:
                                                                      searchedvalue,
                                                                  lm: false,
                                                                )));
                                                  },
                                                  child: Icon(
                                                    Icons.search,
                                                    size: 22,
                                                    color: Colors.black,
                                                  ),
                                                ),

                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                hintText: 'Search Project',
                                                // contentPadding:
                                                // EdgeInsets.symmetric(horizontal: 20.0),
                                                // border: OutlineInputBorder(
                                                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                // ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
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
                                                width: 5,
                                                height: 3,
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
                                                width: 20,
                                                height: 3,
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
                                                width: 5,
                                                height: 3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Categories",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: catheight,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: categoriesname.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    CategoriesButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          searched = true;
                                                          Navigator
                                                              .pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ProjectGallery(
                                                                            categoriesname:
                                                                                categoriesname,
                                                                            categoryTerm:
                                                                                categoriesname[index]["name"],
                                                                          )));
                                                        });
                                                      },
                                                      categoryName:
                                                          categoriesname[index]
                                                              ["name"],
                                                      categoryQuantity:
                                                          categoriesname[index]
                                                              ["number"],
                                                    ),
                                                    Divider(
                                                      color: Colors.black12,
                                                      thickness: 1,
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 40,
                                          // ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Container(
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: Colors.orange.shade400,
                                          //       ),
                                          //       width: 5,
                                          //       height: 3,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Container(
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: Colors.orange.shade400,
                                          //       ),
                                          //       width: 20,
                                          //       height: 3,
                                          //     ),
                                          //     // SizedBox(
                                          //     //   width: 10,
                                          //     // ),
                                          //     // Container(
                                          //     //   decoration: BoxDecoration(
                                          //     //     borderRadius:
                                          //     //         BorderRadius.circular(5),
                                          //     //     color: Colors.orange.shade400,
                                          //     //   ),
                                          //     //   width: 5,
                                          //     //   height: 3,
                                          //     // )
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   height: 15,
                                          // ),
                                          // Text(
                                          //   "Most Viewed Projects",
                                          //   style: TextStyle(
                                          //       fontSize: 21,
                                          //       color: Colors.black87,
                                          //       fontFamily: "Metrisch-Bold"),
                                          // ),
                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                          // Container(
                                          //   height: 300,
                                          //   child: ListView.builder(
                                          //     physics:
                                          //         NeverScrollableScrollPhysics(),
                                          //     shrinkWrap: true,
                                          //     itemCount: 3,
                                          //     itemBuilder: (context, index) {
                                          //       return TopProjects(
                                          //         projectName:
                                          //             "Computer Vision using Deep Learning and Machine Learning",
                                          //         madeBy: "Aryan Solanki",
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 40,
                                          ),
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
                                                width: 5,
                                                height: 3,
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
                                                width: 20,
                                                height: 3,
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
                                                width: 5,
                                                height: 3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Batch Wise Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BatchWiseProjects(
                                            categoriesname: categoriesname,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color: Color(0xfff3f5fe)),
                                          height: 45,
                                          child: TextField(
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.5,
                                                fontSize: 15,
                                                color: Colors.black54),
                                            onChanged: (value) {
                                              searchedvalue = value;
                                            },
                                            onSubmitted: (query) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProjectGallery(
                                                            categoriesname:
                                                                categoriesname,
                                                            searchTerm:
                                                                searchedvalue,
                                                            lm: false,
                                                          )));
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProjectGallery(
                                                                categoriesname:
                                                                    categoriesname,
                                                                searchTerm:
                                                                    searchedvalue,
                                                                lm: false,
                                                              )));
                                                },
                                                child: Icon(
                                                  Icons.search,
                                                  size: 22,
                                                  color: Colors.black,
                                                ),
                                              ),

                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              hintText: 'Search Project',
                                              // contentPadding:
                                              // EdgeInsets.symmetric(horizontal: 20.0),
                                              // border: OutlineInputBorder(
                                              //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                              // ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
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
                                              width: 5,
                                              height: 3,
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
                                              width: 20,
                                              height: 3,
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
                                              width: 5,
                                              height: 3,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Categories",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.black87,
                                              fontFamily: "Metrisch-Bold"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: catheight,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: categoriesname.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  CategoriesButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        searched = true;
                                                        Navigator
                                                            .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ProjectGallery(
                                                                              categoriesname: categoriesname,
                                                                              categoryTerm: categoriesname[index]["name"],
                                                                            )));
                                                      });
                                                    },
                                                    categoryName:
                                                        categoriesname[index]
                                                            ["name"],
                                                    categoryQuantity:
                                                        categoriesname[index]
                                                            ["number"],
                                                  ),
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 1,
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 40,
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.center,
                                        //   children: [
                                        //     Container(
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(5),
                                        //         color: Colors.orange.shade400,
                                        //       ),
                                        //       width: 5,
                                        //       height: 3,
                                        //     ),
                                        //     SizedBox(
                                        //       width: 10,
                                        //     ),
                                        //     Container(
                                        //       decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(5),
                                        //         color: Colors.orange.shade400,
                                        //       ),
                                        //       width: 20,
                                        //       height: 3,
                                        //     ),
                                        //     // SizedBox(
                                        //     //   width: 10,
                                        //     // ),
                                        //     // Container(
                                        //     //   decoration: BoxDecoration(
                                        //     //     borderRadius:
                                        //     //         BorderRadius.circular(5),
                                        //     //     color: Colors.orange.shade400,
                                        //     //   ),
                                        //     //   width: 5,
                                        //     //   height: 3,
                                        //     // )
                                        //   ],
                                        // ),
                                        // SizedBox(
                                        //   height: 15,
                                        // ),
                                        // Text(
                                        //   "Most Viewed Projects",
                                        //   style: TextStyle(
                                        //       fontSize: 21,
                                        //       color: Colors.black87,
                                        //       fontFamily: "Metrisch-Bold"),
                                        // ),
                                        // SizedBox(
                                        //   height: 20,
                                        // ),
                                        // Container(
                                        //   height: 300,
                                        //   child: ListView.builder(
                                        //     physics:
                                        //         NeverScrollableScrollPhysics(),
                                        //     shrinkWrap: true,
                                        //     itemCount: 3,
                                        //     itemBuilder: (context, index) {
                                        //       return TopProjects(
                                        //         projectName:
                                        //             "Computer Vision using Deep Learning and Machine Learning",
                                        //         madeBy: "Aryan Solanki",
                                        //       );
                                        //     },
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 40,
                                        ),
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
                                              width: 5,
                                              height: 3,
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
                                              width: 20,
                                              height: 3,
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
                                              width: 5,
                                              height: 3,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Batch Wise Projects",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.black87,
                                              fontFamily: "Metrisch-Bold"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        BatchWiseProjects(
                                          categoriesname: categoriesname,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              ResponsiveBuilder(
                                breakpoints: ScreenBreakpoints(
                                    tablet: 700, desktop: 1140, watch: 541),
                                builder: (context, sizingInformation) {
                                  // Check the sizing information here and return your UI
                                  if (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      width: 800,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              widget.searchTerm == ""
                                                  // TODO: FOR CATEGORY SEARCH AND YEAR SEARCH
                                                  ? Text(
                                                      "Showing 1–9 of 12 results",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    )
                                                  : Text(
                                                      'Showing 1–9 of "${widget.searchTerm}"',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                              MenuButton<String>(
                                                child: normalChildButton,
                                                items: sortkeys,
                                                itemBuilder: (String value) =>
                                                    Container(
                                                  height: 40,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                toggledChild: Container(
                                                  child: normalChildButton,
                                                ),
                                                onItemSelected: (String value) {
                                                  setState(() {
                                                    selectedKey = value;
                                                  });
                                                },
                                                onMenuButtonToggle:
                                                    (bool isToggle) {
                                                  print(isToggle);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          _loadingProducts == true
                                              ? Container(
                                                  height: 300,
                                                  width: 300,
                                                  child: Lottie.asset(
                                                      'assets/loading.json',
                                                      frameRate: FrameRate.max),
                                                )
                                              : ProjectList.length != 0
                                                  ? Container(
                                                      clipBehavior: Clip.none,
                                                      // height: ProjectList.length *
                                                      //     160.toDouble(),
                                                      child: GridView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            ProjectList.length,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                mainAxisSpacing:
                                                                    40,
                                                                childAspectRatio:
                                                                    0.68,
                                                                crossAxisSpacing:
                                                                    20),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        30.0),
                                                            child: ProjectCard(
                                                                project:
                                                                    ProjectList[
                                                                        index]),
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  : Text("No Projects Found"),
                                          _moreProductsAvailable == true &&
                                                  _loadingProducts == false
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 50.0),
                                                  child: ProjectList.length >
                                                              9 &&
                                                          widget.lm == true
                                                      ? GradientButton(
                                                          title: "Load More",
                                                          onPressed: () {
                                                            if (widget
                                                                    .categoryTerm !=
                                                                "") {
                                                              getMoreCategoryProducts(
                                                                  widget
                                                                      .categoryTerm);
                                                            } else if (widget
                                                                    .yearTerm !=
                                                                "") {
                                                              getMoreYearProducts(
                                                                  widget
                                                                      .yearTerm);
                                                            } else if (widget
                                                                    .searchTerm ==
                                                                "") {
                                                              getMoreProducts();
                                                            } else {
                                                              //TODO: Get more products from algolia
                                                            }
                                                          },
                                                        )
                                                      : Center(),
                                                )
                                              : Center(),
                                        ],
                                      ),
                                    );
                                  }
                                  if (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.tablet) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      width: 660,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              widget.searchTerm == ""
                                                  ? Text(
                                                      "Showing 1–9 of 12 results",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    )
                                                  : Text(
                                                      'Showing 1–9 of "${widget.searchTerm}"',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                              MenuButton<String>(
                                                child: normalChildButton,
                                                items: sortkeys,
                                                itemBuilder: (String value) =>
                                                    Container(
                                                  height: 40,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                toggledChild: Container(
                                                  child: normalChildButton,
                                                ),
                                                onItemSelected: (String value) {
                                                  setState(() {
                                                    selectedKey = value;
                                                  });
                                                },
                                                onMenuButtonToggle:
                                                    (bool isToggle) {
                                                  print(isToggle);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          _loadingProducts == true
                                              ? Container(
                                                  height: 300,
                                                  width: 300,
                                                  child: Lottie.asset(
                                                      'assets/loading.json',
                                                      frameRate: FrameRate.max),
                                                )
                                              : ProjectList.length != 0
                                                  ? Container(
                                                      clipBehavior: Clip.none,
                                                      // height: ProjectList.length *
                                                      //     160.toDouble(),
                                                      child: GridView.builder(
                                                        clipBehavior: Clip.none,
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            ProjectList.length,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                mainAxisSpacing:
                                                                    40,
                                                                childAspectRatio:
                                                                    0.63,
                                                                crossAxisSpacing:
                                                                    20),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return NoHoverProjectCard(
                                                              project:
                                                                  ProjectList[
                                                                      index]);
                                                        },
                                                      ),
                                                    )
                                                  : Text("No Projects Found"),
                                          ProjectList.length > 9 &&
                                                  widget.lm == true &&
                                                  _moreProductsAvailable ==
                                                      true &&
                                                  _loadingProducts == false
                                              ? GradientButton(
                                                  title: "Load More",
                                                  onPressed: () {
                                                    if (widget.categoryTerm !=
                                                        "") {
                                                      getMoreCategoryProducts(
                                                          widget.categoryTerm);
                                                    } else if (widget
                                                            .yearTerm !=
                                                        "") {
                                                      getMoreYearProducts(
                                                          widget.yearTerm);
                                                    } else if (widget
                                                            .searchTerm ==
                                                        "") {
                                                      getMoreProducts();
                                                    } else {
                                                      //TODO: Get more products from algolia
                                                    }
                                                  },
                                                )
                                              : Center(),
                                        ],
                                      ),
                                    );
                                  }
                                  if (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.watch) {
                                    return Container(
                                      width: 250,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              widget.searchTerm == ""
                                                  ? Text(
                                                      "Showing 1–9 of 12 results",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    )
                                                  : Text(
                                                      'Showing 1–9 of "${widget.searchTerm}"',
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
                                              MenuButton<String>(
                                                child: normalChildButton,
                                                items: sortkeys,
                                                itemBuilder: (String value) =>
                                                    Container(
                                                  height: 40,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                toggledChild: Container(
                                                  child: normalChildButton,
                                                ),
                                                onItemSelected: (String value) {
                                                  setState(() {
                                                    selectedKey = value;
                                                  });
                                                },
                                                onMenuButtonToggle:
                                                    (bool isToggle) {
                                                  print(isToggle);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: ProjectList.length *
                                                445.toDouble(),
                                            child: GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: ProjectList.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 1,
                                                      mainAxisSpacing: 40,
                                                      childAspectRatio: 0.63,
                                                      crossAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return NoHoverProjectCard(
                                                    project:
                                                        ProjectList[index]);
                                              },
                                            ),
                                          ),
                                          ProjectList.length > 9 &&
                                                  widget.lm == true &&
                                                  _moreProductsAvailable ==
                                                      true &&
                                                  _loadingProducts == false
                                              ? GradientButton(
                                                  title: "Load More",
                                                  onPressed: () {
                                                    if (widget.categoryTerm !=
                                                        "") {
                                                      getMoreCategoryProducts(
                                                          widget.categoryTerm);
                                                    } else if (widget
                                                            .yearTerm !=
                                                        "") {
                                                      getMoreYearProducts(
                                                          widget.yearTerm);
                                                    } else if (widget
                                                            .searchTerm ==
                                                        "") {
                                                      getMoreProducts();
                                                    } else {
                                                      //TODO: Get more products from algolia
                                                    }
                                                  },
                                                )
                                              : Center(),
                                        ],
                                      ),
                                    );
                                  }

                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    width: 500,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            widget.searchTerm == ""
                                                ? Text(
                                                    "Showing 1–9 of 12 results",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  )
                                                : Text(
                                                    'Showing 1–9 of "${widget.searchTerm}"',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                            MenuButton<String>(
                                              child: normalChildButton,
                                              items: sortkeys,
                                              itemBuilder: (String value) =>
                                                  Container(
                                                height: 40,
                                                alignment: Alignment.centerLeft,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 16),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                              toggledChild: Container(
                                                child: normalChildButton,
                                              ),
                                              onItemSelected: (String value) {
                                                setState(() {
                                                  selectedKey = value;
                                                });
                                              },
                                              onMenuButtonToggle:
                                                  (bool isToggle) {
                                                print(isToggle);
                                              },
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          height: ProjectList.length *
                                              240.toDouble(),
                                          child: GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: ProjectList.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 40,
                                                    childAspectRatio: 0.63,
                                                    crossAxisSpacing: 20),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return NoHoverProjectCard(
                                                  project: ProjectList[index]);
                                            },
                                          ),
                                        ),
                                        ProjectList.length > 9 &&
                                                widget.lm == true &&
                                                _moreProductsAvailable ==
                                                    true &&
                                                _loadingProducts == false
                                            ? GradientButton(
                                                title: "Load More",
                                                onPressed: () {
                                                  if (widget.categoryTerm !=
                                                      "") {
                                                    getMoreCategoryProducts(
                                                        widget.categoryTerm);
                                                  } else if (widget.yearTerm !=
                                                      "") {
                                                    getMoreYearProducts(
                                                        widget.yearTerm);
                                                  } else if (widget
                                                          .searchTerm ==
                                                      "") {
                                                    getMoreProducts();
                                                  } else {
                                                    //TODO: Get more products from algolia
                                                  }
                                                },
                                              )
                                            : Center(),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.tablet) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  ResponsiveBuilder(
                                    breakpoints: ScreenBreakpoints(
                                        tablet: 700, desktop: 1140, watch: 541),
                                    builder: (context, sizingInformation) {
                                      // Check the sizing information here and return your UI
                                      if (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          width: 800,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  widget.searchTerm == ""
                                                      ? Text(
                                                          "Showing 1–9 of 12 results",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(
                                                          'Showing 1–9 of "${widget.searchTerm}"',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                  MenuButton<String>(
                                                    child: normalChildButton,
                                                    items: sortkeys,
                                                    itemBuilder:
                                                        (String value) =>
                                                            Container(
                                                      height: 40,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 16),
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                    toggledChild: Container(
                                                      child: normalChildButton,
                                                    ),
                                                    onItemSelected:
                                                        (String value) {
                                                      setState(() {
                                                        selectedKey = value;
                                                      });
                                                    },
                                                    onMenuButtonToggle:
                                                        (bool isToggle) {
                                                      print(isToggle);
                                                    },
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Container(
                                                height: ProjectList.length *
                                                    140.toDouble(),
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: ProjectList.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          mainAxisSpacing: 40,
                                                          childAspectRatio:
                                                              0.68,
                                                          crossAxisSpacing: 20),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return ProjectCard(
                                                        project:
                                                            ProjectList[index]);
                                                  },
                                                ),
                                              ),
                                              ProjectList.length > 9 &&
                                                      widget.lm == true &&
                                                      _moreProductsAvailable ==
                                                          true &&
                                                      _loadingProducts == false
                                                  ? GradientButton(
                                                      title: "Load More",
                                                      onPressed: () {
                                                        if (widget
                                                                .categoryTerm !=
                                                            "") {
                                                          getMoreCategoryProducts(
                                                              widget
                                                                  .categoryTerm);
                                                        } else if (widget
                                                                .yearTerm !=
                                                            "") {
                                                          getMoreYearProducts(
                                                              widget.yearTerm);
                                                        } else if (widget
                                                                .searchTerm ==
                                                            "") {
                                                          getMoreProducts();
                                                        } else {
                                                          //TODO: Get more products from algolia
                                                        }
                                                      },
                                                    )
                                                  : Center(),
                                            ],
                                          ),
                                        );
                                      }
                                      if (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.tablet) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          width: 660,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  widget.searchTerm == ""
                                                      ? Text(
                                                          "Showing 1–9 of 12 results",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(
                                                          'Showing 1–9 of "${widget.searchTerm}"',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                  MenuButton<String>(
                                                    child: normalChildButton,
                                                    items: sortkeys,
                                                    itemBuilder:
                                                        (String value) =>
                                                            Container(
                                                      height: 40,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 16),
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                    toggledChild: Container(
                                                      child: normalChildButton,
                                                    ),
                                                    onItemSelected:
                                                        (String value) {
                                                      setState(() {
                                                        selectedKey = value;
                                                      });
                                                    },
                                                    onMenuButtonToggle:
                                                        (bool isToggle) {
                                                      print(isToggle);
                                                    },
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Container(
                                                height: ProjectList.length *
                                                    180.toDouble(),
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: ProjectList.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          mainAxisSpacing: 40,
                                                          childAspectRatio:
                                                              0.63,
                                                          crossAxisSpacing: 20),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return NoHoverProjectCard(
                                                        project:
                                                            ProjectList[index]);
                                                  },
                                                ),
                                              ),
                                              ProjectList.length > 9 &&
                                                      widget.lm == true &&
                                                      _moreProductsAvailable ==
                                                          true &&
                                                      _loadingProducts == false
                                                  ? GradientButton(
                                                      title: "Load More",
                                                      onPressed: () {
                                                        if (widget
                                                                .categoryTerm !=
                                                            "") {
                                                          getMoreCategoryProducts(
                                                              widget
                                                                  .categoryTerm);
                                                        } else if (widget
                                                                .yearTerm !=
                                                            "") {
                                                          getMoreYearProducts(
                                                              widget.yearTerm);
                                                        } else if (widget
                                                                .searchTerm ==
                                                            "") {
                                                          getMoreProducts();
                                                        } else {
                                                          //TODO: Get more products from algolia
                                                        }
                                                      },
                                                    )
                                                  : Center(),
                                            ],
                                          ),
                                        );
                                      }
                                      if (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.watch) {
                                        return Container(
                                          width: 250,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  widget.searchTerm == ""
                                                      ? Text(
                                                          "Showing 1–9 of 12 results",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(
                                                          'Showing 1–9 of "${widget.searchTerm}"',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Metrisch-Medium",
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  MenuButton<String>(
                                                    child: normalChildButton,
                                                    items: sortkeys,
                                                    itemBuilder:
                                                        (String value) =>
                                                            Container(
                                                      height: 40,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 16),
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                    toggledChild: Container(
                                                      child: normalChildButton,
                                                    ),
                                                    onItemSelected:
                                                        (String value) {
                                                      setState(() {
                                                        selectedKey = value;
                                                      });
                                                    },
                                                    onMenuButtonToggle:
                                                        (bool isToggle) {
                                                      print(isToggle);
                                                    },
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height: ProjectList.length *
                                                    445.toDouble(),
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: ProjectList.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 1,
                                                          mainAxisSpacing: 40,
                                                          childAspectRatio:
                                                              0.63,
                                                          crossAxisSpacing: 20),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return NoHoverProjectCard(
                                                        project:
                                                            ProjectList[index]);
                                                  },
                                                ),
                                              ),
                                              ProjectList.length > 9 &&
                                                      widget.lm == true &&
                                                      _moreProductsAvailable ==
                                                          true &&
                                                      _loadingProducts == false
                                                  ? GradientButton(
                                                      title: "Load More",
                                                      onPressed: () {
                                                        if (widget
                                                                .categoryTerm !=
                                                            "") {
                                                          getMoreCategoryProducts(
                                                              widget
                                                                  .categoryTerm);
                                                        } else if (widget
                                                                .yearTerm !=
                                                            "") {
                                                          getMoreYearProducts(
                                                              widget.yearTerm);
                                                        } else if (widget
                                                                .searchTerm ==
                                                            "") {
                                                          getMoreProducts();
                                                        } else {
                                                          //TODO: Get more products from algolia
                                                        }
                                                      },
                                                    )
                                                  : Center(),
                                            ],
                                          ),
                                        );
                                      }

                                      return Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: 500,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                widget.searchTerm == ""
                                                    ? Text(
                                                        "Showing 1–9 of 12 results",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      )
                                                    : Text(
                                                        'Showing 1–9 of "${widget.searchTerm}"',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                MenuButton<String>(
                                                  child: normalChildButton,
                                                  items: sortkeys,
                                                  itemBuilder: (String value) =>
                                                      Container(
                                                    height: 40,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 16),
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  toggledChild: Container(
                                                    child: normalChildButton,
                                                  ),
                                                  onItemSelected:
                                                      (String value) {
                                                    setState(() {
                                                      selectedKey = value;
                                                    });
                                                  },
                                                  onMenuButtonToggle:
                                                      (bool isToggle) {
                                                    print(isToggle);
                                                  },
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                              height: ProjectList.length *
                                                  240.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: ProjectList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.63,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NoHoverProjectCard(
                                                      project:
                                                          ProjectList[index]);
                                                },
                                              ),
                                            ),
                                            ProjectList.length > 9 &&
                                                    widget.lm == true &&
                                                    _moreProductsAvailable ==
                                                        true &&
                                                    _loadingProducts == false
                                                ? GradientButton(
                                                    title: "Load More",
                                                    onPressed: () {
                                                      if (widget.categoryTerm !=
                                                          "") {
                                                        getMoreCategoryProducts(
                                                            widget
                                                                .categoryTerm);
                                                      } else if (widget
                                                              .yearTerm !=
                                                          "") {
                                                        getMoreYearProducts(
                                                            widget.yearTerm);
                                                      } else if (widget
                                                              .searchTerm ==
                                                          "") {
                                                        getMoreProducts();
                                                      } else {
                                                        //TODO: Get more products from algolia
                                                      }
                                                    },
                                                  )
                                                : Center(),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 80,
                                  ),
                                  ResponsiveBuilder(
                                    breakpoints: ScreenBreakpoints(
                                        tablet: 971, desktop: 1140, watch: 300),
                                    builder: (context, sizingInformation) {
                                      // Check the sizing information here and return your UI
                                      if (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop) {
                                        return Container(
                                          width: 250,
                                          child: Column(
                                            children: [
                                              Container(
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
                                                    searchedvalue = value;
                                                    //Do something with the user input.
                                                  },
                                                  decoration: InputDecoration(
                                                    suffixIcon: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            searched = true;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.search,
                                                          size: 22,
                                                          color: Colors.black,
                                                        )),

                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),

                                                    hintText: 'Search Project',
                                                    // contentPadding:
                                                    // EdgeInsets.symmetric(horizontal: 20.0),
                                                    // border: OutlineInputBorder(
                                                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    // ),
                                                  ),
                                                  onSubmitted: (query) {
                                                    setState(() {
                                                      searched = true;
                                                      searchedvalue = query;
                                                      _searchalgolia(query);
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 20,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Categories",
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: Colors.black87,
                                                    fontFamily:
                                                        "Metrisch-Bold"),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height: catheight,
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      categoriesname.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        CategoriesButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              searched = true;
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => ProjectGallery(
                                                                            categoriesname:
                                                                                categoriesname,
                                                                            categoryTerm:
                                                                                categoriesname[index]["name"],
                                                                          )));
                                                            });
                                                          },
                                                          categoryName:
                                                              categoriesname[
                                                                      index]
                                                                  ["name"],
                                                          categoryQuantity:
                                                              categoriesname[
                                                                      index]
                                                                  ["number"],
                                                        ),
                                                        Divider(
                                                          color: Colors.black12,
                                                          thickness: 1,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 40,
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.center,
                                              //   children: [
                                              //     Container(
                                              //       decoration: BoxDecoration(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5),
                                              //         color: Colors
                                              //             .orange.shade400,
                                              //       ),
                                              //       width: 5,
                                              //       height: 3,
                                              //     ),
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Container(
                                              //       decoration: BoxDecoration(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5),
                                              //         color: Colors
                                              //             .orange.shade400,
                                              //       ),
                                              //       width: 20,
                                              //       height: 3,
                                              //     ),
                                              //     // SizedBox(
                                              //     //   width: 10,
                                              //     // ),
                                              //     // Container(
                                              //     //   decoration: BoxDecoration(
                                              //     //     borderRadius:
                                              //     //         BorderRadius.circular(
                                              //     //             5),
                                              //     //     color: Colors
                                              //     //         .orange.shade400,
                                              //     //   ),
                                              //     //   width: 5,
                                              //     //   height: 3,
                                              //     // )
                                              //   ],
                                              // ),
                                              // SizedBox(
                                              //   height: 15,
                                              // ),
                                              // Text(
                                              //   "Most Viewed Projects",
                                              //   style: TextStyle(
                                              //       fontSize: 21,
                                              //       color: Colors.black87,
                                              //       fontFamily:
                                              //           "Metrisch-Bold"),
                                              // ),
                                              // SizedBox(
                                              //   height: 20,
                                              // ),
                                              // Container(
                                              //   height: 300,
                                              //   child: ListView.builder(
                                              //     physics:
                                              //         NeverScrollableScrollPhysics(),
                                              //     shrinkWrap: true,
                                              //     itemCount: 3,
                                              //     itemBuilder:
                                              //         (context, index) {
                                              //       return TopProjects(
                                              //         projectName:
                                              //             "Computer Vision using Deep Learning and Machine Learning",
                                              //         madeBy: "Aryan Solanki",
                                              //       );
                                              //     },
                                              //   ),
                                              // ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 20,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Batch Wise Projects",
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: Colors.black87,
                                                    fontFamily:
                                                        "Metrisch-Bold"),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              BatchWiseProjects(
                                                categoriesname: categoriesname,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      if (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.tablet) {
                                        return Container(
                                          width: 220,
                                          child: Column(
                                            children: [
                                              Container(
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
                                                  onSubmitted: (query) {
                                                    setState(() {
                                                      searched = true;
                                                      searchedvalue = query;
                                                    });
                                                  },
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                  onChanged: (value) {
                                                    searchedvalue = value;
                                                    //Do something with the user input.
                                                  },
                                                  decoration: InputDecoration(
                                                    suffixIcon: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          searched = true;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.search,
                                                        size: 22,
                                                        color: Colors.black,
                                                      ),
                                                    ),

                                                    border: InputBorder.none,

                                                    hintStyle: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                    hintText: 'Search Project',
                                                    // contentPadding:
                                                    // EdgeInsets.symmetric(horizontal: 20.0),
                                                    // border: OutlineInputBorder(
                                                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                    // ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 20,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Categories",
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: Colors.black87,
                                                    fontFamily:
                                                        "Metrisch-Bold"),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height: catheight,
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      categoriesname.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        CategoriesButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              searched = true;
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => ProjectGallery(
                                                                            categoriesname:
                                                                                categoriesname,
                                                                            categoryTerm:
                                                                                categoriesname[index]["name"],
                                                                          )));
                                                            });
                                                          },
                                                          categoryName:
                                                              categoriesname[
                                                                      index]
                                                                  ["name"],
                                                          categoryQuantity:
                                                              categoriesname[
                                                                      index]
                                                                  ["number"],
                                                        ),
                                                        Divider(
                                                          color: Colors.black12,
                                                          thickness: 1,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 40,
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.center,
                                              //   children: [
                                              //     Container(
                                              //       decoration: BoxDecoration(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5),
                                              //         color: Colors
                                              //             .orange.shade400,
                                              //       ),
                                              //       width: 5,
                                              //       height: 3,
                                              //     ),
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Container(
                                              //       decoration: BoxDecoration(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5),
                                              //         color: Colors
                                              //             .orange.shade400,
                                              //       ),
                                              //       width: 20,
                                              //       height: 3,
                                              //     ),
                                              //     // SizedBox(
                                              //     //   width: 10,
                                              //     // ),
                                              //     // Container(
                                              //     //   decoration: BoxDecoration(
                                              //     //     borderRadius:
                                              //     //         BorderRadius.circular(
                                              //     //             5),
                                              //     //     color: Colors
                                              //     //         .orange.shade400,
                                              //     //   ),
                                              //     //   width: 5,
                                              //     //   height: 3,
                                              //     // )
                                              //   ],
                                              // ),
                                              // SizedBox(
                                              //   height: 15,
                                              // ),
                                              // Text(
                                              //   "Most Viewed Projects",
                                              //   style: TextStyle(
                                              //       fontSize: 21,
                                              //       color: Colors.black87,
                                              //       fontFamily:
                                              //           "Metrisch-Bold"),
                                              // ),
                                              // SizedBox(
                                              //   height: 20,
                                              // ),
                                              // Container(
                                              //   height: 300,
                                              //   child: ListView.builder(
                                              //     physics:
                                              //         NeverScrollableScrollPhysics(),
                                              //     shrinkWrap: true,
                                              //     itemCount: 3,
                                              //     itemBuilder:
                                              //         (context, index) {
                                              //       return TopProjects(
                                              //         projectName:
                                              //             "Computer Vision using Deep Learning and Machine Learning",
                                              //         madeBy: "Aryan Solanki",
                                              //       );
                                              //     },
                                              //   ),
                                              // ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 20,
                                                    height: 3,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors
                                                          .orange.shade400,
                                                    ),
                                                    width: 5,
                                                    height: 3,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Batch Wise Projects",
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: Colors.black87,
                                                    fontFamily:
                                                        "Metrisch-Bold"),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              BatchWiseProjects(
                                                categoriesname: categoriesname,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Color(0xfff3f5fe)),
                                              height: 45,
                                              child: TextField(
                                                onSubmitted: (query) {
                                                  setState(() {
                                                    searched = true;
                                                    searchedvalue = query;
                                                  });
                                                },
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                onChanged: (value) {
                                                  searchedvalue = value;
                                                  //Do something with the user input.
                                                },
                                                decoration: InputDecoration(
                                                  suffixIcon: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        searched = true;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.search,
                                                      size: 22,
                                                      color: Colors.black,
                                                    ),
                                                  ),

                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                  hintText: 'Search Project',
                                                  // contentPadding:
                                                  // EdgeInsets.symmetric(horizontal: 20.0),
                                                  // border: OutlineInputBorder(
                                                  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  // ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 20,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Categories",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: catheight,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    categoriesname.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CategoriesButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            searched = true;
                                                            Navigator
                                                                .pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ProjectGallery(
                                                                              categoriesname: categoriesname,
                                                                              categoryTerm: categoriesname[index]["name"],
                                                                            )));
                                                          });
                                                        },
                                                        categoryName:
                                                            categoriesname[
                                                                index]["name"],
                                                        categoryQuantity:
                                                            categoriesname[
                                                                    index]
                                                                ["number"],
                                                      ),
                                                      Divider(
                                                        color: Colors.black12,
                                                        thickness: 1,
                                                      )
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 40,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: [
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5),
                                            //         color:
                                            //             Colors.orange.shade400,
                                            //       ),
                                            //       width: 5,
                                            //       height: 3,
                                            //     ),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5),
                                            //         color:
                                            //             Colors.orange.shade400,
                                            //       ),
                                            //       width: 20,
                                            //       height: 3,
                                            //     ),
                                            //     // SizedBox(
                                            //     //   width: 10,
                                            //     // ),
                                            //     // Container(
                                            //     //   decoration: BoxDecoration(
                                            //     //     borderRadius:
                                            //     //         BorderRadius.circular(
                                            //     //             5),
                                            //     //     color:
                                            //     //         Colors.orange.shade400,
                                            //     //   ),
                                            //     //   width: 5,
                                            //     //   height: 3,
                                            //     // )
                                            //   ],
                                            // ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            // Text(
                                            //   "Most Viewed Projects",
                                            //   style: TextStyle(
                                            //       fontSize: 21,
                                            //       color: Colors.black87,
                                            //       fontFamily: "Metrisch-Bold"),
                                            // ),
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            // Container(
                                            //   height: 300,
                                            //   child: ListView.builder(
                                            //     physics:
                                            //         NeverScrollableScrollPhysics(),
                                            //     shrinkWrap: true,
                                            //     itemCount: 3,
                                            //     itemBuilder: (context, index) {
                                            //       return TopProjects(
                                            //         projectName:
                                            //             "Computer Vision using Deep Learning and Machine Learning",
                                            //         madeBy: "Aryan Solanki",
                                            //       );
                                            //     },
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 20,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Batch Wise Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            BatchWiseProjects(
                                              categoriesname: categoriesname,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                ResponsiveBuilder(
                                  breakpoints: ScreenBreakpoints(
                                      tablet: 700, desktop: 1140, watch: 541),
                                  builder: (context, sizingInformation) {
                                    // Check the sizing information here and return your UI
                                    if (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.desktop) {
                                      return Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: 800,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                widget.searchTerm == ""
                                                    ? Text(
                                                        "Showing 1–9 of 12 results",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      )
                                                    : Text(
                                                        'Showing 1–9 of "${widget.searchTerm}"',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                MenuButton<String>(
                                                  child: normalChildButton,
                                                  items: sortkeys,
                                                  itemBuilder: (String value) =>
                                                      Container(
                                                    height: 40,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 16),
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  toggledChild: Container(
                                                    child: normalChildButton,
                                                  ),
                                                  onItemSelected:
                                                      (String value) {
                                                    setState(() {
                                                      selectedKey = value;
                                                    });
                                                  },
                                                  onMenuButtonToggle:
                                                      (bool isToggle) {
                                                    print(isToggle);
                                                  },
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                              height: ProjectList.length *
                                                  140.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: ProjectList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.68,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ProjectCard(
                                                      project:
                                                          ProjectList[index]);
                                                },
                                              ),
                                            ),
                                            ProjectList.length > 9 &&
                                                    widget.lm == true &&
                                                    _moreProductsAvailable ==
                                                        true &&
                                                    _loadingProducts == false
                                                ? GradientButton(
                                                    title: "Load More",
                                                    onPressed: () {
                                                      if (widget.categoryTerm !=
                                                          "") {
                                                        getMoreCategoryProducts(
                                                            widget
                                                                .categoryTerm);
                                                      } else if (widget
                                                              .yearTerm !=
                                                          "") {
                                                        getMoreYearProducts(
                                                            widget.yearTerm);
                                                      } else if (widget
                                                              .searchTerm ==
                                                          "") {
                                                        getMoreProducts();
                                                      } else {
                                                        //TODO: Get more products from algolia
                                                      }
                                                    },
                                                  )
                                                : Center(),
                                          ],
                                        ),
                                      );
                                    }
                                    if (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet) {
                                      return Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: 660,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                widget.searchTerm == ""
                                                    ? Text(
                                                        "Showing 1–9 of 12 results",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      )
                                                    : Text(
                                                        'Showing 1–9 of "${widget.searchTerm}"',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                MenuButton<String>(
                                                  child: normalChildButton,
                                                  items: sortkeys,
                                                  itemBuilder: (String value) =>
                                                      Container(
                                                    height: 40,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 16),
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  toggledChild: Container(
                                                    child: normalChildButton,
                                                  ),
                                                  onItemSelected:
                                                      (String value) {
                                                    setState(() {
                                                      selectedKey = value;
                                                    });
                                                  },
                                                  onMenuButtonToggle:
                                                      (bool isToggle) {
                                                    print(isToggle);
                                                  },
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                              height: ProjectList.length *
                                                  180.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: ProjectList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.63,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NoHoverProjectCard(
                                                      project:
                                                          ProjectList[index]);
                                                },
                                              ),
                                            ),
                                            ProjectList.length > 9 &&
                                                    widget.lm == true &&
                                                    _moreProductsAvailable ==
                                                        true &&
                                                    _loadingProducts == false
                                                ? GradientButton(
                                                    title: "Load More",
                                                    onPressed: () {
                                                      if (widget.categoryTerm !=
                                                          "") {
                                                        getMoreCategoryProducts(
                                                            widget
                                                                .categoryTerm);
                                                      } else if (widget
                                                              .yearTerm !=
                                                          "") {
                                                        getMoreYearProducts(
                                                            widget.yearTerm);
                                                      } else if (widget
                                                              .searchTerm ==
                                                          "") {
                                                        getMoreProducts();
                                                      } else {
                                                        //TODO: Get more products from algolia
                                                      }
                                                    },
                                                  )
                                                : Center(),
                                          ],
                                        ),
                                      );
                                    }
                                    if (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.watch) {
                                      return Container(
                                        width: 250,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                widget.searchTerm == ""
                                                    ? Text(
                                                        "Showing 1–9 of 12 results",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Metrisch-Medium",
                                                            height: 1.5,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                      )
                                                    : Text(
                                                        'Showing 1–9 of "${widget.searchTerm}"',
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
                                                MenuButton<String>(
                                                  child: normalChildButton,
                                                  items: sortkeys,
                                                  itemBuilder: (String value) =>
                                                      Container(
                                                    height: 40,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 0.0,
                                                        horizontal: 16),
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  toggledChild: Container(
                                                    child: normalChildButton,
                                                  ),
                                                  onItemSelected:
                                                      (String value) {
                                                    setState(() {
                                                      selectedKey = value;
                                                    });
                                                  },
                                                  onMenuButtonToggle:
                                                      (bool isToggle) {
                                                    print(isToggle);
                                                  },
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: ProjectList.length *
                                                  445.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: ProjectList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 1,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.63,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NoHoverProjectCard(
                                                      project:
                                                          ProjectList[index]);
                                                },
                                              ),
                                            ),
                                            ProjectList.length > 9 &&
                                                    widget.lm == true &&
                                                    _moreProductsAvailable ==
                                                        true &&
                                                    _loadingProducts == false
                                                ? GradientButton(
                                                    title: "Load More",
                                                    onPressed: () {
                                                      if (widget.categoryTerm !=
                                                          "") {
                                                        getMoreCategoryProducts(
                                                            widget
                                                                .categoryTerm);
                                                      } else if (widget
                                                              .yearTerm !=
                                                          "") {
                                                        getMoreYearProducts(
                                                            widget.yearTerm);
                                                      } else if (widget
                                                              .searchTerm ==
                                                          "") {
                                                        getMoreProducts();
                                                      } else {
                                                        //TODO: Get more products from algolia
                                                      }
                                                    },
                                                  )
                                                : Center(),
                                          ],
                                        ),
                                      );
                                    }

                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      width: 500,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              widget.searchTerm == ""
                                                  ? Text(
                                                      "Showing 1–9 of 12 results",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    )
                                                  : Text(
                                                      'Showing 1–9 of "${widget.searchTerm}"',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Metrisch-Medium",
                                                          height: 1.5,
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                              MenuButton<String>(
                                                child: normalChildButton,
                                                items: sortkeys,
                                                itemBuilder: (String value) =>
                                                    Container(
                                                  height: 40,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                toggledChild: Container(
                                                  child: normalChildButton,
                                                ),
                                                onItemSelected: (String value) {
                                                  setState(() {
                                                    selectedKey = value;
                                                  });
                                                },
                                                onMenuButtonToggle:
                                                    (bool isToggle) {
                                                  print(isToggle);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Container(
                                            height: ProjectList.length *
                                                240.toDouble(),
                                            child: GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: ProjectList.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 40,
                                                      childAspectRatio: 0.63,
                                                      crossAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return NoHoverProjectCard(
                                                    project:
                                                        ProjectList[index]);
                                              },
                                            ),
                                          ),
                                          ProjectList.length > 9 &&
                                                  widget.lm == true &&
                                                  _moreProductsAvailable ==
                                                      true &&
                                                  _loadingProducts == false
                                              ? GradientButton(
                                                  title: "Load More",
                                                  onPressed: () {
                                                    if (widget.categoryTerm !=
                                                        "") {
                                                      getMoreCategoryProducts(
                                                          widget.categoryTerm);
                                                    } else if (widget
                                                            .yearTerm !=
                                                        "") {
                                                      getMoreYearProducts(
                                                          widget.yearTerm);
                                                    } else if (widget
                                                            .searchTerm ==
                                                        "") {
                                                      getMoreProducts();
                                                    } else {
                                                      //TODO: Get more products from algolia
                                                    }
                                                  },
                                                )
                                              : Center(),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                ResponsiveBuilder(
                                  breakpoints: ScreenBreakpoints(
                                      tablet: 971, desktop: 1140, watch: 300),
                                  builder: (context, sizingInformation) {
                                    // Check the sizing information here and return your UI
                                    if (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.desktop) {
                                      return Container(
                                        width: 250,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
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
                                                  searchedvalue = value;
                                                  //Do something with the user input.
                                                },
                                                decoration: InputDecoration(
                                                  suffixIcon: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          searched = true;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.search,
                                                        size: 22,
                                                        color: Colors.black,
                                                      )),

                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),

                                                  hintText: 'Search Project',
                                                  // contentPadding:
                                                  // EdgeInsets.symmetric(horizontal: 20.0),
                                                  // border: OutlineInputBorder(
                                                  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  // ),
                                                ),
                                                onSubmitted: (query) {
                                                  setState(() {
                                                    searched = true;
                                                    searchedvalue = query;
                                                    _searchalgolia(query);
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 20,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Categories",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: catheight,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    categoriesname.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CategoriesButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            searched = true;
                                                            Navigator
                                                                .pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ProjectGallery(
                                                                              categoriesname: categoriesname,
                                                                              categoryTerm: categoriesname[index]["name"],
                                                                            )));
                                                          });
                                                        },
                                                        categoryName:
                                                            categoriesname[
                                                                index]["name"],
                                                        categoryQuantity:
                                                            categoriesname[
                                                                    index]
                                                                ["number"],
                                                      ),
                                                      Divider(
                                                        color: Colors.black12,
                                                        thickness: 1,
                                                      )
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 40,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: [
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5),
                                            //         color:
                                            //             Colors.orange.shade400,
                                            //       ),
                                            //       width: 5,
                                            //       height: 3,
                                            //     ),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5),
                                            //         color:
                                            //             Colors.orange.shade400,
                                            //       ),
                                            //       width: 20,
                                            //       height: 3,
                                            //     ),
                                            //     // SizedBox(
                                            //     //   width: 10,
                                            //     // ),
                                            //     // Container(
                                            //     //   decoration: BoxDecoration(
                                            //     //     borderRadius:
                                            //     //         BorderRadius.circular(
                                            //     //             5),
                                            //     //     color:
                                            //     //         Colors.orange.shade400,
                                            //     //   ),
                                            //     //   width: 5,
                                            //     //   height: 3,
                                            //     // )
                                            //   ],
                                            // ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            // Text(
                                            //   "Most Viewed Projects",
                                            //   style: TextStyle(
                                            //       fontSize: 21,
                                            //       color: Colors.black87,
                                            //       fontFamily: "Metrisch-Bold"),
                                            // ),
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            // Container(
                                            //   height: 300,
                                            //   child: ListView.builder(
                                            //     physics:
                                            //         NeverScrollableScrollPhysics(),
                                            //     shrinkWrap: true,
                                            //     itemCount: 3,
                                            //     itemBuilder: (context, index) {
                                            //       return TopProjects(
                                            //         projectName:
                                            //             "Computer Vision using Deep Learning and Machine Learning",
                                            //         madeBy: "Aryan Solanki",
                                            //       );
                                            //     },
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 20,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Batch Wise Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            BatchWiseProjects(
                                              categoriesname: categoriesname,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    if (sizingInformation.deviceScreenType ==
                                        DeviceScreenType.tablet) {
                                      return Container(
                                        width: 220,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Color(0xfff3f5fe)),
                                              height: 45,
                                              child: TextField(
                                                onSubmitted: (query) {
                                                  setState(() {
                                                    searched = true;
                                                    searchedvalue = query;
                                                  });
                                                },
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                onChanged: (value) {
                                                  searchedvalue = value;
                                                  //Do something with the user input.
                                                },
                                                decoration: InputDecoration(
                                                  suffixIcon: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        searched = true;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.search,
                                                      size: 22,
                                                      color: Colors.black,
                                                    ),
                                                  ),

                                                  border: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      fontFamily:
                                                          "Metrisch-Medium",
                                                      height: 1.5,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                  hintText: 'Search Project',
                                                  // contentPadding:
                                                  // EdgeInsets.symmetric(horizontal: 20.0),
                                                  // border: OutlineInputBorder(
                                                  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  // ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 20,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Categories",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: catheight,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    categoriesname.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CategoriesButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            searched = true;
                                                            Navigator
                                                                .pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ProjectGallery(
                                                                              categoriesname: categoriesname,
                                                                              categoryTerm: categoriesname[index]["name"],
                                                                            )));
                                                          });
                                                        },
                                                        categoryName:
                                                            categoriesname[
                                                                index]["name"],
                                                        categoryQuantity:
                                                            categoriesname[
                                                                    index]
                                                                ["number"],
                                                      ),
                                                      Divider(
                                                        color: Colors.black12,
                                                        thickness: 1,
                                                      )
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 40,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: [
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5),
                                            //         color:
                                            //             Colors.orange.shade400,
                                            //       ),
                                            //       width: 5,
                                            //       height: 3,
                                            //     ),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5),
                                            //         color:
                                            //             Colors.orange.shade400,
                                            //       ),
                                            //       width: 20,
                                            //       height: 3,
                                            //     ),
                                            //     // SizedBox(
                                            //     //   width: 10,
                                            //     // ),
                                            //     // Container(
                                            //     //   decoration: BoxDecoration(
                                            //     //     borderRadius:
                                            //     //         BorderRadius.circular(
                                            //     //             5),
                                            //     //     color:
                                            //     //         Colors.orange.shade400,
                                            //     //   ),
                                            //     //   width: 5,
                                            //     //   height: 3,
                                            //     // )
                                            //   ],
                                            // ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            // Text(
                                            //   "Most Viewed Projects",
                                            //   style: TextStyle(
                                            //       fontSize: 21,
                                            //       color: Colors.black87,
                                            //       fontFamily: "Metrisch-Bold"),
                                            // ),
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            // Container(
                                            //   height: 300,
                                            //   child: ListView.builder(
                                            //     physics:
                                            //         NeverScrollableScrollPhysics(),
                                            //     shrinkWrap: true,
                                            //     itemCount: 3,
                                            //     itemBuilder: (context, index) {
                                            //       return TopProjects(
                                            //         projectName:
                                            //             "Computer Vision using Deep Learning and Machine Learning",
                                            //         madeBy: "Aryan Solanki",
                                            //       );
                                            //     },
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 20,
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        Colors.orange.shade400,
                                                  ),
                                                  width: 5,
                                                  height: 3,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Batch Wise Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            BatchWiseProjects(
                                              categoriesname: categoriesname,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    return Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                color: Color(0xfff3f5fe)),
                                            height: 45,
                                            child: TextField(
                                              onSubmitted: (query) {
                                                setState(() {
                                                  searched = true;
                                                  searchedvalue = query;
                                                });
                                              },
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              onChanged: (value) {
                                                searchedvalue = value;
                                                //Do something with the user input.
                                              },
                                              decoration: InputDecoration(
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      searched = true;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.search,
                                                    size: 22,
                                                    color: Colors.black,
                                                  ),
                                                ),

                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    fontFamily:
                                                        "Metrisch-Medium",
                                                    height: 1.5,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                hintText: 'Search Project',
                                                // contentPadding:
                                                // EdgeInsets.symmetric(horizontal: 20.0),
                                                // border: OutlineInputBorder(
                                                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                // ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
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
                                                width: 5,
                                                height: 3,
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
                                                width: 20,
                                                height: 3,
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
                                                width: 5,
                                                height: 3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Categories",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: catheight,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: categoriesname.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    CategoriesButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          searched = true;
                                                          Navigator
                                                              .pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ProjectGallery(
                                                                            categoriesname:
                                                                                categoriesname,
                                                                            categoryTerm:
                                                                                categoriesname[index]["name"],
                                                                          )));
                                                        });
                                                      },
                                                      categoryName:
                                                          categoriesname[index]
                                                              ["name"],
                                                      categoryQuantity:
                                                          categoriesname[index]
                                                              ["number"],
                                                    ),
                                                    Divider(
                                                      color: Colors.black12,
                                                      thickness: 1,
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 40,
                                          // ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Container(
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: Colors.orange.shade400,
                                          //       ),
                                          //       width: 5,
                                          //       height: 3,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Container(
                                          //       decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         color: Colors.orange.shade400,
                                          //       ),
                                          //       width: 20,
                                          //       height: 3,
                                          //     ),
                                          //     // SizedBox(
                                          //     //   width: 10,
                                          //     // ),
                                          //     // Container(
                                          //     //   decoration: BoxDecoration(
                                          //     //     borderRadius:
                                          //     //         BorderRadius.circular(5),
                                          //     //     color: Colors.orange.shade400,
                                          //     //   ),
                                          //     //   width: 5,
                                          //     //   height: 3,
                                          //     // )
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   height: 15,
                                          // ),
                                          // Text(
                                          //   "Most Viewed Projects",
                                          //   style: TextStyle(
                                          //       fontSize: 21,
                                          //       color: Colors.black87,
                                          //       fontFamily: "Metrisch-Bold"),
                                          // ),
                                          // SizedBox(
                                          //   height: 20,
                                          // ),
                                          // Container(
                                          //   height: 300,
                                          //   child: ListView.builder(
                                          //     physics:
                                          //         NeverScrollableScrollPhysics(),
                                          //     shrinkWrap: true,
                                          //     itemCount: 3,
                                          //     itemBuilder: (context, index) {
                                          //       return TopProjects(
                                          //         projectName:
                                          //             "Computer Vision using Deep Learning and Machine Learning",
                                          //         madeBy: "Aryan Solanki",
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 40,
                                          ),
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
                                                width: 5,
                                                height: 3,
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
                                                width: 20,
                                                height: 3,
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
                                                width: 5,
                                                height: 3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Batch Wise Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BatchWiseProjects(
                                            categoriesname: categoriesname,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Footer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
