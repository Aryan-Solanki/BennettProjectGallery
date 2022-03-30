import 'package:bennettprojectgallery/HomePageElements/Footer.dart';
import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/LeftSide.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
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
                              LeftSide(),
                              SizedBox(width: 50,),
                              RightSide(),
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
                                  RightSide(),
                                  SizedBox(height: 80,),
                                  LeftSide(),
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
                                RightSide(),
                                SizedBox(height: 80,),
                                LeftSide(),
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
