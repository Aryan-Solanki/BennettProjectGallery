import 'package:bennettprojectgallery/login.dart';
import 'package:bennettprojectgallery/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends StatefulWidget {
  final String current;
  const Header({
    this.current,
  });

  @override
  _HeaderState createState() => _HeaderState();
}
String hover="";
bool mobilemenu=false;

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:Color(0xff101770),
      borderOnForeground: true,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: ResponsiveBuilder(
        breakpoints: ScreenBreakpoints(
            tablet: 550,
            desktop: 790,
            watch: 300
        ),
        builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType ==
              DeviceScreenType.desktop) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              width: MediaQuery.of(context).size.width,
              color: Color(0xff101770),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Home";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Home"?Colors.white:hover=="Home"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("Home",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.white60,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="About";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="About"?Colors.white:hover=="About"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("About",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.white60,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Project Gallery";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Project Gallery"?Colors.white:hover=="Project Gallery"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("Project Gallery",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.white60,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Achievers";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Achievers"?Colors.white:hover=="Achievers"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("Achievers",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.white60,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Times of Bennett";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Times of Bennett"?Colors.white:hover=="Times of Bennett"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("Times of Bennett",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.white60,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Contact";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Contact"?Colors.white:hover=="Contact"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("Contact",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(width: 1,color: Colors.white60,height: 18,),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      onHover: (x){
                        if(x){
                          setState(() {
                            hover="Sign In";
                          });
                        }
                        else{
                          setState(() {
                            hover="";
                          });

                        }

                      },
                      style: TextButton.styleFrom(
                        primary: Color(0xff101770),
                        // padding: EdgeInsets.all(0.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Sign In"?Colors.white:hover=="Sign In"?Colors.white60:Colors.transparent,),),
                          ),
                          child: Text("Sign In",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                      )
                  ),

                ],
              ),
            );
          }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            width: MediaQuery.of(context).size.width,
            color: Color(0xff101770),
            // height: 50,
            child: Column(
              children: [
                mobilemenu==true?AnimatedContainer(
                  height: 335,
                  duration: Duration(milliseconds: 600),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.facebookF,size: 18,color: Colors.white,),
                            SizedBox(width: 27,),
                            FaIcon(FontAwesomeIcons.twitter,size: 18,color: Colors.white),
                            SizedBox(width: 27,),
                            FaIcon(FontAwesomeIcons.linkedinIn,size: 18,color: Colors.white),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          color: Colors.white60,
                          height: 1,
                          width: 300,
                        ),
                        SizedBox(height: 20,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Home";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Home"?Colors.white:hover=="Home"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Home",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="About";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="About"?Colors.white:hover=="About"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("About",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Project Gallery";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Project Gallery"?Colors.white:hover=="Project Gallery"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Project Gallery",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Achievers";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Achievers"?Colors.white:hover=="Achievers"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Achievers",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Times of Bennett";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Times of Bennett"?Colors.white:hover=="Times of Bennett"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Times of Bennett",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Contact";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Contact"?Colors.white:hover=="Contact"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Contact",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Sign In";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Sign In"?Colors.white:hover=="Sign In"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Sign In",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),

                      ],
                    ),
                  ),
                ):AnimatedContainer(
                  height: 0,
                  duration: Duration(milliseconds: 600),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.facebookF,size: 18,color: Colors.white,),
                            SizedBox(width: 27,),
                            FaIcon(FontAwesomeIcons.twitter,size: 18,color: Colors.white),
                            SizedBox(width: 27,),
                            FaIcon(FontAwesomeIcons.linkedinIn,size: 18,color: Colors.white),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          color: Colors.white60,
                          height: 1,
                          width: 300,
                        ),
                        SizedBox(height: 20,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Home";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Home"?Colors.white:hover=="Home"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Home",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="About";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="About"?Colors.white:hover=="About"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("About",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Project Gallery";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Project Gallery"?Colors.white:hover=="Project Gallery"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Project Gallery",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Achievers";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Achievers"?Colors.white:hover=="Achievers"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Achievers",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Times of Bennett";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Times of Bennett"?Colors.white:hover=="Times of Bennett"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Times of Bennett",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){

                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Contact";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Contact"?Colors.white:hover=="Contact"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Contact",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            onHover: (x){
                              if(x){
                                setState(() {
                                  hover="Sign In";
                                });
                              }
                              else{
                                setState(() {
                                  hover="";
                                });

                              }

                            },
                            style: TextButton.styleFrom(
                              primary: Color(0xff101770),
                              // padding: EdgeInsets.all(0.0),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1.0, color: widget.current=="Sign In"?Colors.white:hover=="Sign In"?Colors.white60:Colors.transparent,),),
                                ),
                                child: Text("Sign In",style: TextStyle(color: Colors.white,fontFamily: "Metrisch-Bold"),)
                            )
                        ),

                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  height: 50,
                  duration: Duration(seconds: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          if(mobilemenu==true){
                            setState(() {
                              mobilemenu=false;
                            });

                          }
                          else{
                            setState(() {
                              mobilemenu=true;
                            });
                          }
                        },
                          child: Icon(Icons.menu,color: Colors.white,)
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
