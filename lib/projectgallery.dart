import 'package:algolia/algolia.dart';
import 'package:bennettprojectgallery/HomePageElements/Footer.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:bennettprojectgallery/services/algoliaService.dart';
import 'package:bennettprojectgallery/services/project_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'HomePageElements/GradientButton.dart';
import 'ProjectGalleryElements/NoHoverProjectCard.dart';
import 'ProjectGalleryElements/ProjectCard.dart';
import 'ProjectGalleryElements/RightSide.dart';
import 'ProjectGalleryElements/batchwiseprojects.dart';
import 'ProjectGalleryElements/categoriesButton.dart';
import 'ProjectGalleryElements/topprojects.dart';

class ProjectGallery extends StatefulWidget {
  final List<dynamic> categoriesname;
  ProjectGallery({this.categoriesname});
  @override
  _ProjectGalleryState createState() =>
      _ProjectGalleryState(categoriesname: categoriesname);
}

class _ProjectGalleryState extends State<ProjectGallery> {
  AlgoliaQuery algoliaQuery;
  Algolia algolia;

  final List<dynamic> categoriesname;
  _ProjectGalleryState({this.categoriesname});

  List<AlgoliaObjectSnapshot> _results = [];
  void algo(String val) async {
    AlgoliaQuery query =
        algolia.instance.index("project").query(val).setHitsPerPage(9);
    AlgoliaQuerySnapshot snap = await query.getObjects();
    _results = snap.hits;
    setState(() {
      print(snap.nbHits);
      print(snap.hits);
    });
  }

  @override
  void initState() {
    algolia = Application.algolia;
    super.initState();
  }

  String searchedvalue = "";
  List<String> keys = <String>[
    'Default sorting',
    'Sort by popularity',
    'Sort by rating',
    'Sort by latest',
  ];

  int cardnumber = 9;

  bool searched = false;
  @override
  Widget build(BuildContext context) {
    double catheight = (30 * categoriesname.length) as double;

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
                          tablet: 550, desktop: 971, watch: 300),
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
                                                algo(query);
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
                                                    // Container(
                                                    //   child: TextButton(
                                                    //     onHover: (x) {
                                                    //       if (x) {
                                                    //         setState(() {
                                                    //           hover = true;
                                                    //         });
                                                    //       } else {
                                                    //         setState(() {
                                                    //           hover = false;
                                                    //         });
                                                    //       }
                                                    //     },
                                                    //     style: TextButton.styleFrom(
                                                    //       backgroundColor: Colors.transparent,
                                                    //       primary: Colors.white,
                                                    //       padding: EdgeInsets.all(0.0),
                                                    //     ),
                                                    //     onPressed: () {
                                                    //       setState(() {
                                                    //         print(categoriesname[index]);
                                                    //         searched=true;
                                                    //         searchedvalue=categoriesname[index];
                                                    //       });
                                                    //
                                                    //     },
                                                    //     child: Row(
                                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    //       children: [
                                                    //         Text(
                                                    //           "widget.categoryName",
                                                    //           style: TextStyle(
                                                    //               fontSize: 15,
                                                    //               color: hover == true ? Colors.green : Colors.black87,
                                                    //               fontFamily: "Metrisch-Bold"),
                                                    //         ),
                                                    //         AnimatedContainer(
                                                    //           duration: Duration(milliseconds: 300),
                                                    //           width: 35,
                                                    //           height: 25,
                                                    //           decoration: BoxDecoration(
                                                    //             border: Border.all(
                                                    //                 color: hover == true ? Color(0xff3224e9) : Colors.white),
                                                    //             borderRadius: BorderRadius.circular(5),
                                                    //             color: hover == true ? Colors.white : Color(0xff3224e9),
                                                    //           ),
                                                    //           child: Center(
                                                    //             child: Text(
                                                    //               213.toString(),
                                                    //               style: TextStyle(
                                                    //                   fontSize: 13,
                                                    //                   color: hover == true ? Color(0xff3224e9) : Colors.white),
                                                    //             ),
                                                    //           ),
                                                    //         )
                                                    //       ],
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    CategoriesButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          searched=true;
                                                          searchedvalue=categoriesname[index];
                                                        });
                                                      },
                                                      categoryName: categoriesname[index],
                                                      categoryQuantity: 213,
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
                                            "Most Viewed Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 300,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                return TopProjects(
                                                  projectName:
                                                      "Computer Vision using Deep Learning and Machine Learning",
                                                  madeBy: "Aryan Solanki",
                                                );
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
                                            "Batch Wise Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BatchWiseProjects(),
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
                                            height: 180,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    CategoriesButton(
                                                      categoryName:
                                                          categoriesname[index],
                                                      categoryQuantity: 213,
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
                                            "Most Viewed Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 300,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                return TopProjects(
                                                  projectName:
                                                      "Computer Vision using Deep Learning and Machine Learning",
                                                  madeBy: "Aryan Solanki",
                                                );
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
                                            "Batch Wise Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BatchWiseProjects(),
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
                                              //Do something with the user input.
                                            },
                                            onSubmitted: (value) {},
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
                                          height: 180,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  CategoriesButton(
                                                    categoryName: "PYTHON",
                                                    categoryQuantity: 213,
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
                                          "Most Viewed Projects",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.black87,
                                              fontFamily: "Metrisch-Bold"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 300,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return TopProjects(
                                                projectName:
                                                    "Computer Vision using Deep Learning and Machine Learning",
                                                madeBy: "Aryan Solanki",
                                              );
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
                                          "Batch Wise Projects",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.black87,
                                              fontFamily: "Metrisch-Bold"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        BatchWiseProjects(),
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
                                              searched == false
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
                                                      'Showing 1–9 of "${searchedvalue}"',
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
                                                items: keys,
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
                                            height: cardnumber * 140.toDouble(),
                                            child: GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: cardnumber,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 40,
                                                      childAspectRatio: 0.68,
                                                      crossAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ProjectCard();
                                              },
                                            ),
                                          ),
                                          GradientButton(
                                            title: "Load More",
                                          ),
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
                                              searched == false
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
                                                      'Showing 1–9 of "${searchedvalue}"',
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
                                                items: keys,
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
                                            height: cardnumber * 130.toDouble(),
                                            child: GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: cardnumber,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 40,
                                                      childAspectRatio: 0.63,
                                                      crossAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return NoHoverProjectCard();
                                              },
                                            ),
                                          ),
                                          GradientButton(
                                            title: "Load More",
                                          ),
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
                                              searched == false
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
                                                      'Showing 1–9 of "${searchedvalue}"',
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
                                                items: keys,
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
                                            height: cardnumber * 445.toDouble(),
                                            child: GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: cardnumber,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 1,
                                                      mainAxisSpacing: 40,
                                                      childAspectRatio: 0.63,
                                                      crossAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return NoHoverProjectCard();
                                              },
                                            ),
                                          ),
                                          GradientButton(
                                            title: "Load More",
                                          ),
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
                                            searched == false
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
                                                    'Showing 1–9 of "${searchedvalue}"',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Metrisch-Medium",
                                                        height: 1.5,
                                                        fontSize: 15,
                                                        color: Colors.black54),
                                                  ),
                                            MenuButton<String>(
                                              child: normalChildButton,
                                              items: keys,
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
                                          height: cardnumber * 240.toDouble(),
                                          child: GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: cardnumber,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 40,
                                                    childAspectRatio: 0.63,
                                                    crossAxisSpacing: 20),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return NoHoverProjectCard();
                                            },
                                          ),
                                        ),
                                        GradientButton(
                                          title: "Load More",
                                        ),
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
                                                  searched == false
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
                                                          'Showing 1–9 of "${searchedvalue}"',
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
                                                    items: keys,
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
                                                height:
                                                    cardnumber * 140.toDouble(),
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: cardnumber,
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
                                                    return ProjectCard();
                                                  },
                                                ),
                                              ),
                                              GradientButton(
                                                title: "Load More",
                                              ),
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
                                                  searched == false
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
                                                          'Showing 1–9 of "${searchedvalue}"',
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
                                                    items: keys,
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
                                                height:
                                                    cardnumber * 130.toDouble(),
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: cardnumber,
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
                                                    return NoHoverProjectCard();
                                                  },
                                                ),
                                              ),
                                              GradientButton(
                                                title: "Load More",
                                              ),
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
                                                  searched == false
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
                                                          'Showing 1–9 of "${searchedvalue}"',
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
                                                    items: keys,
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
                                                height:
                                                    cardnumber * 445.toDouble(),
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: cardnumber,
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
                                                    return NoHoverProjectCard();
                                                  },
                                                ),
                                              ),
                                              GradientButton(
                                                title: "Load More",
                                              ),
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
                                                searched == false
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
                                                        'Showing 1–9 of "${searchedvalue}"',
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
                                                  items: keys,
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
                                              height:
                                                  cardnumber * 240.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: cardnumber,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.63,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NoHoverProjectCard();
                                                },
                                              ),
                                            ),
                                            GradientButton(
                                              title: "Load More",
                                            ),
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
                                                    algo(query);
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
                                                height: 180,
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 4,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        CategoriesButton(
                                                          categoryName:
                                                              "PYTHON",
                                                          categoryQuantity: 213,
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
                                                "Most Viewed Projects",
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
                                                height: 300,
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 3,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return TopProjects(
                                                      projectName:
                                                          "Computer Vision using Deep Learning and Machine Learning",
                                                      madeBy: "Aryan Solanki",
                                                    );
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
                                              BatchWiseProjects(),
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
                                                height: 180,
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 4,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                      children: [
                                                        CategoriesButton(
                                                          categoryName:
                                                              "PYTHON",
                                                          categoryQuantity: 213,
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
                                                "Most Viewed Projects",
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
                                                height: 300,
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 3,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return TopProjects(
                                                      projectName:
                                                          "Computer Vision using Deep Learning and Machine Learning",
                                                      madeBy: "Aryan Solanki",
                                                    );
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
                                              BatchWiseProjects(),
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
                                              height: 180,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CategoriesButton(
                                                        categoryName: "PYTHON",
                                                        categoryQuantity: 213,
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
                                              "Most Viewed Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 300,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return TopProjects(
                                                    projectName:
                                                        "Computer Vision using Deep Learning and Machine Learning",
                                                    madeBy: "Aryan Solanki",
                                                  );
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
                                              "Batch Wise Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            BatchWiseProjects(),
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
                                                searched == false
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
                                                        'Showing 1–9 of "${searchedvalue}"',
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
                                                  items: keys,
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
                                              height:
                                                  cardnumber * 140.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: cardnumber,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.68,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ProjectCard();
                                                },
                                              ),
                                            ),
                                            GradientButton(
                                              title: "Load More",
                                            ),
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
                                                searched == false
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
                                                        'Showing 1–9 of "${searchedvalue}"',
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
                                                  items: keys,
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
                                              height:
                                                  cardnumber * 130.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: cardnumber,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.63,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NoHoverProjectCard();
                                                },
                                              ),
                                            ),
                                            GradientButton(
                                              title: "Load More",
                                            ),
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
                                                searched == false
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
                                                        'Showing 1–9 of "${searchedvalue}"',
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
                                                  items: keys,
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
                                              height:
                                                  cardnumber * 445.toDouble(),
                                              child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: cardnumber,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 1,
                                                        mainAxisSpacing: 40,
                                                        childAspectRatio: 0.63,
                                                        crossAxisSpacing: 20),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NoHoverProjectCard();
                                                },
                                              ),
                                            ),
                                            GradientButton(
                                              title: "Load More",
                                            ),
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
                                              searched == false
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
                                                      'Showing 1–9 of "${searchedvalue}"',
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
                                                items: keys,
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
                                            height: cardnumber * 240.toDouble(),
                                            child: GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: cardnumber,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 40,
                                                      childAspectRatio: 0.63,
                                                      crossAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return NoHoverProjectCard();
                                              },
                                            ),
                                          ),
                                          GradientButton(
                                            title: "Load More",
                                          ),
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
                                                  algo(query);
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
                                              height: 180,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CategoriesButton(
                                                        categoryName: "PYTHON",
                                                        categoryQuantity: 213,
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
                                              "Most Viewed Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 300,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return TopProjects(
                                                    projectName:
                                                        "Computer Vision using Deep Learning and Machine Learning",
                                                    madeBy: "Aryan Solanki",
                                                  );
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
                                              "Batch Wise Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            BatchWiseProjects(),
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
                                              height: 180,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      CategoriesButton(
                                                        categoryName: "PYTHON",
                                                        categoryQuantity: 213,
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
                                              "Most Viewed Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 300,
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return TopProjects(
                                                    projectName:
                                                        "Computer Vision using Deep Learning and Machine Learning",
                                                    madeBy: "Aryan Solanki",
                                                  );
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
                                              "Batch Wise Projects",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black87,
                                                  fontFamily: "Metrisch-Bold"),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            BatchWiseProjects(),
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
                                            height: 180,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    CategoriesButton(
                                                      categoryName: "PYTHON",
                                                      categoryQuantity: 213,
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
                                            "Most Viewed Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 300,
                                            child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                return TopProjects(
                                                  projectName:
                                                      "Computer Vision using Deep Learning and Machine Learning",
                                                  madeBy: "Aryan Solanki",
                                                );
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
                                            "Batch Wise Projects",
                                            style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.black87,
                                                fontFamily: "Metrisch-Bold"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BatchWiseProjects(),
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
