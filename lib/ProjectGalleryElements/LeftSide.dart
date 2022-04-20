import 'package:algolia/algolia.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/batchwiseprojects.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/categoriesButton.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/topprojects.dart';
import 'package:bennettprojectgallery/services/algoliaService.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeftSide extends StatefulWidget {
  final bool isSearchPage;
  LeftSide({this.isSearchPage = false});

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
      print(snap.hits);
    });
  }

  @override
  void initState() {
    algolia = Application.algolia;
    super.initState();
  }

  String searchedvalue = "";

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: ScreenBreakpoints(tablet: 971, desktop: 971, watch: 300),
      builder: (context, sizingInformation) {
        // Check the sizing information here and retrurn your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Container(
            width: 250,
            child: Column(
              children: [
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
              SizedBox(
                height: 40,
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
