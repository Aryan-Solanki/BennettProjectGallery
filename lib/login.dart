import 'package:bennettprojectgallery/HomePageElements/Header.dart';
import 'package:bennettprojectgallery/LoginPageElements/LoginCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(current: "Login",),
          SizedBox(height: 70,),
          Container(
            padding:  EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 100,
                      image: AssetImage("assets/logo1.png",),
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 10,),
                    Text("Welcome to the \nBennett University \nGallery Area",
                        style: TextStyle(
                          height: 1.3,
                            fontFamily: "Metrisch-ExtraBold", fontSize: MediaQuery.of(context).size.height/23)),
                    SizedBox(height: 25,),
                    Container(
                      width: 250,
                      child: Text(
                        "We enjoy adapting our strategies to offer every client the best ",
                        style: TextStyle(
                            fontFamily: "Metrisch-Medium",height: 1.5, fontSize: MediaQuery.of(context).size.height/46,color: Colors.black54),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      padding: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black),),
                      ),
                      child: Text("+91 7983 737272",
                          style: TextStyle(
                              fontFamily: "Metrisch-ExtraBold", fontSize: MediaQuery.of(context).size.height/30)),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black),),
                      ),
                      child: Text("+91 9827 475613",
                          style: TextStyle(
                              fontFamily: "Metrisch-ExtraBold", fontSize: MediaQuery.of(context).size.height/30)),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.facebookF,size: 18,),
                        SizedBox(width: 10,),
                        FaIcon(FontAwesomeIcons.twitter,size: 18),
                        SizedBox(width: 10,),
                        FaIcon(FontAwesomeIcons.linkedinIn,size: 18),
                      ],
                    ),
                    SizedBox(height: 130,)


                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container( height: MediaQuery.of(context).size.height/1.4,child: Image(image:AssetImage("assets/loginpageimg.png"))),
                    LoginCard(),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
