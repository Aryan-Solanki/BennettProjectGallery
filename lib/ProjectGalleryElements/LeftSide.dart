import 'package:algolia/algolia.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/batchwiseprojects.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/categoriesButton.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/topprojects.dart';
import 'package:bennettprojectgallery/services/algoliaService.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeftSide extends StatefulWidget {
  @override
  _LeftSideState createState() => _LeftSideState();
}

bool button1hover = false;
bool button2hover = false;
bool button3hover = false;

class _LeftSideState extends State<LeftSide> {
  AlgoliaQuery algoliaQuery;
  Algolia algolia;


  List<AlgoliaObjectSnapshot> _results = [];
  void algo(String val) async {
    AlgoliaQuery query =
        algolia.instance.index("project").query(val).setHitsPerPage(9);
    AlgoliaQuerySnapshot snap = await query.getObjects();
    _results = snap.hits;
    setState(() {
      print(snap.nbHits);
    });
  }

  @override
  void initState() {
    algolia = Application.algolia;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: ScreenBreakpoints(tablet: 971, desktop: 1140, watch: 300),
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Container(
            width: 250,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                      suffixIcon: Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.black,
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
                    onSubmitted: (query) {
                      algo(query);
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                    physics: NeverScrollableScrollPhysics(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                    physics: NeverScrollableScrollPhysics(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Container(
            width: 220,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                      suffixIcon: Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.black,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                    physics: NeverScrollableScrollPhysics(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                    physics: NeverScrollableScrollPhysics(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                    suffixIcon: Icon(
                      Icons.search,
                      size: 22,
                      color: Colors.black,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
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
                  physics: NeverScrollableScrollPhysics(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
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
                  physics: NeverScrollableScrollPhysics(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
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
                      borderRadius: BorderRadius.circular(5),
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
    );
  }
}
