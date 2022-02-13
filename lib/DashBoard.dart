import 'package:bennettprojectgallery/DashBoardElements/RightBoard.dart';
import 'package:bennettprojectgallery/FeaturedProjectsElements/NonHoverFeaturedProjects.dart';
import 'package:bennettprojectgallery/ProjectGalleryElements/ProjectCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'HomePageElements/Header.dart';
import 'ProjectGalleryElements/NoHoverProjectCard.dart';

class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

String selected="zero";
double num_of_reviews=5;

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(current: "Dash Board",),
          Container(
            width: 1050,
            height: MediaQuery.of(context).size.height-60,
            child: MediaQuery.of(context).size.width>645?Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Positioned(
                    left: 0,
                    top: 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 200,right: 20,left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),
                          Text("Your Projects",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold", fontSize: 25)),
                          SizedBox(height: 15,),
                          MediaQuery.of(context).size.width>645? Row(
                            children: [
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="zero";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="zero"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="zero"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="zero"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "166",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="zero"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "All",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="zero"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="one";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="one"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="one"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="one"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "124",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="one"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Accepted",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="one"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="two";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="two"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="two"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="two"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "47",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="two"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="two"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="three";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="three"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="three"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="three"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "102",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="three"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="three"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ):Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      setState(() {
                                        selected="zero";
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      width: 140,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: selected=="zero"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                          color: selected=="zero"?Colors.blue.shade700:Colors.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="zero"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                          SizedBox(height: 3,),
                                          Text(
                                            "166",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="zero"?Colors.white:Colors.black),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            "All",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="zero"?Colors.white:Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  TextButton(
                                    onPressed: (){
                                      setState(() {
                                        selected="one";
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      width: 140,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: selected=="one"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                          color: selected=="one"?Colors.blue.shade700:Colors.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="one"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                          SizedBox(height: 3,),
                                          Text(
                                            "124",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="one"?Colors.white:Colors.black),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            "Accepted",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="one"?Colors.white:Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      setState(() {
                                        selected="two";
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      width: 140,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: selected=="two"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                          color: selected=="two"?Colors.blue.shade700:Colors.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="two"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                          SizedBox(height: 3,),
                                          Text(
                                            "47",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="two"?Colors.white:Colors.black),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="two"?Colors.white:Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  TextButton(
                                    onPressed: (){
                                      setState(() {
                                        selected="three";
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      width: 140,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: selected=="three"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                          color: selected=="three"?Colors.blue.shade700:Colors.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="three"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                          SizedBox(height: 3,),
                                          Text(
                                            "102",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="three"?Colors.white:Colors.black),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="three"?Colors.white:Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount:5,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Container(width: 250,margin: EdgeInsets.only(right: 20),padding: EdgeInsets.only(bottom: 40),child: MediaQuery.of(context).size.width>800?ProjectCard():NoHoverProjectCard());
                                },
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("All Reviews",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold", fontSize: 25)),
                          SizedBox(height: 20,),
                          Container(
                            height: num_of_reviews * 130,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: num_of_reviews.toInt(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image(
                                              fit: BoxFit.cover,
                                              image:NetworkImage("https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Container(
                                        width: MediaQuery.of(context).size.width>1050?900:MediaQuery.of(context).size.width-150,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MediaQuery.of(context).size.width>380?Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "David Parker",
                                                  style: TextStyle(
                                                      color:Colors.black,
                                                      height: 1.3,
                                                      fontFamily: "Metrisch-Medium",
                                                      fontSize: 17),
                                                ),
                                                RatingBarIndicator(
                                                  rating: 3.5,
                                                  itemBuilder: (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 20.0,
                                                  direction: Axis.horizontal,
                                                ),
                                              ],
                                            ):Column(
                                              children: [
                                                Text(
                                                  "David Parker",
                                                  style: TextStyle(
                                                      color:Colors.black,
                                                      height: 1.3,
                                                      fontFamily: "Metrisch-Medium",
                                                      fontSize: 17),
                                                ),
                                                RatingBarIndicator(
                                                  rating: 3.5,
                                                  itemBuilder: (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 20.0,
                                                  direction: Axis.horizontal,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "NOVEMBER 27, 2018",
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 12,
                                                  color: Colors.black26),
                                            ),
                                            SizedBox(height: 8,),
                                            Text(
                                              "This is a useful post for finding broken links within the website, what about links pointing outwards that are broken? I can use a free web service but wondered if this was possible.",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Metrisch-Medium",
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54),
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
                          SizedBox(height: 15,),

                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                    top: 0,
                    child: RightBoard()
                )
              ],
            ):SingleChildScrollView(
              child: Column(
                children: [
                  RightBoard(),
                  Padding(
                    padding: EdgeInsets.only(top: 20,right: 20,left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text("Your Projects",
                            style: TextStyle(
                                fontFamily: "Metrisch-Bold", fontSize: 25)),
                        SizedBox(height: 15,),
                        MediaQuery.of(context).size.width>645? Row(
                          children: [
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  selected="zero";
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                width: 140,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: selected=="zero"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                    color: selected=="zero"?Colors.blue.shade700:Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="zero"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                    SizedBox(height: 3,),
                                    Text(
                                      "166",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="zero"?Colors.white:Colors.black),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "All",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="zero"?Colors.white:Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  selected="one";
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                width: 140,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: selected=="one"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                    color: selected=="one"?Colors.blue.shade700:Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="one"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                    SizedBox(height: 3,),
                                    Text(
                                      "124",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="one"?Colors.white:Colors.black),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Accepted",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="one"?Colors.white:Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  selected="two";
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                width: 140,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: selected=="two"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                    color: selected=="two"?Colors.blue.shade700:Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="two"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                    SizedBox(height: 3,),
                                    Text(
                                      "47",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="two"?Colors.white:Colors.black),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="two"?Colors.white:Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            TextButton(
                              onPressed: (){
                                setState(() {
                                  selected="three";
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                width: 140,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: selected=="three"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                    color: selected=="three"?Colors.blue.shade700:Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="three"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                    SizedBox(height: 3,),
                                    Text(
                                      "102",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="three"?Colors.white:Colors.black),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="three"?Colors.white:Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ):MediaQuery.of(context).size.width>335?Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      selected="zero";
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    width: 140,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: selected=="zero"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                        color: selected=="zero"?Colors.blue.shade700:Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="zero"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                        SizedBox(height: 3,),
                                        Text(
                                          "166",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="zero"?Colors.white:Colors.black),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "All",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="zero"?Colors.white:Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      selected="one";
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    width: 140,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: selected=="one"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                        color: selected=="one"?Colors.blue.shade700:Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="one"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                        SizedBox(height: 3,),
                                        Text(
                                          "124",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="one"?Colors.white:Colors.black),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "Accepted",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="one"?Colors.white:Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      selected="two";
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    width: 140,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: selected=="two"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                        color: selected=="two"?Colors.blue.shade700:Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="two"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                        SizedBox(height: 3,),
                                        Text(
                                          "47",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="two"?Colors.white:Colors.black),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="two"?Colors.white:Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      selected="three";
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    width: 140,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: selected=="three"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                        color: selected=="three"?Colors.blue.shade700:Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="three"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                        SizedBox(height: 3,),
                                        Text(
                                          "102",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="three"?Colors.white:Colors.black),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="three"?Colors.white:Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ):Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="zero";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="zero"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="zero"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="zero"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "166",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="zero"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "All",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="zero"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="one";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="one"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="one"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="one"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "124",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="one"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Accepted",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="one"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="two";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="two"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="two"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="two"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "47",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="two"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="two"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              TextButton(
                                onPressed: (){
                                  setState(() {
                                    selected="three";
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  width: 140,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: selected=="three"?null:Border.all(color:Colors.blue.shade700,width: 2),
                                      color: selected=="three"?Colors.blue.shade700:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(alignment: Alignment.topRight,child: Icon(Icons.circle,color: selected=="three"?Colors.lightGreenAccent:Colors.brown,size: 10,)),
                                      SizedBox(height: 3,),
                                      Text(
                                        "102",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Bold",fontSize: 18,color:selected=="three"?Colors.white:Colors.black),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Rejected",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Metrisch-Medium",fontSize: 13,color:selected=="three"?Colors.white:Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:5,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Container(width: 250,margin: EdgeInsets.only(right: 20),padding: EdgeInsets.only(bottom: 40),child: MediaQuery.of(context).size.width>800?ProjectCard():NoHoverProjectCard());
                            },
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("All Reviews",
                            style: TextStyle(
                                fontFamily: "Metrisch-Bold", fontSize: 25)),
                        SizedBox(height: 20,),
                        Container(
                          height: MediaQuery.of(context).size.width>380?num_of_reviews * 130:num_of_reviews*150,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: num_of_reviews.toInt(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 30),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image(
                                            fit: BoxFit.cover,
                                            image:NetworkImage("https://th.bing.com/th/id/OIP.c0GTqHSPgp9rz7Pn2Aw_8wHaF7?pid=ImgDet&rs=1")
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                    Container(
                                      width: MediaQuery.of(context).size.width>1050?900:MediaQuery.of(context).size.width-150,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MediaQuery.of(context).size.width>380?Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "David Parker",
                                                style: TextStyle(
                                                    color:Colors.black,
                                                    height: 1.3,
                                                    fontFamily: "Metrisch-Medium",
                                                    fontSize: 17),
                                              ),
                                              RatingBarIndicator(
                                                rating: 3.5,
                                                itemBuilder: (context, index) => Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                direction: Axis.horizontal,
                                              ),
                                            ],
                                          ):Column(
                                            children: [
                                              Text(
                                                "David Parker",
                                                style: TextStyle(
                                                    color:Colors.black,
                                                    height: 1.3,
                                                    fontFamily: "Metrisch-Medium",
                                                    fontSize: 17),
                                              ),
                                              RatingBarIndicator(
                                                rating: 3.5,
                                                itemBuilder: (context, index) => Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                direction: Axis.horizontal,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            "NOVEMBER 27, 2018",
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.5,
                                                fontSize: 12,
                                                color: Colors.black26),
                                          ),
                                          SizedBox(height: 8,),
                                          Text(
                                            "This is a useful post for finding broken links within the website, what about links pointing outwards that are broken? I can use a free web service but wondered if this was possible.",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Metrisch-Medium",
                                                height: 1.5,
                                                fontSize: 15,
                                                color: Colors.black54),
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
                        SizedBox(height: 15,),

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
