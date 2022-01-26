import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BlueBanner extends StatefulWidget {

  @override
  _BlueBannerState createState() => _BlueBannerState();
}

class _BlueBannerState extends State<BlueBanner> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width>1100?Container(
      height: 450,
      width: MediaQuery.of(context).size.width ,
      color: Color(0xff101770),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Learn",
              style: TextStyle(
                  fontFamily: "Metrisch-ExtraBold", color: Colors.white.withOpacity(0.1),fontSize: 180),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 8,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        height: 250,
                        width: 250,
                        image: NetworkImage("https://www.bennett.edu.in/wp-content/uploads/2021/07/MCE-LAB-Sharp-and-Innovative-Brains.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: -35,
                      bottom: -35,
                      child: Card(
                        elevation: 8,
                        child:  Container(
                          padding: EdgeInsets.all(10),
                          height: 150,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              image: NetworkImage("https://rukminim1.flixcart.com/image/416/416/kckud8w0/book/4/9/9/the-world-of-particles-original-imaftz8wwxnwaxru.jpeg?q=70"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade400,
                        ),
                        width: 10,
                        height: 2,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade400,
                        ),
                        width: 50,
                        height: 2,
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade400,
                        ),
                        width: 10,
                        height: 2,
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Get Started Today",
                    style: TextStyle(
                        fontFamily: "Metrisch-Bold", color: Colors.white,fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 400,
                    child: Text(
                      "Project Showcase - For people who wants to learn from others shs Project Showcase - For people who wants to learn from others egs ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Metrisch-Medium",height: 1.7, fontSize: 15,color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                ],
              ),
              SizedBox(width: 50,),
              Card(
                elevation: 8,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        height: 250,
                        width: 250,
                        image: NetworkImage("https://www.bennett.edu.in/wp-content/uploads/2021/07/CSE-LAB-learning-technology.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      left: -35,
                      child: Card(
                        elevation: 8,
                        child:  Container(
                          padding: EdgeInsets.all(10),
                          height: 150,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              image: NetworkImage("https://rukminim1.flixcart.com/image/416/416/kckud8w0/book/4/9/9/the-world-of-particles-original-imaftz8wwxnwaxru.jpeg?q=70"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    ):Container(
      height: 930,
      width: MediaQuery.of(context).size.width ,
      color: Color(0xff101770),
      child: Stack(
        children: [
          Center(
            child: Text(
              "Learn",
              style: TextStyle(
                  fontFamily: "Metrisch-ExtraBold",overflow: TextOverflow.visible ,color: Colors.white.withOpacity(0.1),fontSize: MediaQuery.of(context).size.width>390?140:95),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Positioned(
                  top: 100,
                  left: 70,
                  child: Card(
                    elevation: 8,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            height: 250,
                            width: 250,
                            image: NetworkImage("https://www.bennett.edu.in/wp-content/uploads/2021/07/MCE-LAB-Sharp-and-Innovative-Brains.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: -35,
                          bottom: -35,
                          child: Card(
                            elevation: 8,
                            child:  Container(
                              padding: EdgeInsets.all(10),
                              height: 150,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image(
                                  image: NetworkImage("https://rukminim1.flixcart.com/image/416/416/kckud8w0/book/4/9/9/the-world-of-particles-original-imaftz8wwxnwaxru.jpeg?q=70"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange.shade400,
                      ),
                      width: 10,
                      height: 2,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange.shade400,
                      ),
                      width: 50,
                      height: 2,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange.shade400,
                      ),
                      width: 10,
                      height: 2,
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "Get Started Today",
                  style: TextStyle(
                      fontFamily: "Metrisch-Bold", color: Colors.white,fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: 400,
                  child: Text(
                    "Project Showcase - For people who wants to learn from others shs Project Showcase - For people who wants to learn from others egs ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Metrisch-Medium",height: 1.7, fontSize: 15,color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Positioned(
                  top: 100,
                  right: 70,
                  child: Card(
                    elevation: 8,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            height: 250,
                            width: 250,
                            image: NetworkImage("https://www.bennett.edu.in/wp-content/uploads/2021/07/CSE-LAB-learning-technology.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -35,
                          left: -35,
                          child: Card(
                            elevation: 8,
                            child:  Container(
                              padding: EdgeInsets.all(10),
                              height: 150,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image(
                                  image: NetworkImage("https://rukminim1.flixcart.com/image/416/416/kckud8w0/book/4/9/9/the-world-of-particles-original-imaftz8wwxnwaxru.jpeg?q=70"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
