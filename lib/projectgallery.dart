import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:flutter/material.dart';

import 'ProjectGalleryElements/RightSide.dart';

class ProjectGallery extends StatefulWidget {

  @override
  _ProjectGalleryState createState() => _ProjectGalleryState();
}

class _ProjectGalleryState extends State<ProjectGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(current: "Project Gallery",),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    LeftSide(),
                    SizedBox(width: 50,),
                    RightSide(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
