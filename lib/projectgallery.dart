import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:flutter/material.dart';

class ProjectGallery extends StatefulWidget {

  @override
  _ProjectGalleryState createState() => _ProjectGalleryState();
}

class _ProjectGalleryState extends State<ProjectGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(current: "Project Gallery",),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Row(
                  children: [
                    LeftSide()
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
