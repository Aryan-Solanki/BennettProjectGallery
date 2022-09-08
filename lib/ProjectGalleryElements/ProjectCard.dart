import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:bennettprojectgallery/models/Project.dart';
import 'package:bennettprojectgallery/project_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  ProjectCard({
    @required this.project,
  });
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

bool hover = false;

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    String cat = "";
    for (int i = 0; i < widget.project.Categories.length; i++) {
      cat += widget.project.Categories[i];
      cat += " ";
    }

    double rating = 0.0;
    int reviewLength = widget.project.Reviews.length;
    if (reviewLength == 0) {
      rating = 0.0;
    } else {
      for (int i = 0; i < reviewLength; i++) {
        rating += widget.project.Reviews[i]["rating"];
      }
      rating = rating / reviewLength;
    }
    // for (int i = 0; i < widget.project.Reviews.length; i++) {
    //   rating += widget.project.Reviews[i]["rating"];
    // }
    // rating = rating / widget.project.Reviews.length;

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        primary: Colors.white,
        padding: EdgeInsets.all(0.0),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ProjectDetail(
                  project: widget.project,
                  cat: cat,
                  rating: rating,
                )));
      },
      onHover: (x) {
        if (x) {
          setState(() {
            hover = true;
          });
        } else {
          setState(() {
            hover = false;
          });
        }
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Card(
            shadowColor: Colors.black,
            elevation: hover == true ? 8 : 1,
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 200,
                        width: 180,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.project.images[0]))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        widget.project.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Metrisch-Bold",
                            fontSize: 15,
                            color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        cat,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Metrisch-Medium",
                            fontSize: 13,
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            child: AnimatedContainer(
              margin: EdgeInsets.only(
                  bottom: (hover) ? 20 : 0.0, top: (hover) ? 0 : 20),
              duration: Duration(milliseconds: 500),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: hover ? 1.0 : 0.0,
                child: GradientButton(
                  title: "Open Project",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProjectDetail(
                              project: widget.project,
                              cat: cat,
                              rating: rating,
                            )));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
