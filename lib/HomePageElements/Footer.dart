import 'package:bennettprojectgallery/HomePageElements/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatefulWidget {

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/footerimg.png"),
            fit: BoxFit.cover
        ),
        color: Color(0xfff5f6fb),
      ),

      height: 700,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:EdgeInsets.only(top: 300,left: MediaQuery.of(context).size.width/20,right: MediaQuery.of(context).size.width/20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(height: 65,),
                          Container(
                            width: 270,
                            child: Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum.",style: TextStyle(
                                fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,

                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 10,)),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,

                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 10,)),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,

                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 10,)),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,

                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 10,)),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,

                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 10,)),
                              ),

                            ],
                          )
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Services",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold",height: 1.8,fontSize: MediaQuery.of(context).size.height/33,color: Colors.white)
                          ),
                          SizedBox(height: 30,),
                          InkWell(
                            onHover: (x){
                              if(x){
                                setState(() {

                                });

                              }
                              else{
                                setState(() {

                                });
                              }
                            },
                            child: Text("Search Engine Marketing",style: TextStyle(
                                fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                          ),
                          InkWell(
                            onHover: (x){
                              if(x){
                                setState(() {

                                });

                              }
                              else{
                                setState(() {

                                });
                              }
                            },
                            child: Text("Search Engine Marketing",style: TextStyle(
                                fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                          ),
                          InkWell(
                            onHover: (x){
                              if(x){
                                setState(() {

                                });

                              }
                              else{
                                setState(() {

                                });
                              }
                            },
                            child: Text("Search Engine Marketing",style: TextStyle(
                                fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                          ),
                          InkWell(
                            onHover: (x){
                              if(x){
                                setState(() {

                                });

                              }
                              else{
                                setState(() {

                                });
                              }
                            },
                            child: Text("Search Engine Marketing",style: TextStyle(
                                fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                          ),
                          InkWell(
                            onHover: (x){
                              if(x){
                                setState(() {

                                });

                              }
                              else{
                                setState(() {

                                });
                              }
                            },
                            child: Text("Search Engine Marketing",style: TextStyle(
                                fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                          ),
                        ],

                      ),
                      Container(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Contacts",
                                style: TextStyle(
                                    fontFamily: "Metrisch-Bold",height: 1.8,fontSize: MediaQuery.of(context).size.height/33,color: Colors.white)
                            ),
                            SizedBox(height: 30,),
                            InkWell(
                              onHover: (x){
                                if(x){
                                  setState(() {

                                  });

                                }
                                else{
                                  setState(() {

                                  });
                                }
                              },
                              child: Text("Adress: 27 Division St, New York, NY 10002, United States of America",style: TextStyle(
                                  fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                            ),
                            InkWell(
                              onHover: (x){
                                if(x){
                                  setState(() {

                                  });

                                }
                                else{
                                  setState(() {

                                  });
                                }
                              },
                              child: Text("Website: seofy.com",style: TextStyle(
                                  fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                            ),
                            InkWell(
                              onHover: (x){
                                if(x){
                                  setState(() {

                                  });

                                }
                                else{
                                  setState(() {

                                  });
                                }
                              },
                              child: Text("Email: seofy@mail.com",style: TextStyle(
                                  fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                            ),
                            InkWell(
                              onHover: (x){
                                if(x){
                                  setState(() {

                                  });

                                }
                                else{
                                  setState(() {

                                  });
                                }
                              },
                              child: Text("Phone: +91 92385 78339",style: TextStyle(
                                  fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/46,color: Colors.white)),
                            ),
                          ],

                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Updates",
                              style: TextStyle(
                                  fontFamily: "Metrisch-Bold",height: 1.8,fontSize: MediaQuery.of(context).size.height/33,color: Colors.white)
                          ),
                          SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey.shade200,
                            ),


                            height: 50,
                            width: 200,
                            child: TextField(
                              style: TextStyle(

                                  fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                              onChanged: (value) {
                                //Do something with the user input.
                              },
                              decoration: InputDecoration(

                                border: InputBorder.none,
                                hintStyle: TextStyle(

                                    fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                                hintText: 'Enter Your Email *',
                                // contentPadding:
                                // EdgeInsets.symmetric(horizontal: 20.0),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                // ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          GradientButton(title: "Sign In",buttonwidth: 200,),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 100,),
                  Container(
                    height: 1,
                    color: Colors.white24,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Terms of use | Privacy Environmental Policy",style: TextStyle(
                          fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/56,color: Colors.white)

                      ),
                      Text(
                          "Copyright © 2021 Bennett University. All Rights Reserved.",style: TextStyle(
                          fontFamily: "Metrisch-Medium",height: 1.8, fontSize: MediaQuery.of(context).size.height/56,color: Colors.white)

                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -40,
              child: Image(
                height: 90,
                image: AssetImage("assets/logo1.png",),
                fit: BoxFit.fill,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

